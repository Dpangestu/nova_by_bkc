import 'package:dio/dio.dart';
import 'package:nova_by_bkc/app/commons/constants/api_config.dart';
import 'package:nova_by_bkc/app/commons/errors/exceptions.dart';
import 'package:nova_by_bkc/app/commons/helpers/auth_helper.dart';
import 'package:nova_by_bkc/app/data/models/tabungan/paging_model.dart';
import 'package:nova_by_bkc/app/domain/usecase/tabungan/tabungan_usecae.dart';

abstract class TabunganDataSource {
  Future<TabunganPagingModel> getTabungan(Params params);
}

class TabunganDataSourceImpl implements TabunganDataSource {
  final Dio _dio;
  String? token = AuthHelper.getToken();
  Map<String, dynamic>? userData = AuthHelper.getUserData();
  final kodeKantor = AuthHelper.user?.kode_kantor;

  TabunganDataSourceImpl(this._dio);

  @override
  @override
  Future<TabunganPagingModel> getTabungan(Params params) async {
    try {
      String url = '${ApiConfig.apiUrl}/tabung/get-nasabah-all';

      if (params.keyword != null) {
        url += '/search/${params.keyword}/$kodeKantor';
      }

      Options options = Options(
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      Response response =
          await _dio.post(url, options: options, queryParameters: {
        'kode_kantor': kodeKantor,
        'page': params.page,
        'per_page': params.perPage,
      });

      print('Response status code: ${response.statusCode}');
      print('Response data: ${response.data}');

      return TabunganPagingModel.fromJson(response.data);
    } on DioError catch (e) {
      print('DioError: ${e.response?.data}');
      print('DioError Status Code: ${e.response?.statusCode}');
      throw ServerException();
    }
  }
}
