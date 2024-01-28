import 'package:flutter/material.dart';
import 'package:wang_hann_exhibition/app_ui/typography/app_text_style.dart';
import 'package:wang_hann_exhibition/utils/context_extension.dart';
import 'package:wang_hann_exhibition/widget/base_work.dart';
import 'package:wang_hann_exhibition/widget/padding_extension.dart';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              'OUR WORKS',
              style: context.isSmallScreen ? UITextStyle.h3 : UITextStyle.h3PC,
            )
          ],
        ),
        BaseWork(
            route: '/TSITC',
            imageUrl: 'https://i.imgur.com/1EwMgSV.jpg',
            client: 'TSITC 臺灣免疫暨腫瘤學會',
            event: '112年度 癌症治療解密研習班',
            isSmallScreen: context.isSmallScreen),
        BaseWork(
          route: '/AbbVie',
          imageUrl: 'https://i.imgur.com/AyGbSq6.jpg',
          client: 'AbbVie 艾伯維藥品',
          event: '#2023 PSS治療注射工作坊',
          isSmallScreen: context.isSmallScreen,
        ),
        BaseWork(
          route: '/Merck',
          imageUrl: 'https://i.imgur.com/h7FCNgn.png',
          client: 'Merck KGaA 默克',
          event: '默克中國海峽兩岸視訊連線 醫學教育直播',
          isSmallScreen: context.isSmallScreen,
        ),
        //FIXME: The image url is to be confirmed
        BaseWork(
          route: '/TAITRA',
          imageUrl: 'https://i.imgur.com/HKM9xrx.jpg',
          client: '外貿協會',
          event:
              '外貿協會主辦的「台灣國際醫療暨健康照護展(Medical Taiwan)」整合醫療、照護以及科技產業，打造最完整的健康產業生態系',
          isSmallScreen: context.isSmallScreen,
        ),
        BaseWork(
          externalLink: true,
          imageUrl: 'https://i.imgur.com/EoxdRjD.jpg',
          client: '羅氏 x 資誠聯合會計師事務所',
          showArrow: true,
          event: '台灣推行次世代基因定序檢測實驗室管理與給付政策之探討',
          isSmallScreen: context.isSmallScreen,
        ),
      ],
    ).customWhiteBackgroundPadding(
      isSmallScreen: context.isSmallScreen,
    );
  }
}
