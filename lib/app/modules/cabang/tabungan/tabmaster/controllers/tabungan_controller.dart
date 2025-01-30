import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nova_by_bkc/app/domain/entity/tabungan/tabungan_entity.dart';
import 'package:nova_by_bkc/app/domain/entity/tabungan/tabungan_paging_enity.dart';
import 'package:nova_by_bkc/app/domain/usecase/tabungan/tabungan_usecae.dart';

class TabunganController extends GetxController {
  final GetTabunganUseCase _getTabunganUseCase;

  final paging = Rxn<TabunganPagingEntity>();
  final tabungan = <TabunganEntity>[].obs;
  final isLoading = false.obs;
  final isError = false.obs;
  RxString keyword = ''.obs;
  Rx<Params> params = Params().obs;

  final ScrollController scrollController = ScrollController();
  final RxInt page = 1.obs;

  TabunganController(this._getTabunganUseCase);

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(scrollListener);
    fetchTabungan();
  }

  @override
  void onClose() {
    scrollController.addListener(scrollListener);
  }

  Future<void> fetchTabungan() async {
    try {
      isLoading.value = true;

      final params = Params(
        page: page.value,
        perPage: 20,
      );

      final result = await _getTabunganUseCase.call(params);

      result.fold(
        (failure) {
          isError.value = true;
        },
        (data) {
          if (page.value == 1) {
            tabungan.assignAll(data.tabunganList ?? []);
          } else {
            tabungan.addAll(data.tabunganList ?? []);
          }

          paging.value = data;

          if ((data.tabunganList?.isNotEmpty ?? false)) {
            page.value++;
          }
        },
      );
    } catch (e) {
      isError.value = true;
    } finally {
      isLoading.value = false;
      update();
    }
  }

  void scrollListener() {
    if (scrollController.position.pixels >=
        scrollController.position.maxScrollExtent - 200) {
      if (!isLoading.value) {
        fetchTabungan();
      }
    }
  }

  void onChangeSearch(String value) {
    keyword.value = value;
    params.value = params.value.copyWith(
      keyword: value,
    );
    fetchTabungan();
    update();
  }

  void refreshList() {
    page.value = 1;
    fetchTabungan();
  }
}
