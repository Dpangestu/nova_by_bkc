import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nova_by_bkc/app/commons/widgets/show_dialog.dart';
import 'package:nova_by_bkc/app/domain/usecase/auth/auth_usecase.dart';
import 'package:nova_by_bkc/app/domain/usecase/auth/logout_usecase.dart';
import 'package:nova_by_bkc/app/routes/app_pages.dart';

class LoginController extends GetxController {
  final LoginUseCase loginUseCase;
  final LogoutUseCase logoutUseCase;

  RxBool isLoading = false.obs;
  RxString usernameError = ''.obs;
  RxString passwordError = ''.obs;

  // Tambahkan TextEditingController
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  final storage = GetStorage();

  RxBool rememberMe = false.obs;

  final formKey = GlobalKey<FormState>();

  LoginController({
    required this.loginUseCase,
    required this.logoutUseCase,
  });

  void validateUsername(String value) {
    if (value.isEmpty) {
      usernameError.value = 'Username tidak boleh kosong';
    } else {
      usernameError.value = '';
    }
  }

  void validatePassword(String value) {
    if (value.isEmpty) {
      passwordError.value = 'Password tidak boleh kosong';
    } else {
      passwordError.value = '';
    }
  }

  Future<void> login(String username, String password) async {
    // Validasi form sebelum melanjutkan
    if (username.isEmpty || password.isEmpty) {
      return;
    }
    isLoading.value = true;
    if (Get.isDialogOpen ?? false) {
      Get.back(); // Tutup dialog yang sudah ada
    }

    try {
      final result = await loginUseCase.call(
        LoginParams(username: username, password: password),
      );

      result.fold(
        (failure) {
          print('Login failed: ${failure.message}');
          DialogHelper.showCustomDialog(
            Get.context!,
            "Login Gagal",
            failure.message,
            isError: true,
          );
        },
        (userEntity) {
          print('Login successful, user token: ${userEntity.token}');
          DialogHelper.showCustomDialog(
            Get.context!,
            'Success',
            'Yeay, Login berhasil',
          );

          // Simpan data login jika "Remember Me" dipilih
          if (rememberMe.value) {
            storage.write('username', username);
            storage.write('password', password);
            storage.write('rememberMe', true);
          } else {
            storage.remove('username');
            storage.remove('password');
            storage.write('rememberMe', false);
          }

          // Tambahkan delay sebelum navigasi
          Timer(const Duration(seconds: 2), () {
            Get.offAndToNamed(Routes.DASHBOARD);
          });
        },
      );
    } catch (e, stackTrace) {
      print('Login error: $e');
      print('Stack trace: $stackTrace');
      DialogHelper.showCustomDialog(
        Get.context!,
        "Terjadi Kesalahan",
        e.toString(),
        isError: true,
      );
    }
    isLoading.value = false;
  }

  Future<void> logout() async {
    try {
      final token = storage.read('token');
      if (token == null) {
        // Get.offAllNamed(Routes.LOGIN);
        Get.offNamed(Routes.LOGIN);
        return;
      }

      final result = await logoutUseCase.call(token);

      result.fold(
        (failure) {
          DialogHelper.showCustomDialog(
            Get.context!,
            "Logout Gagal",
            failure.message,
            isError: true,
          );
        },
        (_) {
          // Bersihkan data di storage
          storage.erase();
          Get.offAllNamed(Routes.LOGIN);
        },
      );
    } catch (e) {
      DialogHelper.showCustomDialog(
        Get.context!,
        "Terjadi Kesalahan",
        e.toString(),
        isError: true,
      );
    }
  }

  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
