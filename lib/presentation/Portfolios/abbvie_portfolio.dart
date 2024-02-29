import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wang_hann_exhibition/app_ui/color/wang_hann_color.dart';
import 'package:wang_hann_exhibition/app_ui/typography/app_text_style.dart';
import 'package:wang_hann_exhibition/utils/context_extension.dart';
import 'package:wang_hann_exhibition/widget/base_portfolio.dart';

class AbbViePortfolio extends StatelessWidget {
  const AbbViePortfolio({
    super.key,
  });

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
                  'AbbVie 艾伯維藥品',
                  style: UITextStyle.h2.copyWith(
                    color: WangHannColor.white,
                  ),
                ),
                Text(
                  '#2023 PSS 治療注射工作坊',
                  style: UITextStyle.title1Chinese.copyWith(
                    color: WangHannColor.white,
                  ),
                ),
                //FIXME
                Text(
                  '2023 June - December',
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
                    '台灣腦中風學會 與 台灣肌肉骨骼神經超音波醫學會 攜手共著《Post-Stroke Spasticity: Ultrasound-Guided Botulinum Toxin Injection》針對臨床常見的８種痙攣型態，給予治療評估、肌肉定位及肉毒桿菌素注射的全方位建議。手冊內容包含：8 種常見痙攣治療建議，超音波、EMG導引治療準備建議、教學精華影片！',
                    style: UITextStyle.body1.copyWith(
                      color: WangHannColor.white,
                    ),
                  ),
                )
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
                        'AbbVie 艾伯維藥品',
                        style: UITextStyle.h2.copyWith(
                          color: WangHannColor.white,
                        ),
                      ),
                      Text(
                        '#2023 PSS 治療注射工作坊',
                        style: UITextStyle.title1Chinese.copyWith(
                          color: WangHannColor.white,
                        ),
                      ),
                      const Gap(8),
                      Text(
                        '2023 June - December',
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
                    '台灣腦中風學會 與 台灣肌肉骨骼神經超音波醫學會 攜手共著《Post-Stroke Spasticity: Ultrasound-Guided Botulinum Toxin Injection》針對臨床常見的８種痙攣型態，給予治療評估、肌肉定位及肉毒桿菌素注射的全方位建議。手冊內容包含：8 種常見痙攣治療建議，超音波、EMG導引治療準備建議、教學精華影片！',
                    style: UITextStyle.body1.copyWith(
                      color: WangHannColor.white,
                    ),
                  ),
                ),
              ],
            )
          ],
          const Gap(36),
          CachedNetworkImage(
            imageUrl: 'https://i.imgur.com/AyGbSq6.jpg',
          ),
          const Gap(24),
          CachedNetworkImage(
            imageUrl: 'https://i.imgur.com/SfRRt8h.jpg',
          ),
          const Gap(24),
          CachedNetworkImage(
            imageUrl: 'https://i.imgur.com/Ztocxbn.jpg',
          ),
          const Gap(24),
          CachedNetworkImage(
            imageUrl: 'https://i.imgur.com/lrYZVoj.jpg',
          ),
          //FIXME: Video
          const Gap(24),
          CachedNetworkImage(
            imageUrl: 'https://i.imgur.com/I0e3NVS.jpg',
          ),
        ],
      ),
      nextRoute: '/Merck',
      nextOrganization: 'Merck KGaA 默克',
      nextImageUrl: 'https://i.imgur.com/h7FCNgn.png',
      nextWorkshop: '默克中國海峽兩岸視訊連線 醫學教育直播',
    );
  }
}
