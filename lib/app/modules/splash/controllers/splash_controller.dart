import 'dart:async';

import 'package:nova_by_bkc/app/commons/helpers/auth_helper.dart';
import 'package:nova_by_bkc/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    _toLogin();
  }

  void _toLogin() {
    Timer(const Duration(seconds: 2), () {
      // if (AuthHelper.isLoggedIn) {
      //   Get.offAndToNamed(Routes.DASHBOARD);
      // } else {
      Get.offAndToNamed(Routes.LOGIN);
      // }
    });
  }
}
