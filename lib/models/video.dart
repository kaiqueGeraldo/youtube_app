class Video {
  String id;
  String titulo;
  String descricao;
  String imagem;
  String canal;

  Video(
      {required this.id,
      required this.titulo,
      required this.descricao,
      required this.imagem,
      required this.canal});

  /*static converterJson(Map<String, dynamic> json){
    return Video(
      id: json['id']['videoId'],
      titulo: json['snippet']['title'],
      imagem: json['snippet']['thumbnails']['high']['url'],
      canal: json['snippet']['channelId'],
    );
  }*/

  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
      id: json['id']['videoId'],
      titulo: json['snippet']['title'],
      descricao: json['snippet']['description'],
      canal: json['snippet']['channelTitle'],
      imagem: json['snippet']['thumbnails']['high']['url'],
    );
  }
}
