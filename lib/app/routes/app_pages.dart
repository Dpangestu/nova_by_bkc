import 'package:get/get.dart';
import 'package:nova_by_bkc/app/modules/cabang/tabungan/tabmaster/bindings/tabungan_binding.dart';
import 'package:nova_by_bkc/app/modules/cabang/tabungan/tabmaster/screen/tabungan_screen.dart';
import 'package:nova_by_bkc/app/modules/cabang/dashboard/bindings/dashboard_binding.dart';
import 'package:nova_by_bkc/app/modules/cabang/dashboard/screens/dashboard_screen.dart';
import 'package:nova_by_bkc/app/modules/login/bindings/login_bindings.dart';
import 'package:nova_by_bkc/app/modules/login/screen/login_screen.dart';
import 'package:nova_by_bkc/app/modules/splash/bindings/splash_bindings.dart';
import 'package:nova_by_bkc/app/modules/splash/screen/splash_screen.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginScreen(),
      binding: LoginBinding(),
    ),

    // AUTH
    GetPage(
      name: _Paths.TABUNGAN,
      page: () => TabunganScreen(),
      binding: TabunganBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => DashboardScreen(),
      binding: DashboardBinding(),
    ),
  ];
}
