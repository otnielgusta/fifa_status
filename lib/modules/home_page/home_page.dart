import 'package:fifa_status/consts/text_styles.dart';
import 'package:fifa_status/modules/jogadores/jogador_infos_basicas_page.dart';
import 'package:fifa_status/modules/jogadores/jogador_state.dart';
import 'package:fifa_status/modules/jogadores/jogadores_controller.dart';
import 'package:fifa_status/modules/jogadores/widgets/icones_selecoes_widget.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = JogadorController();

  @override
  void initState() {
    controller.get();
    controller.stateNotifier.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff8e0a30),
        title: Text(
          "PAÍSES",
          style: TextStyles.tituloAppBarBranco,
        ),
        centerTitle: true,
      ),
      backgroundColor: const Color(0xFFfdfdfd),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: ValueListenableBuilder(
              valueListenable: controller.stateNotifier,
              builder: (context, value, _) {
                if (controller.stateNotifier.value == JogadorState.loading) {
                  return Center(child: CircularProgressIndicator());
                } else if (controller.stateNotifier.value ==
                    JogadorState.success) {
                  return ListView.builder(
                      itemCount: controller.listaSelecao.length,
                      itemBuilder: (BuildContext context, int index) {
                        return IconeSelecaoWidget(
                            caminho: controller.listaSelecao[index].bandeira
                                .toString(),
                            nome:
                                controller.listaSelecao[index].nome.toString(),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        JogadorInfosBasicasPage(
                                            title: controller
                                                .listaSelecao[index].nome
                                                .toString(),
                                            jogadores: controller
                                                .listaSelecao[index]
                                                .jogadores!),
                                  ));
                            });
                      });
                } else {
                  return Container();
                }
              }),
        ),
      ),
    );
  }
}
