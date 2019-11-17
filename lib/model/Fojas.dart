class Foja {
  int nro;
  int pagina;
  String image;
  String contenido;
  int idDocumento;
  int codExpediente;

  Foja(int nro,int pagina,String image,String contenido,int idDocumento,int codExpediente) {
          this.nro=nro;
          this.pagina=pagina;
          this.image=image;
          this.contenido=contenido;
          this.idDocumento=idDocumento;
          this.codExpediente=codExpediente;
  }

  Foja.fromJson(Map<String, dynamic> json) {
    nro = int.parse(json['Nro']);
    pagina = int.parse(json['Page']);
    image = json['Image'];
    contenido = json['Contenido'];
    idDocumento = int.parse(json['Id_documento']);
    codExpediente = int.parse(json['CodExpediente']);
    }

    

}
