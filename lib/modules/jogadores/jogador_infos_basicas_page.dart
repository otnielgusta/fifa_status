import 'package:fifa_status/consts/base_url.dart';
import 'package:fifa_status/consts/text_styles.dart';
import 'package:fifa_status/modules/jogadores/jogador_model.dart';
import 'package:fifa_status/modules/jogadores/jogadores_controller.dart';
import 'package:fifa_status/modules/jogadores/widgets/card_widget.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:animated_card/animated_card.dart';

class JogadorInfosBasicasPage extends StatefulWidget {
  final List<JogadorModel> jogadores;
  final String title;
  const JogadorInfosBasicasPage(
      {Key? key, required this.jogadores, required this.title})
      : super(key: key);

  @override
  State<JogadorInfosBasicasPage> createState() =>
      _JogadorInfosBasicasPageState();
}

class _JogadorInfosBasicasPageState extends State<JogadorInfosBasicasPage> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFfdfdfd),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.black,
            size: 20,
          ),
        ),
        centerTitle: true,
        title: Text(
          widget.title.toUpperCase(),
          style: TextStyles.tituloAppBar,
        ),
      ),
      body: Container(
        width: size.width,
        height: size.height,
        child: Container(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      if (index != 0) {
                        setState(() {
                          index -= 1;
                        });
                      }
                    },
                    icon: Icon(Icons.keyboard_double_arrow_left_rounded),
                    color: index == 0 ? Colors.white30 : Colors.black,
                  ),
                  Text(
                    "${widget.jogadores[index].nome} ${widget.jogadores[index].segundoNome}",
                    style: TextStyles.tituloAppBar,
                  ),
                  IconButton(
                    onPressed: () {
                      if (index != widget.jogadores.length - 1) {
                        setState(() {
                          index += 1;
                        });
                      }
                    },
                    icon: Icon(Icons.keyboard_double_arrow_right_rounded),
                    color: index == widget.jogadores.length - 1
                        ? Colors.white30
                        : Colors.black,
                  ),
                ],
              ),
              Expanded(
                flex: 4,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RotatedBox(
                        quarterTurns: 3,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              widget.jogadores[index].nome
                                  .toString()
                                  .toUpperCase(),
                              style: TextStyles.nomeJogadorPrata,
                            ),
                            SizedBox(width: 20),
                            Text(
                                widget.jogadores[index].segundoNome
                                    .toString()
                                    .toUpperCase(),
                                style: TextStyles.nomeJogadorVermelho)
                          ],
                        ),
                      ),
                      Stack(
                        children: [
                          Container(
                            height: 400,
                            child: Opacity(
                              opacity: 0.2,
                              child: Image.network(
                                "${BaseUrl.baseUrl}${widget.jogadores[index].imagem1}",
                                fit: BoxFit.fill,
                                loadingBuilder: (BuildContext context,
                                    Widget child,
                                    ImageChunkEvent? loadingProgress) {
                                  if (loadingProgress == null) return child;
                                  return Center(
                                    child: CircularProgressIndicator(
                                      value:
                                          loadingProgress.expectedTotalBytes !=
                                                  null
                                              ? loadingProgress
                                                      .cumulativeBytesLoaded /
                                                  loadingProgress
                                                      .expectedTotalBytes!
                                              : null,
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          Container(
                            height: 400,
                            child: Image.network(
                              "${BaseUrl.baseUrl}${widget.jogadores[index].imagem2}",
                              fit: BoxFit.cover,
                              loadingBuilder: (BuildContext context,
                                  Widget child,
                                  ImageChunkEvent? loadingProgress) {
                                if (loadingProgress == null) return child;
                                return Center(
                                  child: CircularProgressIndicator(
                                    value: loadingProgress.expectedTotalBytes !=
                                            null
                                        ? loadingProgress
                                                .cumulativeBytesLoaded /
                                            loadingProgress.expectedTotalBytes!
                                        : null,
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      )),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            "assets/images/bola-de-futebol.png",
                            width: 20,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            widget.jogadores[index].posicao!
                                .toUpperCase()
                                .toString(),
                            style: TextStyles.textoPosicao,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CardWidget(
                              title: "IDADE",
                              subTitle:
                                  widget.jogadores[index].idade.toString()),
                          CardWidget(
                              title: "JOGOS",
                              subTitle:
                                  widget.jogadores[index].partidas.toString()),
                          CardWidget(
                              title: "GOLS",
                              subTitle:
                                  widget.jogadores[index].gols.toString()),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: const Color(0xFFfdfdfd),
    );
  }
}
