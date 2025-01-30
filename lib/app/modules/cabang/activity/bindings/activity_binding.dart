import 'package:get/get.dart';
import 'package:nova_by_bkc/app/modules/cabang/activity/controllers/activity_controller.dart';

class ActivityBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ActivityController>(() => ActivityController());
  }
}
