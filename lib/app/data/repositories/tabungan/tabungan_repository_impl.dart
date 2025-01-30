import 'package:dartz/dartz.dart';
import 'package:nova_by_bkc/app/commons/errors/errors.dart';
import 'package:nova_by_bkc/app/commons/errors/exceptions.dart';
import 'package:nova_by_bkc/app/data/data_source/tabungan/tabungan_data_source.dart';
import 'package:nova_by_bkc/app/data/models/tabungan/paging_model.dart';
import 'package:nova_by_bkc/app/domain/repositories/tabungan/tabungan_repository.dart';
import 'package:nova_by_bkc/app/domain/usecase/tabungan/tabungan_usecae.dart';

class TabunganRepositoryImpl extends TabunganRepository {
  final TabunganDataSource _tabunganDataSource;

  TabunganRepositoryImpl(this._tabunganDataSource);

  @override
  Future<Either<Failure, TabunganPagingModel>> getTabungan(
      Params params) async {
    try {
      final TabunganPagingModel tabungan =
          await _tabunganDataSource.getTabungan(params);
      return Right(tabungan);
    } on ServerException {
      return Left(RemoteServerFailure());
    }
  }
}
