import 'package:fifa_status/modules/home_page/selecao_model.dart';
import 'package:fifa_status/modules/jogadores/jogador_repository.dart';
import 'package:fifa_status/modules/jogadores/jogador_state.dart';
import 'package:flutter/cupertino.dart';

class JogadorController {
  final stateNotifier = ValueNotifier<JogadorState>(JogadorState.empty);
  final repository = JogadorRepository();
  List<SelecaoModel> listaSelecao = [];

  void get() async {
    stateNotifier.value = JogadorState.loading;
    final response = await repository.get();
    if (response.runtimeType == List<SelecaoModel>) {
      listaSelecao = response;
      stateNotifier.value = JogadorState.success;
      return;
    }

    stateNotifier.value = JogadorState.error;
  }
}
