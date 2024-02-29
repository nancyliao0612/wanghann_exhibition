import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:video_player/video_player.dart';
import 'package:wang_hann_exhibition/app_ui/color/wang_hann_color.dart';
import 'package:wang_hann_exhibition/app_ui/typography/app_text_style.dart';
import 'package:wang_hann_exhibition/constant/video_path.dart';

class PCHomeVideo extends StatefulWidget {
  const PCHomeVideo(
    this.itemScrollController,
    this.context, {
    super.key,
  });

  final ItemScrollController itemScrollController;
  final BuildContext context;

  @override
  State<PCHomeVideo> createState() => _PCHomeVideoState();
}

class _PCHomeVideoState extends State<PCHomeVideo> {
  VideoPlayerController? _controller;
  late Future<void>? _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.asset(VideoPath.promotionalVideo);

    _initializeVideoPlayerFuture = _controller?.initialize();

    // https://stackoverflow.com/questions/59966403/flutter-web-video-player-autoplay
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // mutes the video
      _controller?.setVolume(0);
      // Plays the video once the widget is build and loaded.
      _controller?.play();
    });
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          _controller?.play();
          _controller?.setLooping(true);

          return ColoredBox(
            color: WangHannColor.black,
            child: Stack(
              children: [
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: VideoPlayer(_controller!),
                ),
                Positioned(
                  bottom: 0,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 960),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: Row(
                            children: [
                              Text(
                                '在生醫貪玩，在專業貪心',
                                style: UITextStyle.h2Chinese.copyWith(
                                  color: WangHannColor.white,
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        } else {
          return ColoredBox(
            color: WangHannColor.black,
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Center(
                child: CircularProgressIndicator(
                  color: WangHannColor.grey,
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
