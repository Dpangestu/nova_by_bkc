import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nova_by_bkc/app/commons/helpers/auth_helper.dart';
import 'package:nova_by_bkc/app/routes/app_pages.dart';
import 'package:nova_by_bkc/app/modules/cabang/home/controllers/home_controller.dart';

class HomeScreen extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
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
        child: Text('Welcome to the home!  ${AuthHelper.user!.name}'),
      ),
    );
  }
}
