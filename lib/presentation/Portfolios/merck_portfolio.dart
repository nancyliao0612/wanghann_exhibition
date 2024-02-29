import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:video_player/video_player.dart';
import 'package:wang_hann_exhibition/app_ui/color/wang_hann_color.dart';
import 'package:wang_hann_exhibition/app_ui/typography/app_text_style.dart';
import 'package:wang_hann_exhibition/constant/logo_path.dart';
import 'package:wang_hann_exhibition/constant/video_path.dart';
import 'package:wang_hann_exhibition/utils/context_extension.dart';
import 'package:wang_hann_exhibition/widget/base_portfolio.dart';

class MerckPortfolio extends StatefulWidget {
  const MerckPortfolio({
    super.key,
  });

  @override
  State<MerckPortfolio> createState() => _MerckPortfolioState();
}

class _MerckPortfolioState extends State<MerckPortfolio> {
  late VideoPlayerController _controller;
  late ChewieController chewieController;
  late bool isClicked;

  @override
  void dispose() {
    _controller.dispose();
    chewieController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    isClicked = false;

    _controller = VideoPlayerController.asset(VideoPath.tsrm_s_v4f);

    _controller.initialize().then((_) {
      // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.

      // mutes the video
      _controller.setVolume(0);
      // Plays the video once the widget is build and loaded.
      _controller.play();
      setState(() {});

      chewieController = ChewieController(
        videoPlayerController: _controller,
        autoPlay: true,
        looping: true,
      );

      // _controller.value.isPlaying
    });
  }

  void replay(icClicked) async {
    if (isClicked) {
      await _controller.initialize();
      _controller.play();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BasePortfolio(
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (context.isSmallScreen) ...[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Merck KGaA 默克',
                  style: UITextStyle.h2.copyWith(
                    color: WangHannColor.white,
                  ),
                ),
                Text(
                  '默克中國海峽兩岸視訊連線 醫學教育直播',
                  style: UITextStyle.title1Chinese.copyWith(
                    color: WangHannColor.white,
                  ),
                ),
                Text(
                  '2020 - 2023',
                  style: UITextStyle.title1.copyWith(
                    color: WangHannColor.grey,
                  ),
                ),
              ],
            ),
            const Gap(36),
            Row(
              children: [
                Expanded(
                  child: Text(
                    '默克集團邀請台大醫院婦產部醫師專家\n針對低反應及高齡族群拮抗劑鮮胚移植的跨國經驗分享\n透過一系列透過專家對對談和辯論，協助 IVF 專家判斷使用拮抗劑最好的使用時機和劑量，達到對個案最好的處置',
                    style: UITextStyle.body1.copyWith(
                      color: WangHannColor.white,
                    ),
                  ),
                ),
              ],
            ),
          ] else ...[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Merck KGaA 默克',
                        style: UITextStyle.h2.copyWith(
                          color: WangHannColor.white,
                        ),
                      ),
                      Text(
                        '默克中國海峽兩岸視訊連線 醫學教育直播',
                        style: UITextStyle.title1Chinese.copyWith(
                          color: WangHannColor.white,
                        ),
                      ),
                      Text(
                        '2020 - 2023',
                        style: UITextStyle.title1.copyWith(
                          color: WangHannColor.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                const Gap(24),
                Expanded(
                  child: Text(
                    '默克集團邀請台大醫院婦產部醫師專家\n針對低反應及高齡族群拮抗劑鮮胚移植的跨國經驗分享\n透過一系列透過專家對對談和辯論，協助 IVF 專家判斷使用拮抗劑最好的使用時機和劑量，達到對個案最好的處置',
                    style: UITextStyle.body1.copyWith(
                      color: WangHannColor.white,
                    ),
                  ),
                ),
              ],
            )
          ],
          const Gap(36),
          Center(
            child: AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: Stack(
                children: [
                  isClicked
                      ? Chewie(controller: chewieController)
                      : _controller.value.isInitialized
                          ? VideoPlayer(_controller)
                          : Center(
                              child: CircularProgressIndicator(
                                  color: WangHannColor.black60)),
                  if (!isClicked && _controller.value.isInitialized)
                    ColoredBox(
                      color: WangHannColor.videoMask,
                      child: Center(
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              isClicked = true;
                            });
                            replay(isClicked);
                          },
                          icon: SvgPicture.asset(LogoPath.playCircleBtn),
                          color: WangHannColor.white,
                          iconSize: 80,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
      nextRoute: '/TAITRA',
      nextOrganization: '外貿協會',
      nextImageUrl: 'https://i.imgur.com/41bxWBt.jpg',
      nextWorkshop:
          '外貿協會主辦的「台灣國際醫療暨健康照護展(Medical Taiwan)」整合醫療、照護以及科技產業，打造最完整的健康產業生態系',
    );
  }
}
