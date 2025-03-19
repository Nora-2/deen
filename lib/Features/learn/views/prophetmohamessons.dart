import 'package:deen/Controllers/Chlidrenofprofitlist.dart';
import 'package:deen/Features/learn/widgets/gridcustom.dart';
import 'package:deen/Features/learn/widgets/mostcategoriescard.dart';
import 'package:deen/Models/mostof%20categorymodel.dart';
import 'package:deen/core/utils/widgets/sizedbox/sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ProphetmohamedsonsScreen extends StatefulWidget {
  const ProphetmohamedsonsScreen({super.key});
  @override
  State<ProphetmohamedsonsScreen> createState() =>
      _ProphetmohamedsonsScreenState();
}

class _ProphetmohamedsonsScreenState extends State<ProphetmohamedsonsScreen> {
  // ignore: non_constant_identifier_names
  final List<Mostofcategorymodel> SON = ChlidrenofprofitData.sons;
  late YoutubePlayerController _controller;
  bool _isPlayerReady = false;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId:
          YoutubePlayer.convertUrlToId(ChlidrenofprofitData.sonvideo)!,
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
                    CustomGridView<Mostofcategorymodel>(
                      dataList: ChlidrenofprofitData.sons,
                      itemBuilder: (son) {
                        return CategoriesCard(
                            categorymodel: son); // Card widget for each animal
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
// import 'package:flutter/material.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';

// class YouTubeVideoScreen extends StatefulWidget {
//   @override
//   _YouTubeVideoScreenState createState() => _YouTubeVideoScreenState();
// }

// class _YouTubeVideoScreenState extends State<YouTubeVideoScreen> {
//   late YoutubePlayerController _controller;
//   bool _isPlayerReady = false;

//   @override
//   void initState() {
//     super.initState();
//     _controller = YoutubePlayerController(
//       initialVideoId: YoutubePlayer.convertUrlToId("https://www.youtube.com/watch?v=dQw4w9WgXcQ")!,
//       flags: YoutubePlayerFlags(
//         autoPlay: true,
//         mute: false,
//       ),
//     )
//       ..addListener(() {
//         if (_controller.value.isReady && !_isPlayerReady) {
//           setState(() {
//             _isPlayerReady = true;
//           });
//           
//         }
//       });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: YoutubePlayerBuilder(
//         player: YoutubePlayer(
//           controller: _controller,
//           showVideoProgressIndicator: true,
//           onReady: () {
//             setState(() {
//               _isPlayerReady = true;
//             });
//             
//           },
         
            
//           onEnded: (data) {
//             _controller.load(YoutubePlayer.convertUrlToId("")!);
//           },
//         ),
//         builder: (context, player) {
//           return Column(
//             children: [
//               player,
             
//             ],
//           );
//         },
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
// }