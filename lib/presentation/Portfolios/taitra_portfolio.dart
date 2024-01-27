import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:video_player/video_player.dart';
import 'package:wang_hann_exhibition/app_ui/color/wang_hann_color.dart';
import 'package:wang_hann_exhibition/app_ui/typography/app_text_style.dart';
import 'package:wang_hann_exhibition/constant/logo_path.dart';
import 'package:wang_hann_exhibition/constant/video_path.dart';
import 'package:wang_hann_exhibition/utils/context_extension.dart';
import 'package:wang_hann_exhibition/widget/base_portfolio.dart';

class TAITRAPortfolio extends StatefulWidget {
  const TAITRAPortfolio({
    super.key,
    // required this.itemScrollController,
  });

  @override
  State<TAITRAPortfolio> createState() => _TAITRAPortfolioState();
}

class _TAITRAPortfolioState extends State<TAITRAPortfolio> {
  late VideoPlayerController _controller;

  late bool isClicked;

  @override
  void initState() {
    super.initState();
    isClicked = false;

    _controller =
        VideoPlayerController.asset(VideoPath.medicalTaiwanAftermovie);

    _controller.initialize().then((_) {
      // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.

      // mutes the video
      _controller.setVolume(0);
      // Plays the video once the widget is build and loaded.
      _controller.play();
      setState(() {});

      // _controller.value.isPlaying
    });
  }

  void replay(icClicked) async {
    if (isClicked) {
      await _controller.initialize();
      _controller.play();
      _controller.setVolume(0.5);
    }
  }

  // final ItemScrollController itemScrollController;
  @override
  Widget build(BuildContext context) {
    return BasePortfolio(
      // itemScrollController: itemScrollController,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '外貿協會',
                style: UITextStyle.h2.copyWith(
                  color: WangHannColor.white,
                ),
              ),
              Text(
                '外貿協會主辦的「台灣國際醫療暨健康照護展(Medical Taiwan)」整合醫療、照護以及科技產業，打造最完整的健康產業生態系',
                style: UITextStyle.title1.copyWith(
                  color: WangHannColor.white,
                ),
              ),
              //FIXME
              Text(
                '2023 June',
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
                  '2023 台灣國際醫療暨健康照護展​外貿協會舉辦之「台灣國際醫療暨健康照護展（Medical Taiwan）」展覽以「Beyond Healthcare」為題，強調業者及民眾在健康照護的基礎下，更加關注以人為本的需求。​展會期間國內外雙向採購洽談會，更集結來自歐美、亞洲各國共計40名買主與臺灣企業進行99場次媒合洽談，疫後復甦的實體商機可期。',
                  style: UITextStyle.body1.copyWith(
                    color: WangHannColor.white,
                  ),
                ),
              ),
            ],
          ),
          const Gap(36),
          Center(
            child: _controller.value.isInitialized
                ? AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: Stack(children: [
                      VideoPlayer(_controller),
                      if (!isClicked)
                        ColoredBox(
                          color: WangHannColor.videoMask,
                          child: Center(
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  isClicked = true;
                                });
                                replay(isClicked);
                                // _controller.initialize();
                                // _controller.play();
                              },
                              // icon: const Icon(Icons.play_circle_fill_outlined),
                              icon: SvgPicture.asset(LogoPath.playCircleBtn),
                              color: WangHannColor.white,
                              iconSize: 90,
                            ),
                          ),
                        )
                    ]),
                  )
                : Container(),
          ),
          const Gap(24),
          CachedNetworkImage(
            imageUrl: 'https://i.imgur.com/HKM9xrx.jpg',
          ),
          const Gap(24),
          CachedNetworkImage(
            imageUrl: 'https://i.imgur.com/5BK61bw.jpg',
          ),
          const Gap(24),
          CachedNetworkImage(
            imageUrl: 'https://i.imgur.com/hTlkW2N.jpg',
          ),
          const Gap(24),
          CachedNetworkImage(
            imageUrl: 'https://i.imgur.com/3jLydGX.jpg',
          ),
          const Gap(24),
          CachedNetworkImage(
            imageUrl: 'https://i.imgur.com/tT8VaZF.jpg',
          ),
          const Gap(24),
          CachedNetworkImage(
            imageUrl: 'https://i.imgur.com/wYI2kTX.jpg',
          ),
          const Gap(24),
          if (context.isSmallScreen) ...[
            CachedNetworkImage(
              imageUrl: 'https://i.imgur.com/iiiXZ5d.jpg',
            ),
            const Gap(24),
            AspectRatio(
              aspectRatio: 1.5,
              child: CachedNetworkImage(
                width: 335,
                height: 223,
                fit: BoxFit.cover,
                imageUrl: 'https://i.imgur.com/G3BJYfU.jpg',
              ),
            ),
            const Gap(24),
          ] else ...[
            Row(
              children: [
                CachedNetworkImage(
                  width: 444,
                  height: 606,
                  fit: BoxFit.cover,
                  imageUrl: 'https://i.imgur.com/iiiXZ5d.jpg',
                ),
                const Gap(24),
                CachedNetworkImage(
                  width: 444,
                  height: 606,
                  fit: BoxFit.cover,
                  imageUrl: 'https://i.imgur.com/G3BJYfU.jpg',
                ),
              ],
            ),
            const Gap(24),
          ],
          CachedNetworkImage(
            imageUrl: 'https://i.imgur.com/pIXo1ow.jpg',
          ),
          const Gap(24),
          CachedNetworkImage(
            imageUrl: 'https://i.imgur.com/6IWo6oQ.jpg',
          ),
          const Gap(24),
          CachedNetworkImage(
            imageUrl: 'https://i.imgur.com/54c8lNj.jpg',
          ),
          const Gap(24),
          CachedNetworkImage(
            imageUrl: 'https://i.imgur.com/aybM4zt.jpg',
          ),
        ],
      ),
      externalLink: true,
      nextOrganization: '羅氏 x 資誠聯合會計師事務所',
      nextImageUrl: 'https://i.imgur.com/EoxdRjD.jpg',
      nextWorkshop: '台灣推行次世代基因定序檢測實驗室管理與給付政策之探討',
    );
  }
}
