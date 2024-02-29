import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:video_player/video_player.dart';
import 'package:wang_hann_exhibition/app_ui/color/wang_hann_color.dart';
import 'package:wang_hann_exhibition/app_ui/typography/app_text_style.dart';
import 'package:wang_hann_exhibition/constant/video_path.dart';

class HomeVideo extends StatefulWidget {
  const HomeVideo(
    this.itemScrollController,
    this.context, {
    super.key,
  });

  final ItemScrollController itemScrollController;
  final BuildContext context;

  @override
  State<HomeVideo> createState() => _HomeVideoState();
}

class _HomeVideoState extends State<HomeVideo> {
  VideoPlayerController? _controller;
  late Future<void>? _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.asset(VideoPath.mobilePromotionalVideo);

    _initializeVideoPlayerFuture = _controller?.initialize();

    // https://stackoverflow.com/questions/59966403/flutter-web-video-player-autoplay
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // mutes the video
      _controller?.setVolume(0);
      // Plays the video once the widget is build and loaded.
      _controller?.play();
    });

    // _controller?.play();

    // // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
    // _controller?.initialize().then((_) {
    //   _controller?.setLooping(true);
    //   // Plays the video once the widget is build and loaded.
    //   _controller?.play();
    // });
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
                  aspectRatio: 4 / 3,
                  child: VideoPlayer(_controller!),
                ),
                Positioned(
                  bottom: 0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: SizedBox(
                      width: 327,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '在生醫貪玩，',
                            style: UITextStyle.h2Chinese.copyWith(
                              color: WangHannColor.white,
                            ),
                          ),
                          Text(
                            '在專業貪心',
                            style: UITextStyle.h2Chinese.copyWith(
                              color: WangHannColor.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        } else {
          return ColoredBox(
            color: WangHannColor.black,
            child: AspectRatio(
              aspectRatio: 4 / 3,
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
