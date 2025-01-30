import 'package:dio/dio.dart';
import 'package:nova_by_bkc/app/commons/constants/api_config.dart';
import 'package:nova_by_bkc/app/commons/errors/exceptions.dart';
import 'package:nova_by_bkc/app/data/models/auth/auth_response_model.dart';
import 'package:nova_by_bkc/app/domain/usecase/auth/auth_usecase.dart';

abstract class AuthDataSource {
  Future<LoginResponseModel> login(LoginParams params);
  Future<void> logout(String accessToken);
}

class AuthDataSourceImpl implements AuthDataSource {
  final Dio _dio;

  AuthDataSourceImpl(this._dio);

  @override
  Future<LoginResponseModel> login(LoginParams params) async {
    try {
      String url = '${ApiConfig.apiUrl}/auth/login';
      print('api url: $url');
      Response response = await _dio.post(url, queryParameters: {
        'username': params.username,
        'password': params.password,
      });

      return LoginResponseModel.fromJson(response.data);
    } on DioException catch (e) {
      final errorMessage =
          e.response?.data['error'] ?? "Terjadi kesalahan, coba lagi nanti.";
      throw ServerException(errorMessage);
    }
  }

  @override
  Future<void> logout(String accessToken) async {
    try {
      String url = '${ApiConfig.apiUrl}/auth/logout';
      await _dio.post(
        url,
        options: Options(headers: {'Authorization': 'Bearer $accessToken'}),
      );
    } on DioException catch (e) {
      final errorMessage =
          e.response?.data['error'] ?? "Terjadi kesalahan saat logout.";
      throw ServerException(errorMessage);
    }
  }
}
