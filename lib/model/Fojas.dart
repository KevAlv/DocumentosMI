class Foja {
  int nro;
  String image;
  String contenido;
  int idDocumento;
  int codExpediente;

  Foja(int nro,String image,String contenido,int idDocumento,int codExpediente) {
          this.nro=nro;
          this.image=image;
          this.contenido=contenido;
          this.idDocumento=idDocumento;
          this.codExpediente=codExpediente;
  }

  Foja.fromJson(Map<String, dynamic> json) {
    nro = json['Nro'];
    image = json['Image'];
    contenido = json['Contenido'];
    idDocumento = json['Id_Documento'];
    codExpediente = json['Cod_Expediente'];
      }
}
