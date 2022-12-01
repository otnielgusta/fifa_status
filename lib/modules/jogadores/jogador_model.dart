class JogadorModel {
  String? id;
  String? nome;
  String? segundoNome;
  String? idade;
  String? partidas;
  String? posicao;
  String? gols;
  String? imagem1;
  String? imagem2;

  JogadorModel(
      {this.id,
      this.nome,
      this.segundoNome,
      this.idade,
      this.partidas,
      this.posicao,
      this.gols,
      this.imagem1,
      this.imagem2});

  JogadorModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    segundoNome = json['segundo_nome'];
    idade = json['idade'];
    partidas = json['partidas'];
    posicao = json['posicao'];
    gols = json['gols'];
    imagem1 = json['imagem1'];
    imagem2 = json['imagem2'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['segundo_nome'] = this.segundoNome;
    data['idade'] = this.idade;
    data['partidas'] = this.partidas;
    data['posicao'] = this.posicao;
    data['gols'] = this.gols;
    data['imagem1'] = this.imagem1;
    data['imagem2'] = this.imagem2;
    return data;
  }
}
