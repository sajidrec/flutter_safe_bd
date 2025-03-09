import 'dart:convert';

import 'package:flutter_safe_bd/constants/constant_keys.dart';
import 'package:flutter_safe_bd/models/contact_model.dart';
import 'package:flutter_safe_bd/presentation/home/controller/home_page_controller.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddRemoveContactPageController extends GetxController {
  List<ContactModel> _listOfContacts = [];

  List<ContactModel> get getListOfContacts => _listOfContacts;

  Future<void> fetchContacts() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    List<String> trustedContactList =
        sharedPreferences.getStringList(ConstantKeys.contactListKey) ?? [];

    _listOfContacts = [];

    for (String element in trustedContactList) {
      _listOfContacts.add(ContactModel.fromJson(jsonDecode(element)));
    }

    update();
  }

  Future<void> addContact({
    required String name,
    required String phone,
    required String whatsapp,
  }) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    List<String> trustedContactList =
        sharedPreferences.getStringList(ConstantKeys.contactListKey) ?? [];

    trustedContactList.add(
      jsonEncode(
        ContactModel(
          name: name,
          phoneNumber: "+88$phone",
          whatsapp: "+88$whatsapp",
        ),
      ),
    );

    await sharedPreferences.setStringList(
      ConstantKeys.contactListKey,
      trustedContactList,
    );

    _listOfContacts = [];

    for (String element in trustedContactList) {
      _listOfContacts.add(ContactModel.fromJson(jsonDecode(element)));
    }

    Get.find<HomePageController>().fetchContactList();

    update();
  }

  Future<void> removeContact({required int index}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    _listOfContacts.removeAt(index);

    List<String> trustedContactList =
        sharedPreferences.getStringList(ConstantKeys.contactListKey) ?? [];

    trustedContactList.removeAt(index);

    await sharedPreferences.setStringList(
      ConstantKeys.contactListKey,
      trustedContactList,
    );

    Get.find<HomePageController>().fetchContactList();

    update();
  }
}
