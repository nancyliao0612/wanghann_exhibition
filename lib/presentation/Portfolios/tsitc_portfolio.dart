import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:wang_hann_exhibition/app_ui/color/wang_hann_color.dart';
import 'package:wang_hann_exhibition/app_ui/typography/app_text_style.dart';
import 'package:wang_hann_exhibition/main.dart';
import 'package:wang_hann_exhibition/utils/key.dart';
import 'package:wang_hann_exhibition/widget/base_portfolio.dart';

class TSITCPortfolio extends StatefulWidget {
  const TSITCPortfolio({
    super.key,
    // required this.itemScrollController,
  });

  // final ItemScrollController itemScrollController;

  @override
  State<TSITCPortfolio> createState() => _TSITCPortfolioState();
}

class _TSITCPortfolioState extends State<TSITCPortfolio> {
  // @override
  // void dispose() {
  //   super.dispose();
  //   // widget.itemScrollController.dispose;
  // }

  @override
  Widget build(BuildContext context) {
    return BasePortfolio(
      // itemScrollController: widget.itemScrollController,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextButton(
              onPressed: () async {
                Navigator.pushNamed(context, '/', arguments: 'about'
                    // MaterialPageRoute(
                    //   builder: (context) => MyHomePage('about'),
                    // ),
                    );

                // context.goNamed('/', extra: 'about');

                // await Navigator.of(context).pushNamed('/');

                // Scrollable.ensureVisible(
                //   NavigationKey.about.currentContext!,
                //   duration: Duration(milliseconds: 500),
                //   curve: Curves.easeInOut,
                // );
              },
              child: Text('click')),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'TSITC 台灣免疫暨腫瘤學會',
                style: UITextStyle.h2.copyWith(
                  color: WangHannColor.white,
                ),
              ),
              Text(
                '112年度 癌症治療解密研習班',
                style: UITextStyle.title1.copyWith(
                  color: WangHannColor.white,
                ),
              ),
              //FIXME
              Text(
                '2023 May - October',
                style: UITextStyle.title1.copyWith(
                  color: WangHannColor.grey,
                ),
              ),
            ],
          ),
          const Gap(36),
          Row(
            children: [
              Text(
                '每季四堂課\n每堂用2個案例帶你看癌症治療在搞什麼？\n再用1頓飯的時間,與專家共進午餐輕鬆聊！',
                style: UITextStyle.body1.copyWith(
                  color: WangHannColor.white,
                ),
              ),
            ],
          ),
          const Gap(36),
          CachedNetworkImage(
            imageUrl: 'https://i.imgur.com/RKVDa9a.jpg',
          ),
          const Gap(24),
          CachedNetworkImage(
            imageUrl: 'https://i.imgur.com/1EwMgSV.jpg',
          ),
          const Gap(57.5),
          Text(
            '汪翰團隊有熱情有活力，能細心聆聽客戶訴求，耐心與客戶討論，協助客戶順利完成專案，是值得長期配合的好夥伴！\n\n台灣免疫暨腫瘤學會(Taiwan Society of Immunotherapy for Cancer，TSITC)',
            style: UITextStyle.body1.copyWith(
              color: WangHannColor.white,
            ),
          ),
          const Gap(57.5),
          CachedNetworkImage(
            imageUrl: 'https://i.imgur.com/DYTRIOH.jpg',
          ),
          const Gap(24),
          CachedNetworkImage(
            imageUrl: 'https://i.imgur.com/mRlmE0O.jpg',
          ),
          const Gap(24),
          CachedNetworkImage(
            imageUrl: 'https://i.imgur.com/XZXFWfD.jpg',
          ),
        ],
      ),
      nextRoute: '/AbbVie',
      nextOrganization: 'AbbVie 艾伯維藥品',
      nextImageUrl: 'https://i.imgur.com/AyGbSq6.jpg',
      nextWorkshop: '#2023 PSS治療注射工作坊',
    );
  }
}
