import 'dart:convert';
import 'package:myfit/util/rest/rest_service.dart';
import 'package:http/http.dart' as http;

import '../../../model/common_model.dart';
import '../../../model/multipart_form_data.dart';

class GlbService implements RestService {
   @override
  Future<void> delete({required String url, Map<String, dynamic>? queryParameters}) async {

  }

  @override
  Future<T?> get<T>({required String url, Map<String, dynamic>? queryParameters}) async {
    var path = Uri.parse(url);

    http.Response response = await http.get(
        path,
        headers:headers
    );

    if(response.statusCode == 200){
      var body = response.body;
      var res = json.decode(body);
      return res as T;
    }else{
      return null;
    }
  }

  @override
  Future<void> patch({required String url, Map<String, dynamic>? body}) {
    // TODO: implement patch
    throw UnimplementedError();
  }

  @override
  Future<void> post({required String url, Map<String, dynamic>? body}) async {
    var path = Uri.parse(url);
    http.Response response = await http.post(
      path,
      body: body,
      encoding: Encoding.getByName('utf-8'),
      headers:headers
    );
  }

  @override
  Future<void> put({required String url, Map<String, dynamic>? body}) {
    // TODO: implement put
    throw UnimplementedError();
  }

  @override
  Future<void> multiPartForm({required String url, required List<MultipartFormData> list}) async {
    var path = Uri.parse(url);

    var req = http.MultipartRequest(HttpMethod.POST.method, path);
    var contentLength = 0;
    for (var f in list) {
      var c = await f.file?.length();
      contentLength += c ?? 0;
      var bytes = f.bytes;
      var httpImage = http.MultipartFile.fromBytes(
          f.key ?? '',
          bytes ?? [0],
          contentType: f.mediaType,
          filename: f.fileName,
      );
      req.files.add(httpImage);
    }
    req.contentLength = contentLength;
    final response = await req.send();

  }

  Map<String,String> get headers => {
    "Content-Type": "application/json",
    "Accept": "application/json",
    "Authorization": "",
  };

}