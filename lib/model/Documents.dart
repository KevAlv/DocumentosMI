class Documento {
  int cod;
  int id;
  String title;
  String fecha;

  Documento(int cod, int id, title, String fecha) {
    this.cod = cod;
    this.title = title;
    this.fecha = fecha;
    this.id = id;
  }

  Documento.fromJson(Map<String, dynamic> json) {
    title = json['Documento'];
    fecha = json['Fecha'];
    id = int.parse(json['Id']);
    cod = int.parse(json['CodExpediente']);
  }
}
