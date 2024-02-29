import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wang_hann_exhibition/app_ui/color/wang_hann_color.dart';
import 'package:wang_hann_exhibition/app_ui/typography/app_text_style.dart';
import 'package:wang_hann_exhibition/widget/padding_extension.dart';

class Partner extends StatelessWidget {
  const Partner({super.key});

  @override
  Widget build(BuildContext context) {
    final mobileScreen = MediaQuery.sizeOf(context).width <= 480;
    final iPadScreen = MediaQuery.sizeOf(context).width > 480 &&
        MediaQuery.sizeOf(context).width < 960;
    final pcScreen = MediaQuery.sizeOf(context).width >= 960;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (mobileScreen) ...[
          Row(
            children: [
              Expanded(
                child: Text(
                  'WHO WE PARTNERED WITH',
                  style: UITextStyle.h3.copyWith(
                    color: WangHannColor.black,
                  ),
                ),
              )
            ],
          ),
          const Gap(36),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '10+',
                style: UITextStyle.h1.copyWith(
                  color: WangHannColor.black,
                ),
              ),
              Text(
                '藥廠、企業、醫學會',
                style: UITextStyle.h3Chinese.copyWith(
                  color: WangHannColor.lightGrey,
                ),
              )
            ],
          ),
          const Gap(32),
          Text(
            'Sanofi 賽諾菲\nRoche 羅氏\nMedJohnson 美強生\nillumina 因美納\nMerck KGaA 默克\nAbbVie 艾伯維\nTSITC 台灣免疫暨腫瘤學會\n台灣臨床腫瘤醫學會台灣病理學會\n中華民國內分泌暨糖尿病學會\n台灣生殖醫學會\n台灣婦產科醫學會\n台灣新生兒科醫學會\n台灣小兒消化醫學會\n臺灣牙周病醫學會\n台灣胰臟癌醫學會\nTAITRA 中華民國對外貿易發展協會\nPwC 資誠聯合會計師事務所\nH2U 永悅健康股份有限公司',
            style: UITextStyle.title1Chinese.copyWith(
              color: WangHannColor.black60,
            ),
          ),
        ],
        if (iPadScreen) ...[
          Row(
            children: [
              Expanded(
                child: Text(
                  'WHO WE PARTNERED WITH',
                  style: UITextStyle.h3.copyWith(
                    color: WangHannColor.black,
                  ),
                ),
              )
            ],
          ),
          const Gap(36),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '10+',
                style: UITextStyle.h1.copyWith(
                  color: WangHannColor.black,
                ),
              ),
              Text(
                '藥廠、企業、醫學會',
                style: UITextStyle.h2Chinese.copyWith(
                  color: WangHannColor.lightGrey,
                ),
              )
            ],
          ),
          const Gap(36),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  'Sanofi 賽諾菲\nRoche 羅氏\nMedJohnson 美強生\nillumina 因美納\nMerck KGaA 默克\nAbbVie 艾伯維\nTSITC 台灣免疫暨腫瘤學會\n台灣臨床腫瘤醫學會\n台灣病理學會\n中華民國內分泌暨糖尿病學會',
                  style: UITextStyle.title1Chinese.copyWith(
                    color: WangHannColor.black60,
                  ),
                ),
              ),
              const Gap(10),
              Expanded(
                child: Text(
                  '台灣生殖醫學會\n台灣婦產科醫學會\n台灣新生兒科醫學會\n台灣小兒消化醫學會\n臺灣牙周病醫學會\n台灣胰臟癌醫學會\nTAITRA 中華民國對外貿易發展協會\nPwC 資誠聯合會計師事務所\nH2U 永悅健康股份有限公司\n',
                  style: UITextStyle.title1Chinese.copyWith(
                    color: WangHannColor.black60,
                  ),
                ),
              )
            ],
          )
        ],
        if (pcScreen) ...[
          Row(
            children: [
              Text(
                'WHO WE PARTNERED WITH',
                style: UITextStyle.h3.copyWith(
                  color: WangHannColor.black,
                ),
              )
            ],
          ),
          const Gap(64),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '10+',
                style: UITextStyle.h1PC.copyWith(
                  color: WangHannColor.black,
                ),
              ),
              Text(
                '藥廠、企業、醫學會',
                style: UITextStyle.h2Chinese.copyWith(
                  color: WangHannColor.lightGrey,
                ),
              )
            ],
          ),
          const Gap(52),
          Row(
            children: [
              _partnerItem(
                'Sanofi 賽諾菲\nRoche 羅氏\nMedJohnson 美強生\nillumina 因美納\nMerck KGaA 默克\nAbbVie 艾伯維 \nTSITC 台灣免疫暨腫瘤學會',
              ),
              const Gap(24),
              _partnerItem(
                '台灣臨床腫瘤醫學會\n台灣病理學會\n中華民國內分泌暨糖尿病學會\n台灣生殖醫學會 \n台灣婦產科醫學會\n台灣新生兒科醫學會\n台灣小兒消化醫學會',
              ),
              const Gap(24),
              _partnerItem(
                '臺灣牙周病醫學會\n台灣胰臟癌醫學會\nTAITRA 中華民國對外貿易發展協會\nPwC 資誠聯合會計師事務所\nH2U 永悅健康股份有限公司\n',
              ),
            ],
          )
        ],
      ],
    ).customWhiteBackgroundPadding(
        isSmallScreen: mobileScreen, isPadScreen: iPadScreen);
  }

  Widget _partnerItem(String partner) {
    return SizedBox(
      width: 288,
      child: Text(
        partner,
        style: UITextStyle.title1Chinese.copyWith(
          color: WangHannColor.black60,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
