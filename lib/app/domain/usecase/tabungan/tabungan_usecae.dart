import 'package:dartz/dartz.dart';
import 'package:nova_by_bkc/app/commons/errors/errors.dart';
import 'package:nova_by_bkc/app/commons/usecase/usecase.dart';
import 'package:nova_by_bkc/app/domain/entity/tabungan/tabungan_paging_enity.dart';
import 'package:nova_by_bkc/app/domain/repositories/tabungan/tabungan_repository.dart';

class GetTabunganUseCase implements UseCase<TabunganPagingEntity, Params> {
  final TabunganRepository _repository;

  GetTabunganUseCase(this._repository);

  @override
  Future<Either<Failure, TabunganPagingEntity>> call(Params params) async {
    return await _repository.getTabungan(params);
  }
}

class Params {
  int page;
  int perPage;
  String? keyword;

  Params({
    this.page = 1,
    this.perPage = 20,
    this.keyword,
  });

  Params copyWith({
    int? page,
    int? perPage,
    String? keyword,
  }) {
    return Params(
      page: page ?? this.page,
      perPage: perPage ?? this.perPage,
      keyword: keyword ?? this.keyword,
    );
  }
}
