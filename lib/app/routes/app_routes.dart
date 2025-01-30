part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const HOME = _Paths.HOME;
  static const SPLASH = _Paths.SPLASH;
  static const LOGIN = _Paths.LOGIN;

  static const TABUNGAN = _Paths.TABUNGAN;
  static const DASHBOARD = _Paths.DASHBOARD;
}

abstract class _Paths {
  _Paths._();
  static const HOME = '/home';
  static const SPLASH = '/splash';
  static const LOGIN = '/login';

  static const String DASHBOARD = '/dashboard';
  static const TABUNGAN = '/tabungan';
  // static const CART = '/cart';
  // static const REDEEM = '/redeem';
}
