import 'package:dartz/dartz.dart';
import 'package:nova_by_bkc/app/commons/errors/errors.dart';
import 'package:nova_by_bkc/app/commons/usecase/usecase.dart';
import 'package:nova_by_bkc/app/domain/repositories/auth/auth_repository.dart';

class LogoutUseCase implements UseCase<void, String> {
  final AuthRepository repository;

  LogoutUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(String params) async {
    return await repository.logout(params);
  }
}
