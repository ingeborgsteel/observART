import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hvart_har_du_sett/utils/enum_helpers.dart';

enum REQUEST_METHODS { GET, POST }

class HttpService {
  final _dio = Dio()
    ..interceptors.add(InterceptorsWrapper(onRequest: (options, handler) async {
      final token = await FirebaseAuth.instance.currentUser?.getIdToken();
      options.headers = {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json; charset=UTF-8',
      };
      return handler.next(options);
    }));

  HttpService._privateConstructor();

  static final instance = HttpService._privateConstructor();

  doRequest<T>(
      {required String url,
      REQUEST_METHODS requestMethod = REQUEST_METHODS.GET,
      Map<String, dynamic>? body}) async {
    final method = convertEnumToString(requestMethod);
    try {
      final response =
          await _dio.request(url, data: body, options: Options(method: method));
      return response.data as T;
    } on DioError catch (e) {
      if (e.response?.data?['errors'] == null) {
        rethrow;
      }
      throw e.response!.data['errors'];
    }
  }
}
