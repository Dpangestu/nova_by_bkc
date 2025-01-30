import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  const Failure(this.message);

  @override
  List<Object> get props => [message];
}

class RemoteServerFailure extends Failure {
  const RemoteServerFailure([super.message = "Terjadi kesalahan pada server"]);
}

class LocalServiceFailure extends Failure {
  const LocalServiceFailure([super.message = "Kesalahan pada layanan lokal"]);
}

class HttpRequestFailure extends Failure {
  const HttpRequestFailure([super.message = "Kesalahan permintaan HTTP"]);
}
