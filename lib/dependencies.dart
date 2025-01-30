import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:nova_by_bkc/app/data/data_source/auth/auth_data_source.dart';
import 'package:nova_by_bkc/app/data/data_source/tabungan/tabungan_data_source.dart';
import 'package:nova_by_bkc/app/data/repositories/auth/auth_repository_impl.dart';
import 'package:nova_by_bkc/app/data/repositories/tabungan/tabungan_repository_impl.dart';
import 'package:nova_by_bkc/app/domain/usecase/auth/auth_usecase.dart';
import 'package:nova_by_bkc/app/domain/usecase/auth/logout_usecase.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Dio _dio = Dio();

    Get.lazyPut(() => TabunganDataSourceImpl(_dio), fenix: true);
    Get.lazyPut(() => AuthDataSourceImpl(_dio), fenix: true);

    Get.lazyPut(
      () => TabunganRepositoryImpl(Get.find<TabunganDataSourceImpl>()),
      fenix: true,
    );

    Get.lazyPut(
      () => AuthRepositoryImpl(Get.find<AuthDataSourceImpl>()),
      fenix: true,
    );

    Get.lazyPut(() => LoginUseCase(Get.find<AuthRepositoryImpl>()),
        fenix: true);
    Get.lazyPut(() => LogoutUseCase(Get.find<AuthRepositoryImpl>()),
        fenix: true);
  }
}
