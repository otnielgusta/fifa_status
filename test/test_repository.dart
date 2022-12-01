

import 'package:fifa_status/modules/jogadores/jogador_repository.dart';
import 'package:fifa_status/modules/jogadores/jogadores_controller.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("description", (() async{
    final repository = JogadorController();
    final lista = repository.get();
    print("lista");
  })
  );
}