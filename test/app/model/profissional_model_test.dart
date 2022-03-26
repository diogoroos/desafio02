import 'package:flutter_test/flutter_test.dart';
import 'package:miio_test/app/ui/home/model/profissional_model.dart';

void main() {
  test('ProfissionalModel tem dados preenchidos', () async {
    final model = ProfissionalModel.fromMap(
        {"nomeProfissional": "Diogo", "titulo": "UI e UX"});

    expect(model.nomeProfissional.isEmpty, isFalse);
    expect(model.titulo.isEmpty, isFalse);
  });
}
