// ignore_for_file: constant_identifier_names

import 'package:app_youtube/models/video.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const CHAVE_YOUTUBE_API = 'AIzaSyDVJMBohcmVxHUfkWW9QoPsE5YTvtqAB4Q';
const ID_CANAL = 'UCVHFbqXqoYvEWM1Ddxl0QDg';
const URL_BASE = 'https://www.googleapis.com/youtube/v3/';

class Api {
  Future<List<Video>> pesquisar(String pesquisa) async {
  try {
    http.Response response = await http.get(
      Uri.parse('${URL_BASE}search'
          '?part=snippet'
          '&type=video'
          '&maxResults=20'
          '&order=date'
          '&key=$CHAVE_YOUTUBE_API'
          '&channelId=$ID_CANAL'
          '&q=$pesquisa'),
    );

    if (response.statusCode == 200) {
      print('Resposta da API: ${response.body}'); // Verifique a resposta da API
      Map<String, dynamic> dadosJson = json.decode(response.body);

      List<Video> videos = (dadosJson['items'] as List).map<Video>(
        (map) {
          return Video.fromJson(map);
        },
      ).toList();

      print('Vídeos retornados: $videos'); // Verifique os dados deserializados
      return videos;
    } else {
      print('Erro na API: ${response.statusCode}');
      throw Exception('Falha ao carregar os vídeos: ${response.statusCode}');
    }
  } catch (e) {
    print('Exceção ao pesquisar: $e');
    throw Exception('Falha ao carregar os vídeos: $e');
  }
}

}
