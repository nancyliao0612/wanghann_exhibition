import 'package:flutter/material.dart';
import 'package:wang_hann_exhibition/app_ui/color/wang_hann_color.dart';
import 'package:wang_hann_exhibition/app_ui/typography/app_text_style.dart';
import 'package:wang_hann_exhibition/constant/icon_path.dart';
import 'package:wang_hann_exhibition/widget/padding_extension.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intro_slider/intro_slider.dart';

class PcTestimony extends StatefulWidget {
  const PcTestimony({super.key});

  @override
  State<PcTestimony> createState() => _PcTestimonyState();
}

class _PcTestimonyState extends State<PcTestimony> {
  List<ContentConfig> listContentConfig = [];

  @override
  void initState() {
    super.initState();

    listContentConfig.add(
      ContentConfig(
        marginTitle: EdgeInsets.zero,
        widgetTitle: pcTestimony(
          "首次與汪翰生醫策展團隊合作，充分感受到熱情、熟稔又兼具創新的特質，著實讓活動增色不少，也能依照需求適時配合調整，是個讓人放心合作的好 Partner!",
          "中華民國對外貿易發展協會 展覽業務處",
        ),
        marginDescription: EdgeInsets.zero,
      ),
    );
    listContentConfig.add(
      ContentConfig(
        marginTitle: EdgeInsets.zero,
        widgetTitle: pcTestimony(
          "認真負責的態度，高品質的視訊連線，讓客戶安心、放心、滿意，早已成為固定合作的夥伴，一試成主顧！",
          "台灣默克股份有限公司西藥部 李家隆",
        ),
        marginDescription: EdgeInsets.zero,
      ),
    );
    listContentConfig.add(
      ContentConfig(
        marginTitle: EdgeInsets.zero,
        widgetTitle: pcTestimony(
          "汪翰團隊有熱情有活力，能細心聆聽客戶訴求，耐心與客戶討論，協助客戶順利完成專案，是值得長期配合的好夥伴!",
          "台灣免疫暨腫瘤學會",
        ),
        marginDescription: EdgeInsets.zero,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              'WHAT THEY SAY',
              style: UITextStyle.h3.copyWith(color: WangHannColor.white),
            )
          ],
        ),
        SizedBox(
          height: 400,
          child: IntroSlider(
            key: UniqueKey(),
            listContentConfig: listContentConfig,
            isShowPrevBtn: false,
            isShowSkipBtn: false,
            isShowNextBtn: false,
            isShowDoneBtn: false,
            indicatorConfig: IndicatorConfig(
              sizeIndicator: 12,
              indicatorWidget: SvgPicture.asset(IconPath.polygonGrey),
              activeIndicatorWidget: SvgPicture.asset(IconPath.polygon),
              spaceBetweenIndicator: 10.67,
            ),
            navigationBarConfig: NavigationBarConfig(
              padding: EdgeInsets.zero,
            ),
            backgroundColorAllTabs: WangHannColor.black,
          ),
        )
      ],
    ).pcBlackBackgroundPadding();
  }
}

Widget pcTestimony(String content, String source) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 155),
    child: Column(
      children: [
        const Gap(76),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '“',
              style: GoogleFonts.workSans(
                textStyle: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w600,
                  height: 0.8,
                  color: WangHannColor.white.withOpacity(0.5),
                ),
              ),
            ),
            Text(
              content,
              style: UITextStyle.body1.copyWith(color: WangHannColor.white),
            )
          ],
        ),
        const Gap(24),
        const SizedBox(
          width: 44,
          child: Divider(color: WangHannColor.white),
        ),
        const Gap(24),
        Align(
          alignment: Alignment.topRight,
          child: Text(
            source,
            style: UITextStyle.body1.copyWith(color: WangHannColor.white),
          ),
        )
      ],
    ),
  );
}
