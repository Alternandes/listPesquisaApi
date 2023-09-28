class Animais {
  int id = 0;
  String nome = "";
  String foto = "";
  int idade = 0;
  String dono = "";
  String endereco = "";
  String caracteristica = "";
  String raca = "";

  Animais(this.id, this.nome, this.foto, this.idade, this.dono, this.endereco,
      this.caracteristica, this.raca);

  Animais.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    nome = json["nome"];
    foto = json["foto"];
    idade = json["idade"];
    dono = json["dono"];
    endereco = json["endereco"];
    caracteristica = json["caracteristica"];
    raca = json["raca"];
  }

  Map<String, dynamic> tojson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["nome"] = nome;
    data["foto"] = foto;
    data["idade"] = idade;
    data["dono"] = dono;
    data["endereco"] = endereco;
    data["caracteristica"] = caracteristica;
    data["raca"] = raca;
    return data;
  }
}
