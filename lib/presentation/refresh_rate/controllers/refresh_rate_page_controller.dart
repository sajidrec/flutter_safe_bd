import 'package:flutter_safe_bd/constants/constant_keys.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RefreshRatePageController extends GetxController {
  Future<void> addRefreshRate({required String rate}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    if (int.tryParse(rate) != null) {
      await sharedPreferences.setInt(
        ConstantKeys.refreshRateKey,
        int.tryParse(rate) ?? 10,
      );
    }
  }

  Future<int> getRefreshRate() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return  (sharedPreferences.getInt(ConstantKeys.refreshRateKey) ?? 10) ;
  }
}
