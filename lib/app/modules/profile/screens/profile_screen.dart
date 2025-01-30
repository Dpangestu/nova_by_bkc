import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nova_by_bkc/app/commons/helpers/auth_helper.dart';
import 'package:nova_by_bkc/app/routes/app_pages.dart';
import 'package:nova_by_bkc/app/modules/profile/controllers/profile_controller.dart';

class ProfileScreen extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        actions: [
          IconButton(
            icon: Icon(Icons.savings),
            onPressed: () {
              Get.toNamed(Routes.TABUNGAN);
            },
          ),
        ],
      ),
      body: Center(
        child: Text('Welcome to the profile!  ${AuthHelper.user!.name}'),
      ),
    );
  }
}
