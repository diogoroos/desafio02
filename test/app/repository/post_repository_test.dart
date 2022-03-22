import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:miio_test/app/controller/post_controller.dart';
import 'package:miio_test/app/repository/post_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'post_repository_test.mocks.dart';

@GenerateMocks([PostRepository])
void main() {
  test('Teste PostRepository', () async {
    var repository = MockPostRepository();
    when(repository.getData()).thenAnswer((_) =>
        Future.value(Response(requestOptions: RequestOptions(path: ''))));
    await repository.getData();
    verify(repository.getData()).called(1);
  });
}
