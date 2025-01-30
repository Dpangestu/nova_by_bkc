import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nova_by_bkc/app/commons/helpers/auth_helper.dart';
import 'package:nova_by_bkc/app/commons/widgets/show_dialog.dart';
import 'package:nova_by_bkc/app/modules/cabang/activity/screens/activity_screen.dart';
import 'package:nova_by_bkc/app/modules/cabang/dashboard/controllers/dashboard_controller.dart';
import 'package:nova_by_bkc/app/modules/cabang/home/screens/home_screen.dart';
import 'package:nova_by_bkc/app/modules/profile/screens/profile_screen.dart';
import 'package:nova_by_bkc/app/routes/app_pages.dart';
import 'package:lazy_load_indexed_stack/lazy_load_indexed_stack.dart';

class DashboardScreen extends GetView<DashboardController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF1F1F1),
      body: Obx(() {
        return LazyLoadIndexedStack(
          index: controller.currentTab.value,
          children: [
            HomeScreen(),
            ActivityScreen(),
            ProfileScreen(),
            // Logout()
          ],
        );
      }),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          if (AuthHelper.isAOKredit() ||
              AuthHelper.isKacab() ||
              AuthHelper.isAccountOfficer() ||
              AuthHelper.isKasie()) {
            Get.toNamed('/setor-tunai');
          } else {
            DialogHelper.showCustomDialog(
              context,
              'Akses Ditolak',
              'Anda tidak memiliki akses untuk ini',
              isError: true,
            );
          }
        },
        backgroundColor: const Color(0xFF225CAB),
        elevation: 6,
        shape: const CircleBorder(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildNavItem(0, FeatherIcons.home, 'Beranda'),
                  _buildNavItem(1, FeatherIcons.fileText, 'Aktifitas'),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildNavItem(2, FeatherIcons.user, 'Profil'),
                  _buildNavItem(3, FeatherIcons.logOut, 'Keluar'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, IconData icon, String label) {
    return Obx(() {
      return MaterialButton(
        minWidth: 40,
        onPressed: () {
          if (index == 3) {
            controller.confirmLogout();
          } else {
            controller.changeTab(index);
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 24,
              color: controller.currentTab.value == index
                  ? const Color(0xFF225CAB)
                  : Colors.grey,
            ),
            if (controller.currentTab.value == index)
              Text(
                label,
                style: const TextStyle(color: Color(0xFF225CAB)),
              ),
          ],
        ),
      );
    });
  }
}
