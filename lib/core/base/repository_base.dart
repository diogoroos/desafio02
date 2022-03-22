import 'package:dio/dio.dart';

class RepositoryBase {
  Dio dio = throw UnimplementedError();
  Future<Response> getData() async {
    throw UnimplementedError();
  }
}
