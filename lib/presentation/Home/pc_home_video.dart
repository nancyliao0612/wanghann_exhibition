import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
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

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.asset(VideoPath.promotionalVideo);

    _controller?.addListener(() {
      setState(() {});
    });
    _controller?.setLooping(true);
    _controller?.initialize().then((_) => setState(() {}));
    _controller?.play();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // print('_controller.value.aspectRatio ${_controller.value.aspectRatio}');
    return _controller?.value.isInitialized ?? false
        ? Stack(
            children: [
              AspectRatio(
                aspectRatio: 16 / 9,
                child: VideoPlayer(_controller!),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 960),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '在生醫貪玩，在專業貪心',
                            style: UITextStyle.h2PC
                                .copyWith(color: WangHannColor.white),
                          ),
                          const Gap(2),
                          //FIXME
                          Text(
                            'Exceptional People, Building Exceptional Companies',
                            style: UITextStyle.title1PC
                                .copyWith(color: WangHannColor.white),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          )
        : const Text('loading...');
  }
}
