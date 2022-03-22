import 'package:dio/dio.dart';
import 'package:miio_test/core/base/repository_base.dart';

abstract class IPostRepository extends RepositoryBase {
  String url = "";
}

class PostRepository implements IPostRepository {
  @override
  String url = "http://www.dtworkroom.com/doris/1/2.0.0/";

  @override
  Future<Response> getData() async {
    dio.options.baseUrl = url;
    final response = await dio.get('');
    return response;
  }

  @override
  Dio dio = Dio(BaseOptions(
    connectTimeout: 20000,
    receiveTimeout: 20000,
    headers: {'Content-Type': 'application/json'},
  ));
}
