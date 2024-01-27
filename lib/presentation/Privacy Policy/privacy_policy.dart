import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wang_hann_exhibition/app_ui/color/wang_hann_color.dart';
import 'package:wang_hann_exhibition/app_ui/typography/app_text_style.dart';
import 'package:wang_hann_exhibition/presentation/Home/footer.dart';
import 'package:wang_hann_exhibition/presentation/Navbar/navbar.dart';
import 'package:wang_hann_exhibition/utils/context_extension.dart';
import 'package:wang_hann_exhibition/widget/padding_extension.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Navbar(context, null, null
              // itemScrollController,
              ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Privacy Policy',
                style: UITextStyle.h2.copyWith(
                  color: WangHannColor.white,
                ),
              ),
              const Gap(36),
              Text(
                '歡迎來到我們的網站（「網站」）。汪翰生醫策展知道我們的客戶和訪客（如您）如何重視您的隱私，我們制定了本隱私政策，以確保您了解我們的政策和程序，如果您希望使用本網站，您必須提供哪些個人身份信息，並最終僅我們如何使用此類個人識別資訊。\n\n本政策僅適用於位於 www.wanghann.com 的網站，不適用於任何其他網站或服務。如果您不同意本政策，則不應使用本網站。\n\n汪翰生醫策展收集的非個人識別資訊\n\n汪翰生醫策展也可能自動收集（透過下文所述的 cookie 和其他方法）並儲存有關使用者聯繫和使用本網站的匯總或匿名資訊。此類資訊的範例包括人口統計資訊、您正在使用的網路瀏覽器的類型、您正在使用的電腦作業系統應用軟體和周邊設備的類型、您連結到我們網站的網站的網域以及您的瀏覽網站的習慣和使用。非個人識別資訊還可能包括已匯總的個人識別信息，因此無法具體識別任何個人（例如，特定城市中有多少用戶訪問該網站）。\n\n我們如何使用您的非個人識別資訊我們可能會出於多種原因（包括廣告、促銷和/或其他目的）與第三方分享非個人識別資訊。',
                style: UITextStyle.body1.copyWith(
                  color: WangHannColor.white,
                ),
              ),
              const Gap(36),
              Text(
                '聯絡我們\n\n如果您對本隱私權政策、本網站的做法或您與本網站的交易有任何疑問，您可以聯絡我們 scott.li@wanghann.com\n\n郵寄地址是：臺北市松山區民生東路3段113巷7弄10號1樓',
                style: UITextStyle.body1.copyWith(
                  color: WangHannColor.white,
                ),
              ),
            ],
          ).customBlackBackgroundPadding(context.isSmallScreen),
          const Footer(),
        ],
      ),
    ));
  }
}
