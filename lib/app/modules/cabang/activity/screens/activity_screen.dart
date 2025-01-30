import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nova_by_bkc/app/commons/helpers/auth_helper.dart';
import 'package:nova_by_bkc/app/routes/app_pages.dart';
import 'package:nova_by_bkc/app/modules/cabang/activity/controllers/activity_controller.dart';

class ActivityScreen extends GetView<ActivityController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
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
        child: Text('Welcome to the activity!  ${AuthHelper.user!.name}'),
      ),
    );
  }
}
