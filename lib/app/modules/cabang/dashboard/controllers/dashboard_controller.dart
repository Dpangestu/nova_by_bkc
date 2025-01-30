import 'package:get/get.dart';
import 'package:nova_by_bkc/app/commons/helpers/auth_helper.dart';
import 'package:nova_by_bkc/app/commons/widgets/show_dialog.dart';
import 'package:nova_by_bkc/app/data/models/auth/auth_model.dart';
import 'package:nova_by_bkc/app/domain/usecase/auth/auth_usecase.dart';
import 'package:nova_by_bkc/app/domain/usecase/auth/logout_usecase.dart';
import 'package:nova_by_bkc/app/modules/login/controllers/login_controller.dart';

class DashboardController extends GetxController {
  RxInt currentTab = 0.obs;
  AuthModel? currentUser;
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    _loadCurrentUser();
  }

  Future<void> _loadCurrentUser() async {
    currentUser = AuthHelper.user;
    isLoading.value = false;
  }

  Future<void> changeTab(int index) async {
    currentTab.value = index;
  }

  Future<void> confirmLogout() async {
    try {
      if (!Get.isRegistered<LoginController>()) {
        Get.put(LoginController(
          loginUseCase: Get.find<LoginUseCase>(),
          logoutUseCase: Get.find<LogoutUseCase>(),
        ));
      }

      final loginController = Get.find<LoginController>();

      DialogHelper.showConfirmDialog(
        Get.context!,
        "Konfirmasi Logout",
        "Apakah Anda yakin ingin logout?",
        () async {
          await loginController.logout();
        },
      );
    } catch (e) {
      print('dari dashboard controller$e');
      DialogHelper.showCustomDialog(
        Get.context!,
        "Terjadi Kesalahan",
        e.toString(),
        isError: true,
      );
    }
  }
}
