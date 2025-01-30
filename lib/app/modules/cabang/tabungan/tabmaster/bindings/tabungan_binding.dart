import 'package:get/get.dart';
import 'package:nova_by_bkc/app/data/repositories/tabungan/tabungan_repository_impl.dart';
import 'package:nova_by_bkc/app/domain/usecase/tabungan/tabungan_usecae.dart';
import 'package:nova_by_bkc/app/modules/cabang/tabungan/tabmaster/controllers/tabungan_controller.dart';

class TabunganBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GetTabunganUseCase(Get.find<TabunganRepositoryImpl>()));
    Get.lazyPut<TabunganController>(
      () => TabunganController(
        Get.find<GetTabunganUseCase>(),
      ),
    );
  }
}
