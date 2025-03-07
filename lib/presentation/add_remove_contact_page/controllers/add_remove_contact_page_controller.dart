import 'dart:convert';

import 'package:flutter_safe_bd/constants/constant_keys.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/contact_model.dart';

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
        ContactModel(name: name, phoneNumber: phone, whatsapp: whatsapp),
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

    update();
  }
}
