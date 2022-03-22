import 'package:flutter_test/flutter_test.dart';
import 'package:miio_test/app/model/profissional_model.dart';

void main() {
  test('Teste ProfissionalModel de json', () async {
    final model = ProfissionalModel.fromMap(
        {"nomeProfissional": "Diogo", "titulo": "UI e UX"});

    expect(model.nomeProfissional.isEmpty, isFalse);
    expect(model.titulo.isEmpty, isFalse);
  });
}
