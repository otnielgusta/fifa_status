import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyles {
  static TextStyle nomeJogadorPrata = GoogleFonts.elMessiri(
    color: Color(0xffdedede),
    fontSize: 50,
    fontWeight: FontWeight.w800,
  );
  static TextStyle nomeJogadorVermelho = GoogleFonts.elMessiri(
    color: Color(0xffd7313f),
    fontSize: 50,
    fontWeight: FontWeight.w800,
  );

  static TextStyle tituloAppBar = GoogleFonts.ubuntu(
    color: Color(0xff322f30),
    fontSize: 20,
    fontWeight: FontWeight.w700,
  );

  static TextStyle tituloAppBarBranco = GoogleFonts.ubuntu(
    color: Color(0xffffffff),
    fontSize: 20,
    fontWeight: FontWeight.w700,
  );
  static TextStyle textoPosicao = GoogleFonts.ubuntu(
    color: Color(0xff7d7d7d),
    fontSize: 16,
    fontWeight: FontWeight.w700,
  );

  static TextStyle titleCard = GoogleFonts.ubuntu(
    color: Color(0xff929292),
    fontSize: 14,
    fontWeight: FontWeight.w700,
  );

  static TextStyle subTitleCard = GoogleFonts.ubuntu(
    color: Color(0xfffefefe),
    fontSize: 20,
    fontWeight: FontWeight.w700,
  );

  static TextStyle nomePaisesHome = GoogleFonts.elMessiri(
    color: Color(0xff8e0a30),
    fontSize: 20,
    fontWeight: FontWeight.w700,
  );
}
