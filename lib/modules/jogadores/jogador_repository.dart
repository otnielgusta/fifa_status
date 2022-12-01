import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fifa_status/consts/base_url.dart';
import 'package:fifa_status/modules/home_page/selecao_model.dart';
import 'package:http/http.dart' as http;

class JogadorRepository {
  var url = Uri.parse(BaseUrl.baseUrl);
  var client = http.Client();

  Future get() async {
    try {
      late List<SelecaoModel> listaSelecaoModel = [];
      final response = await client.get(url);
      final dados = jsonDecode(response.body);
      dados.forEach(
          (item) => {listaSelecaoModel.add(SelecaoModel.fromJson(item))});

      return listaSelecaoModel;
    } on Exception catch (e) {
      return e;
    } finally {
      client.close();
    }
  }
}
