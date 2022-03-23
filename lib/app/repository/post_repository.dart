import 'package:dio/dio.dart';

import '../../core/base/repository_base.dart';

abstract class IPostRepository extends RepositoryBase {
  String url = "";
}

class PostRepository implements IPostRepository {
  @override
  String url = "https://run.mocky.io/v3/6a254331-ff9e-4018-b5ba-c8a55ae16487";

  @override
  Future<Response> getData() async {
    dio.options.baseUrl = url;
    return await dio.get('');
  }

  @override
  Dio dio = Dio(BaseOptions(
    connectTimeout: 20000,
    receiveTimeout: 20000,
    headers: {'Content-Type': 'application/json'},
  ));
}
