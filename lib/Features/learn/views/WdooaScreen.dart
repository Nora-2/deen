// ignore_for_file: file_names

import 'package:deen/Controllers/wodoulist.dart';
import 'package:deen/Features/learn/widgets/gridcustom.dart';
import 'package:deen/Features/learn/widgets/mostcategoriescard.dart';
import 'package:deen/Models/mostof%20categorymodel.dart';
import 'package:deen/core/utils/widgets/sizedbox/sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class WdooaScreen extends StatefulWidget {
  const WdooaScreen({super.key});
  @override
  State<WdooaScreen> createState() => _WdooaScreenState();
}

class _WdooaScreenState extends State<WdooaScreen> {
  // ignore: non_constant_identifier_names
  final List<Mostofcategorymodel> items = WdooaData.items;
  late YoutubePlayerController _controller;
  bool _isPlayerReady = false;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(WdooaData.wdouavideo)!,
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
                      dataList: WdooaData.items,
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
