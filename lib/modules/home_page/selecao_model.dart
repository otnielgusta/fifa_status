import 'package:fifa_status/modules/jogadores/jogador_model.dart';

class SelecaoModel{
  String? id;
  String? nome;
  String? bandeira;
  List<JogadorModel>? jogadores;

  SelecaoModel({this.id, this.nome, this.bandeira, this.jogadores});

  SelecaoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    bandeira = json['bandeira'];
    if (json['jogadores'] != null) {
      jogadores = <JogadorModel>[];
      json['jogadores'].forEach((v) {
        jogadores!.add(new JogadorModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['bandeira'] = this.bandeira;
    if (this.jogadores != null) {
      data['jogadores'] = this.jogadores!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}