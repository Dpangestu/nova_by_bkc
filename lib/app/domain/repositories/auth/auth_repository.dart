import 'package:dartz/dartz.dart';
import 'package:nova_by_bkc/app/commons/errors/errors.dart';
import 'package:nova_by_bkc/app/domain/entity/auth/user_entity.dart';
import 'package:nova_by_bkc/app/domain/usecase/auth/auth_usecase.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserEntity>> login(LoginParams params);
  Future<Either<Failure, void>> logout(String accessToken);
}
