import 'package:flutter_test/flutter_test.dart';
import 'package:miio_test/app/ui/home/model/comentario_model.dart';

void main() {
  test('ComentarioModel tem texto, email e estrelas', () async {
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
