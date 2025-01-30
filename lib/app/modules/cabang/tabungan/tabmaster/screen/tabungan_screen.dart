import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nova_by_bkc/app/modules/cabang/tabungan/tabmaster/controllers/tabungan_controller.dart';

class TabunganScreen extends GetView<TabunganController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tabungan Data'),
      ),
      body: Obx(
        () {
          if (controller.isLoading.value && controller.page.value == 1) {
            return Center(child: CircularProgressIndicator());
          } else if (controller.isError.value) {
            return Center(child: Text('Failed to load data.'));
          } else if (controller.tabungan.isEmpty) {
            return Center(child: Text('No data available.'));
          } else {
            return RefreshIndicator(
              onRefresh: controller.fetchTabungan,
              child: ListView.builder(
                controller: controller.scrollController,
                itemCount: controller.tabungan.length +
                    1, // +1 untuk indikator loading
                itemBuilder: (context, index) {
                  if (index == controller.tabungan.length) {
                    return Center(
                      child: controller.isLoading.value
                          ? CircularProgressIndicator()
                          : SizedBox(),
                    );
                  }
                  final tabunganItem = controller.tabungan[index];
                  return ListTile(
                    title: Text(tabunganItem.namaNasabah ?? 'No Name'),
                    subtitle:
                        Text(tabunganItem.noRekening ?? 'No Account Number'),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
