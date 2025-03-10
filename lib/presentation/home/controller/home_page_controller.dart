import 'dart:async';

import 'package:flutter_safe_bd/models/contact_model.dart';
import 'package:flutter_safe_bd/presentation/add_remove_contact_page/controllers/add_remove_contact_page_controller.dart';
import 'package:flutter_safe_bd/presentation/customize_message/controllers/customize_message_page_controller.dart';
import 'package:flutter_safe_bd/presentation/refresh_rate/controllers/refresh_rate_page_controller.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../utils/custom_message.dart';

class HomePageController extends GetxController {
  Position _position = Position(
    longitude: 0,
    latitude: 0,
    timestamp: DateTime.now(),
    accuracy: 0,
    altitude: 0,
    altitudeAccuracy: 0,
    heading: 0,
    headingAccuracy: 0,
    speed: 0,
    speedAccuracy: 0,
  );

  Timer? timer;

  bool _autoRefreshButtonOn = false;

  bool get getAutoRefreshButtonOn => _autoRefreshButtonOn;

  bool _updateLocationInProgress = false;

  bool get getUpdateLocationInProgress => _updateLocationInProgress;

  Position get getCurrentPosition => _position;

  List<ContactModel> _listOfContacts = [];

  List<ContactModel> get getListOfContacts => _listOfContacts;

  Future<void> fetchCurrentPosition() async {
    _updateLocationInProgress = true;
    update();

    _position = await Geolocator.getCurrentPosition(
      locationSettings: LocationSettings(accuracy: LocationAccuracy.best),
    );

    _updateLocationInProgress = false;
    update();
  }

  Future<void> updateLocationAfterInterval() async {
    _autoRefreshButtonOn = true;
    update();
    int intervalTime = 10;
    intervalTime = await Get.find<RefreshRatePageController>().getRefreshRate();
    timer = Timer.periodic(Duration(seconds: intervalTime), (timer) async {
      await fetchCurrentPosition();
    });
  }

  void stopLocationUpdateInterval() {
    timer?.cancel();
    _autoRefreshButtonOn = false;
    update();
  }

  void fetchContactList() {
    _listOfContacts =
        Get.find<AddRemoveContactPageController>().getListOfContacts;
    update();
  }

  Future<void> sendSmsSingleContact({required String phoneNumber}) async {
    final Uri smsUri = Uri(
      scheme: 'sms',
      path: phoneNumber,
      queryParameters: <String, String>{
        'body':
            "${Get.find<CustomizeMessagePageController>().getCustomMessage}\n${CustomMessage.defaultMessage(position: _position)}",
      },
    );

    await launchUrl(smsUri, mode: LaunchMode.externalApplication);
  }

  Future<void> sendSmsToAll() async {
    List<String> allNumberList = [];

    for (ContactModel contact in _listOfContacts) {
      allNumberList.add(contact.phoneNumber ?? "");
    }

    final Uri smsUri = Uri(
      scheme: 'sms',
      path: allNumberList.join(","),
      queryParameters: <String, String>{
        'body':
            "${Get.find<CustomizeMessagePageController>().getCustomMessage}\n${CustomMessage.defaultMessage(position: _position)}",
      },
    );

    await launchUrl(smsUri, mode: LaunchMode.externalApplication);
  }

  Future<void> sendWhatsAppMessage(String phoneNumber) async {
    final Uri url = Uri.parse(
      "https://wa.me/$phoneNumber?text=${Uri.encodeComponent("${Get.find<CustomizeMessagePageController>().getCustomMessage}\n${CustomMessage.defaultMessage(position: _position)}")}",
    );

    await launchUrl(url, mode: LaunchMode.externalApplication);
  }
}
