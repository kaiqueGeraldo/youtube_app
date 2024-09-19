// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayerScreen extends StatefulWidget {
  final String videoId;
  final String tituloVideo;
  final String nomeCanal;

  const VideoPlayerScreen(
      {super.key,
      required this.videoId,
      required this.tituloVideo,
      required this.nomeCanal});

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          shape: const BorderDirectional(
              bottom: BorderSide(width: 3, color: Colors.black12)),
          title: Image.network(
              width: 120,
              'https://logodownload.org/wp-content/uploads/2014/10/youtube-logo-4-3.png'),
        ),
        body: Column(
          children: [
            YoutubePlayer(
              controller: _controller,
              showVideoProgressIndicator: true,
              progressIndicatorColor: Colors.red,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          widget.tituloVideo,
                          style: const TextStyle(fontSize: 20),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 30),
                  Row(
                    children: [
                      Text(
                        widget.nomeCanal,
                        style: const TextStyle(fontSize: 20),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
