import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:miio_test/app/ui/home/repository/post_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'post_repository_test.mocks.dart';

@GenerateMocks([PostRepository])
void main() {
  test('PostRepository tem acao getData acionada', () async {
    var repository = MockPostRepository();
    when(repository.getData()).thenAnswer((_) =>
        Future.value(Response(requestOptions: RequestOptions(path: ''))));
    await repository.getData();
    verify(repository.getData()).called(1);
  });
}
