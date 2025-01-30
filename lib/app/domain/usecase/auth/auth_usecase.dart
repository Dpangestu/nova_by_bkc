import 'package:dartz/dartz.dart';
import 'package:nova_by_bkc/app/commons/errors/errors.dart';
import 'package:nova_by_bkc/app/commons/usecase/usecase.dart';
import 'package:nova_by_bkc/app/domain/entity/auth/user_entity.dart';
import 'package:nova_by_bkc/app/domain/repositories/auth/auth_repository.dart';

class LoginUseCase implements UseCase<UserEntity, LoginParams> {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  @override
  Future<Either<Failure, UserEntity>> call(LoginParams params) async {
    return await repository.login(params);
  }
}

class LoginParams {
  final String? username;
  final String? password;

  LoginParams({
    this.username,
    this.password,
  });

  LoginParams copyWith({
    String? username,
    String? password,
  }) {
    return LoginParams(
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }
}
