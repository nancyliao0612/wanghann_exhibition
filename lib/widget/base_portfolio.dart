import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:wang_hann_exhibition/app_ui/color/wang_hann_color.dart';
import 'package:wang_hann_exhibition/app_ui/typography/app_text_style.dart';
import 'package:wang_hann_exhibition/presentation/Home/footer.dart';
import 'package:wang_hann_exhibition/presentation/Navbar/navbar.dart';
import 'package:wang_hann_exhibition/utils/context_extension.dart';
import 'package:wang_hann_exhibition/widget/base_work.dart';
import 'package:wang_hann_exhibition/widget/padding_extension.dart';

class BasePortfolio extends StatelessWidget {
  const BasePortfolio({
    required this.content,
    this.itemScrollController,
    this.nextRoute,
    this.externalLink,
    required this.nextOrganization,
    required this.nextImageUrl,
    required this.nextWorkshop,
    super.key,
  });

  final Widget content;
  final ItemScrollController? itemScrollController;
  final String? nextRoute;
  final bool? externalLink;
  final String nextOrganization;
  final String nextImageUrl;
  final String nextWorkshop;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Navbar(
        context,
        null,
        null,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Navbar(
            //   context,
            //   null,
            //   showGoHome: true,
            // ),
            context.isSmallScreen
                ? content.portfolioBlackBackgroundPadding
                : ColoredBox(
                    color: WangHannColor.black,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 960),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 24,
                              right: 24,
                              top: 20,
                              bottom: 80,
                            ),
                            child: content,
                          ),
                        )
                      ],
                    ),
                  ),
            ColoredBox(
              color: WangHannColor.white,
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 960),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'SEE OTHER WORKS',
                          style: UITextStyle.h3.copyWith(
                            color: WangHannColor.black,
                          ),
                        )
                      ],
                    ),
                    BaseWork(
                      externalLink: externalLink,
                      route: nextRoute,
                      imageUrl: nextImageUrl,
                      client: nextOrganization,
                      event: nextWorkshop,
                      isSmallScreen: context.isSmallScreen,
                    ),
                  ],
                ).whiteBackgroundPadding,
              ),
            ),
            const Footer(),
          ],
        ),
      ),
    );
  }
}
