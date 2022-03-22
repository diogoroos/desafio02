import 'package:flutter_test/flutter_test.dart';
import 'package:miio_test/app/controller/post_controller.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'post_controller_test.mocks.dart';

@GenerateMocks([PostController])
void main() {
  test('Teste PostController', () async {
    var controller = MockPostController();
    when(controller.buscaDados()).thenAnswer((_) => Future.value(null));
    await controller.buscaDados();
    verify(controller.buscaDados()).called(1);
  });
}
