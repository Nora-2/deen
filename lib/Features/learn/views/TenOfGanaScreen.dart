// ignore_for_file: file_names

import 'package:deen/Controllers/tenofganalist.dart';
import 'package:deen/Features/learn/widgets/gridcustom.dart';
import 'package:deen/Features/learn/widgets/mostcategoriescard.dart';
import 'package:deen/Models/mostof%20categorymodel.dart';
import 'package:deen/core/utils/widgets/sizedbox/sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TenOfGanaScreen extends StatefulWidget {
  const TenOfGanaScreen({super.key});
  @override
  State<TenOfGanaScreen> createState() => _TenOfGanaScreenState();
}

class _TenOfGanaScreenState extends State<TenOfGanaScreen> {
  // ignore: non_constant_identifier_names
  final List<Mostofcategorymodel> SON = TenofganaData.items;
  late YoutubePlayerController _controller;
  bool _isPlayerReady = false;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId:
          YoutubePlayer.convertUrlToId(TenofganaData.tenofganavideo)!,
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    )..addListener(() {
        if (_controller.value.isReady && !_isPlayerReady) {
          setState(() {
            _isPlayerReady = true;
          });
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: YoutubePlayerBuilder(
          player: YoutubePlayer(
            controller: _controller,
            showVideoProgressIndicator: true,
            onReady: () {
              setState(() {
                _isPlayerReady = true;
              });
            },
            onEnded: (data) {
              _controller.load(YoutubePlayer.convertUrlToId("")!);
            },
          ),
          builder: (context, player) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.3,
                      width: double.infinity,
                      child: player,
                    ),
                    sized.s10,
                    CustomoneGridView<Mostofcategorymodel>(
                      dataList: TenofganaData.items,
                      itemBuilder: (item) {
                        return CategoriesCard(
                            categorymodel: item); // Card widget for each animal
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
