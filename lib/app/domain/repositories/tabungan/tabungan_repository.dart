import 'package:dartz/dartz.dart';
import 'package:nova_by_bkc/app/commons/errors/errors.dart';
import 'package:nova_by_bkc/app/data/models/tabungan/paging_model.dart';
import 'package:nova_by_bkc/app/domain/usecase/tabungan/tabungan_usecae.dart';

abstract class TabunganRepository {
  Future<Either<Failure, TabunganPagingModel>> getTabungan(Params params);
}
