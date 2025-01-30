import 'package:get/get.dart';
import 'package:nova_by_bkc/app/data/repositories/auth/auth_repository_impl.dart';
import 'package:nova_by_bkc/app/domain/usecase/auth/auth_usecase.dart';
import 'package:nova_by_bkc/app/domain/usecase/auth/logout_usecase.dart';
import 'package:nova_by_bkc/app/modules/login/controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginUseCase(Get.find<AuthRepositoryImpl>()));
    Get.lazyPut(() => LogoutUseCase(Get.find<AuthRepositoryImpl>()));
    Get.lazyPut<LoginController>(
      () => LoginController(
        loginUseCase: Get.find<LoginUseCase>(),
        logoutUseCase: Get.find<LogoutUseCase>(),
      ),
      fenix: true,
    );
  }
}
