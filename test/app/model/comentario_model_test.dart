import 'package:flutter_test/flutter_test.dart';
import 'package:miio_test/app/model/comentario_model.dart';

void main() {
  test('Teste ComentarioModel de json', () async {
    final model = ComentarioModel.fromMap({
      "texto": "teste1",
      "email": "teste@t.com",
      "estrelas": 5,
    });

    expect(model.texto, isA<String>());
    expect(model.email, contains('@'));
    expect(model.estrelas, isA<int>());
  });
}
