import 'package:nova_by_bkc/app/domain/entity/tabungan/tabungan_entity.dart';

class TabunganPagingEntity {
  final int? total;
  final int? currentPage;
  final int? perPage;
  final String? nextPageUrl;
  final List<TabunganEntity>? tabunganList;

  TabunganPagingEntity({
    this.total,
    this.currentPage,
    this.perPage,
    this.nextPageUrl,
    this.tabunganList,
  });

  factory TabunganPagingEntity.fromJson(Map<String, dynamic> json) {
    return TabunganPagingEntity(
      total: json['total'],
      currentPage: json['current_page'],
      perPage: json['per_page'],
      nextPageUrl: json['next_page_url'],
      tabunganList: (json['data'] as List)
          .map((e) => TabunganEntity.fromJson(e))
          .toList(),
    );
  }
}
