import 'dart:io';

import 'package:http_parser/http_parser.dart';

class MultipartFormData {
  String? key;
  String? filePath;
  String? fileName;
  File? file;

  MultipartFormData({
    this.key,
    this.filePath,
    this.fileName
  }) {
    if(filePath != null){
      file = File(filePath!);
      file!.length();
      file!.readAsBytesSync().toList();
    }
  }

  List<int>? get bytes => file == null ? null : file!.readAsBytesSync().toList();

  MediaType get mediaType => MediaType.parse('multipart/form-data');
}