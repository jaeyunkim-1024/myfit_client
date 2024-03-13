import '../../model/common_model.dart';
import '../../model/multipart_form_data.dart';

enum HttpMethod {
  GET(method:'GET'),
  POST(method:'POST'),
  PUT(method:'PUT'),
  DELETE(method:'DELETE'),
  PATCH(method:'PATCH');

  const HttpMethod({
    required this.method
  });
  final String method;
}
abstract class RestService {
  Future<T?> get<T>({
    required String url,
    Map<String,dynamic>? queryParameters,
  });

  Future<void> post({
    required String url,
    Map<String,dynamic>? body,
  });

  Future<void> put({
    required String url,
    Map<String,dynamic>? body,
  });

  Future<void> patch({
    required String url,
    Map<String,dynamic>? body,
  });

  Future<void> delete({
    required String url,
    Map<String,dynamic>? queryParameters,
  });

  Future<void> multiPartForm({
    required String url,
    required List<MultipartFormData> list
  });
}
