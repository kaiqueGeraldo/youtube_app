// ignore_for_file: must_be_immutable

import 'package:app_youtube/components/api.dart';
import 'package:app_youtube/models/video.dart';
import 'package:app_youtube/views/video_player_screen.dart';
import 'package:flutter/material.dart';

class Inicio extends StatefulWidget {
  String pesquisa;
  Inicio({super.key, required this.pesquisa});

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  Future<List<Video>> _listarVideos(String pesquisa) async {
    Api api = Api();
    List<Video> videos = await api.pesquisar(pesquisa);
    print('Videos retornados: $videos');
    return videos;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Video>>(
        future: _listarVideos(widget.pesquisa),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.red,
                ),
              );
            case ConnectionState.active:
            case ConnectionState.done:
              if (snapshot.hasData) {
                return ListView.separated(
                    itemBuilder: (context, index) {
                      List<Video>? videos = snapshot.data;
                      Video video = videos![index];

                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => VideoPlayerScreen(
                                videoId: video.id,
                                tituloVideo: video.titulo,
                                nomeCanal: video.canal,
                              ),
                            ),
                          );
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 200,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(video.imagem),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            ListTile(
                              title: Text(video.titulo),
                              subtitle: Text(video.canal),
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => const Divider(
                          height: 3,
                          color: Colors.black26,
                        ),
                    itemCount: snapshot.data!.length);
              } else if (snapshot.hasError) {
                print('Erro ao carregar dados: ${snapshot.error}');
                return Center(
                  child: Text('Erro ao carregar dados: ${snapshot.error}'),
                );
              } else {
                return const Center(
                  child: Text('Nenhum dado a ser exibido!'),
                );
              }
            default:
              return throw Exception('Falha inesperada');
          }
        });
  }
}
