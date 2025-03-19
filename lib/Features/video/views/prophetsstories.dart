import 'package:deen/Controllers/videolist.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Prophetstoriesscreen extends StatefulWidget {
  const Prophetstoriesscreen({super.key});

  @override
  State<Prophetstoriesscreen> createState() => _ProphetstoriesscreenState();
}

class _ProphetstoriesscreenState extends State<Prophetstoriesscreen> {
  late List<YoutubePlayerController> _controllers;
  late List<bool> _isPlayerReadyList;

  @override
  void initState() {
    super.initState();
    _controllers = ProphetsvideoData.prophetsvideo.map((video) {
      final videoId = YoutubePlayer.convertUrlToId(video.videolink);
      return YoutubePlayerController(
        initialVideoId: videoId ?? "",
        flags: const YoutubePlayerFlags(
          autoPlay: false,
          mute: false,
        ),
      );
    }).toList();

    _isPlayerReadyList = List.generate(_controllers.length, (index) => false);

    for (var controller in _controllers) {
      controller.addListener(() {
        final index = _controllers.indexOf(controller);
        if (controller.value.isReady && !_isPlayerReadyList[index]) {
          setState(() {
            _isPlayerReadyList[index] = true;
          });
        }
      });
    }
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('قصص الأنبياء'),
      ),
      body: ListView.builder(
        itemCount: ProphetsvideoData.prophetsvideo.length,
        itemBuilder: (context, index) {
          final video = ProphetsvideoData.prophetsvideo[index];
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    video.title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  YoutubePlayerBuilder(
                    player: YoutubePlayer(
                      controller: _controllers[index],
                      showVideoProgressIndicator: true,
                    ),
                    builder: (context, player) {
                      return SizedBox(
                        height: 200,
                        width: double.infinity,
                        child: player,
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
