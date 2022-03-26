import 'package:flutter_test/flutter_test.dart';
import 'package:miio_test/app/ui/home/enum/tipo_pintura_enum.dart';
import 'package:miio_test/app/ui/home/model/post_model.dart';

void main() {
  test('PostModel tem modelo valido', () async {
    final model = PostModel.fromMap({
      "profissional": {"nomeProfissional": "Diogo", "titulo": "UI e UX"},
      "descricao": "teste1",
      "urlImagem": "https://teste1.com/img.png",
      "comentarios": [
        {"texto": "comentario1", "email": "email1@t.com", "estrelas": 5}
      ],
      "pais": "Brasil",
      "tipo": "oa",
      "altura": 61,
      "largura": 70,
    });

    expect(model.profissional.nomeProfissional.length, greaterThan(2));
    expect(model.descricao, isA<String>());
    expect(model.urlImagem, contains("http"));
    expect(model.pais, isA<String>());
    expect(model.tipo, isA<TipoPinturaEnum>());
    expect(model.altura, isA<num>());
    expect(model.largura, isA<num>());
  });
}
