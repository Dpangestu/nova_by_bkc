import 'package:dartz/dartz.dart';
import 'package:nova_by_bkc/app/commons/errors/errors.dart';
import 'package:nova_by_bkc/app/commons/errors/exceptions.dart';
import 'package:nova_by_bkc/app/data/data_source/auth/auth_data_source.dart';
import 'package:nova_by_bkc/app/domain/entity/auth/user_entity.dart';
import 'package:nova_by_bkc/app/domain/repositories/auth/auth_repository.dart';
import 'package:nova_by_bkc/app/domain/usecase/auth/auth_usecase.dart';
import 'package:nova_by_bkc/app/commons/helpers/auth_helper.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource _loginDataSource;

  AuthRepositoryImpl(this._loginDataSource);

  @override
  Future<Either<Failure, UserEntity>> login(LoginParams params) async {
    try {
      final result = await _loginDataSource.login(params);

      AuthHelper.saveToken(result.token);
      AuthHelper.saveUserData(result.toJson());

      return Right(UserEntity(token: result.token));
    } on ServerException catch (e) {
      return Left(RemoteServerFailure(e.message));
    } catch (e) {
      return const Left(RemoteServerFailure("Kesalahan tidak terduga"));
    }
  }

  @override
  Future<Either<Failure, void>> logout(String accessToken) async {
    try {
      await _loginDataSource.logout(accessToken);
      AuthHelper.clearAuthData();
      return const Right(null);
    } on ServerException catch (e) {
      return Left(RemoteServerFailure(e.message));
    } catch (e) {
      return const Left(RemoteServerFailure("Kesalahan tidak terduga"));
    }
  }
}
