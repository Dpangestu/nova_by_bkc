import 'package:get/get.dart';
import 'package:nova_by_bkc/app/modules/cabang/home/controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
