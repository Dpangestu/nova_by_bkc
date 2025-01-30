import 'package:nova_by_bkc/app/data/models/tabungan/tabungan_model.dart';
import 'package:nova_by_bkc/app/domain/entity/tabungan/tabungan_paging_enity.dart';

class TabunganPagingModel extends TabunganPagingEntity {
  TabunganPagingModel({
    int? total,
    int? currentPage,
    int? perPage,
    List<TabunganModel>? tabunganList,
    String? nextPageUrl, // Add nextPageUrl to the constructor
  }) : super(
          total: total,
          currentPage: currentPage,
          perPage: perPage,
          tabunganList: tabunganList,
          nextPageUrl: nextPageUrl,
        );

  factory TabunganPagingModel.fromJson(Map<String, dynamic> json) {
    return TabunganPagingModel(
      total: json['total'],
      currentPage: json['current_page'],
      perPage: json['per_page'],
      tabunganList:
          (json['data'] as List).map((e) => TabunganModel.fromJson(e)).toList(),
      nextPageUrl: json['next_page_url'],
    );
  }
}
