import 'package:hvart_har_du_sett/services/http_service.dart';

const useLocalFunctions = false;

// todo fix
const fbUrl = 'https://europe-west1-progit-social.cloudfunctions.net/app';

class BaseAPIHandler {
  final String basePath;
  final client = HttpService.instance;

  BaseAPIHandler({String? url, String? basePath})
      : basePath = '${url ?? fbUrl}$basePath';

  String getUrl({String? path, List<String>? paths}) {
    if (path == null && paths == null) {
      return basePath;
    } else if (paths == null) {
      return '$basePath/$path';
    } else {
      final joinedPaths = paths.join('/');
      return '$basePath/$joinedPaths';
    }
  }

  Future<T> get<T>({String? url, List<String>? queryParams}) {
    final joinedParams = queryParams?.join("?");
    var _url = '${url ?? getUrl()}$joinedParams}';
    return client.doRequest(url: _url);
  }

  Future<T> post<T>({String? url, Map<String, dynamic> body = const {}}) {
    var _url = url ?? getUrl();
    return client.doRequest(
        url: _url, requestMethod: REQUEST_METHODS.POST, body: body);
  }
}
