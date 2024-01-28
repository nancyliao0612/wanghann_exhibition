import 'package:flutter/material.dart';
import 'package:wang_hann_exhibition/app_ui/color/wang_hann_color.dart';
import 'package:wang_hann_exhibition/app_ui/typography/app_text_style.dart';
import 'package:wang_hann_exhibition/utils/context_extension.dart';
import 'package:wang_hann_exhibition/utils/key.dart';
import 'package:wang_hann_exhibition/widget/padding_extension.dart';
import 'package:gap/gap.dart';

class ServicePage extends StatelessWidget {
  const ServicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return context.isSmallScreen
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'WHAT WE DO',
                    style: UITextStyle.h3.copyWith(
                      color: WangHannColor.white,
                    ),
                  )
                ],
              ),
              const Gap(36),
              service(context.isSmallScreen, 'Brand Development And Promotion',
                  '品牌發展與推廣'),
              const Gap(16),
              service(context.isSmallScreen, 'PR And Influence', '公關與影響力'),
              const Gap(16),
              service(context.isSmallScreen, 'Medical Education', '醫學教育活動及會議'),
              const Gap(16),
              service(context.isSmallScreen, 'Data, Intelligence And Strategy',
                  '數據、情報與策略'),
              const Gap(16),
              service(
                  context.isSmallScreen, 'Experience And Innovation', '生醫新創公司'),
              const Gap(16),
              service(context.isSmallScreen, 'Market Access And Payer',
                  '產品上市、市場准入活動'),
            ],
          ).mobileBlackBackgroundPadding(NavigationKey.service).blackBackground
        : Column(
            children: [
              Row(
                children: [
                  Text(
                    'WHAT WE DO',
                    style: UITextStyle.h3PC.copyWith(
                      color: WangHannColor.white,
                    ),
                  )
                ],
              ),
              const Gap(64),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        service(context.isSmallScreen,
                            'Brand Development And Promotion', '品牌發展與推廣'),
                        const Gap(16),
                        service(context.isSmallScreen, 'Medical Education',
                            '醫學教育活動及會議'),
                        const Gap(16),
                        service(context.isSmallScreen,
                            'Experience And Innovation', '生醫新創公司'),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        service(context.isSmallScreen, 'PR And Influence',
                            '公關與影響力'),
                        const Gap(16),
                        service(context.isSmallScreen,
                            'Data, Intelligence And Strategy', '數據、情報與策略'),
                        const Gap(16),
                        service(context.isSmallScreen,
                            'Market Access And Payer', '產品上市、市場准入活動'),
                      ],
                    ),
                  )
                ],
              )
            ],
          ).pcBlackBackgroundPadding(NavigationKey.service).blackBackground;
  }
}

Widget service(isSmallScreen, serviceItemInEnglish, serviceItemInChinese) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          Expanded(
            child: Text(
              serviceItemInEnglish,
              style: (isSmallScreen ? UITextStyle.title1 : UITextStyle.title1PC)
                  .copyWith(
                color: WangHannColor.white,
              ),
            ),
          )
        ],
      ),
      Row(
        children: [
          Expanded(
            child: Text(
              serviceItemInChinese,
              style: (isSmallScreen ? UITextStyle.title1 : UITextStyle.title1PC)
                  .copyWith(
                color: WangHannColor.white.withOpacity(0.5),
              ),
            ),
          )
        ],
      )
    ],
  );
}
