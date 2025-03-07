import 'dart:async';

import 'package:flutter_safe_bd/models/contact_model.dart';
import 'package:flutter_safe_bd/presentation/add_remove_contact_page/controllers/add_remove_contact_page_controller.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

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
    timer = Timer.periodic(Duration(seconds: 10), (timer) async {
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
}
