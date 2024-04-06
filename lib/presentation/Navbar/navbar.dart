import 'dart:ui';
import 'package:universal_html/html.dart' as html;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:wang_hann_exhibition/app_ui/color/wang_hann_color.dart';
import 'package:wang_hann_exhibition/app_ui/typography/app_text_style.dart';
import 'package:wang_hann_exhibition/constant/icon_path.dart';
import 'package:wang_hann_exhibition/constant/logo_path.dart';
import 'package:wang_hann_exhibition/utils/context_extension.dart';

class Navbar extends StatefulWidget implements PreferredSizeWidget {
  const Navbar(
    this.context,
    this.itemScrollController,
    this.extra, {
    super.key,
  });

  final BuildContext context;
  final ItemScrollController? itemScrollController;
  final String? extra;

  @override
  State<Navbar> createState() => _NavbarState();

  @override
  Size get preferredSize => context.isSmallScreen
      ? const Size.fromHeight(55)
      : const Size.fromHeight(59);
}

class _NavbarState extends State<Navbar> {
  bool _showClientCaseMenu = true;

  late AutoScrollController autoScrollController;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.endOfFrame.then((value) {
      if (widget.extra != null) {
        switch (widget.extra) {
          case 'Service' || 'SERVICE':
            widget.itemScrollController?.scrollTo(
              index: 1,
              duration: const Duration(seconds: 2),
              curve: Curves.easeInOutCubic,
            );
          case 'About' || 'ABOUT':
            widget.itemScrollController?.scrollTo(
              index: 5,
              duration: const Duration(seconds: 2),
              curve: Curves.easeInOutCubic,
            );
          case 'Contact' || 'CONTACT':
            widget.itemScrollController?.scrollTo(
              index: 6,
              duration: const Duration(seconds: 2),
              curve: Curves.easeInOutCubic,
            );
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    void scrollTo(int index) async {
      widget.itemScrollController?.scrollTo(
        index: index,
        duration: const Duration(seconds: 2),
        curve: Curves.easeInOutCubic,
      );
    }

    Widget menuItem({
      required String item,
      required int index,
    }) {
      final notAtHomeRoute = ModalRoute.of(context)!.settings.name != '/';

      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: DefaultTextStyle(
          style: UITextStyle.title1.copyWith(color: WangHannColor.white),
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
                if (notAtHomeRoute) {
                  Navigator.pushNamed(context, '/', arguments: item);
                } else {
                  scrollTo(index);
                }
              },
              child: Text(item),
            ),
          ),
        ),
      );
    }

    Widget pcMenuItem(String item, int index) {
      final notAtHomeRoute =
          ModalRoute.of(context)!.settings.name != '/' && item != 'Contact';

      return TextButton(
          onPressed: () {
            if (notAtHomeRoute) {
              Navigator.pushNamed(context, '/', arguments: item);
            } else {
              scrollTo(index);
            }
          },
          child: Text(
            item,
            style: UITextStyle.title1.copyWith(color: WangHannColor.white),
          ));
    }

    return AppBar(
      clipBehavior: Clip.hardEdge,
      backgroundColor: WangHannColor.black.withOpacity(0.7),
      toolbarHeight: context.isSmallScreen ? 55 : 60,
      leading: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Row(
          children: [
            const Gap(16),
            Expanded(
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () => Navigator.of(context).pushNamed('/'),
                  child: SvgPicture.asset(LogoPath.wangHannLogo),
                ),
              ),
            ),
          ],
        ),
      ),
      leadingWidth: 117,
      foregroundColor: WangHannColor.white,
      actions: [
        context.isSmallScreen
            ? Row(
                children: [
                  IconButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          barrierColor: Colors.transparent,
                          builder: (context) {
                            return Stack(
                              children: [
                                Positioned(
                                  top: 55,
                                  child: SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    height: 450,
                                    child: ColoredBox(
                                      color: WangHannColor.darkGrey,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 55,
                                  child: ClipRRect(
                                    child: BackdropFilter(
                                      filter: ImageFilter.blur(
                                          sigmaX: 5, sigmaY: 5),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 450,
                                        color: Colors.black.withOpacity(0),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                    top: 55,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        SizedBox(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 16),
                                            child: StatefulBuilder(
                                              builder: (context, setState) =>
                                                  Column(
                                                children: <Widget>[
                                                  menuItem(
                                                    item: 'SERVICE',
                                                    index: 1,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      IconButton(
                                                        visualDensity:
                                                            VisualDensity
                                                                .compact,
                                                        onPressed: () {
                                                          setState(() {
                                                            _showClientCaseMenu =
                                                                !_showClientCaseMenu;
                                                          });
                                                        },
                                                        icon: Icon(
                                                          _showClientCaseMenu
                                                              ? Icons
                                                                  .arrow_drop_down_outlined
                                                              : Icons
                                                                  .arrow_right_outlined,
                                                        ),
                                                        color:
                                                            WangHannColor.white,
                                                        iconSize: 18,
                                                      ),
                                                      menuItem(
                                                        item: 'WORKS',
                                                        index: 4,
                                                      ),
                                                      IconButton(
                                                        visualDensity:
                                                            VisualDensity
                                                                .compact,
                                                        onPressed: () {},
                                                        icon: const Icon(Icons
                                                            .arrow_drop_down_outlined),
                                                        color:
                                                            Colors.transparent,
                                                        iconSize: 18,
                                                      ),
                                                    ],
                                                  ),
                                                  if (_showClientCaseMenu) ...[
                                                    clientCaseItem(
                                                      context,
                                                      isSmallScreen:
                                                          context.isSmallScreen,
                                                      item: 'TSITC 台灣免疫暨腫瘤學會',
                                                      route: '/TSITC',
                                                    ),
                                                    clientCaseItem(
                                                      context,
                                                      isSmallScreen:
                                                          context.isSmallScreen,
                                                      item: 'AbbVie 艾柏維',
                                                      route: '/AbbVie',
                                                    ),
                                                    clientCaseItem(
                                                      context,
                                                      isSmallScreen:
                                                          context.isSmallScreen,
                                                      item: 'Merck KGaA 默克',
                                                      route: '/Merck',
                                                    ),
                                                    clientCaseItem(
                                                      context,
                                                      isSmallScreen:
                                                          context.isSmallScreen,
                                                      item: '外貿協會',
                                                      route: '/TAITRA',
                                                    ),
                                                    clientCaseItem(
                                                      context,
                                                      isSmallScreen:
                                                          context.isSmallScreen,
                                                      item: '羅氏 x 資誠聯合會計師事務所',
                                                      showArrow: true,
                                                      openExternalLink: true,
                                                    ),
                                                  ],
                                                  menuItem(
                                                    item: 'ABOUT',
                                                    index: 5,
                                                  ),
                                                  menuItem(
                                                    item: 'CONTACT',
                                                    index: 6,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    )),
                              ],
                            );
                          });
                    },
                    icon: const Icon(Icons.menu_sharp),
                  ),
                  context.isSmallScreen ? const Gap(12) : const Gap(24),
                ],
              )
            : Row(
                children: [
                  pcMenuItem('Service', 1),
                  const Gap(24),
                  TextButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          barrierColor: Colors.transparent,
                          useSafeArea: false,
                          builder: (context) {
                            return Stack(
                              children: [
                                Positioned(
                                  top: 59,
                                  child: SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    height: 218,
                                    child: ColoredBox(
                                      color: WangHannColor.darkGrey,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 59,
                                  child: ClipRRect(
                                    child: BackdropFilter(
                                      filter: ImageFilter.blur(
                                          sigmaX: 3, sigmaY: 3),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 218,
                                        color: Colors.black.withOpacity(0),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 59,
                                  child: Column(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 16),
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Column(
                                          children: [
                                            clientCaseItem(
                                              context,
                                              isSmallScreen:
                                                  context.isSmallScreen,
                                              item: 'TSITC 台灣免疫暨腫瘤學會',
                                              route: '/TSITC',
                                            ),
                                            clientCaseItem(
                                              context,
                                              isSmallScreen:
                                                  context.isSmallScreen,
                                              item: 'AbbVie 艾柏維',
                                              route: '/AbbVie',
                                            ),
                                            clientCaseItem(
                                              context,
                                              isSmallScreen:
                                                  context.isSmallScreen,
                                              item: 'Merck KGaA 默克',
                                              route: '/Merck',
                                            ),
                                            clientCaseItem(
                                              context,
                                              isSmallScreen:
                                                  context.isSmallScreen,
                                              item: '外貿協會',
                                              route: '/TAITRA',
                                            ),
                                            clientCaseItem(
                                              context,
                                              isSmallScreen:
                                                  context.isSmallScreen,
                                              item: '羅氏 x 資誠聯合會計師事務所',
                                              showArrow: true,
                                              openExternalLink: true,
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            );
                          },
                        );
                      },
                      child: Text(
                        'Works',
                        style: UITextStyle.title1
                            .copyWith(color: WangHannColor.white),
                      )),
                  const Gap(24),
                  pcMenuItem('About', 5),
                  const Gap(24),
                  pcMenuItem('Contact', 6),
                  const Gap(16),
                ],
              )
      ],
    );
  }
}

Widget clientCaseItem(
  BuildContext context, {
  required bool isSmallScreen,
  required String item,
  String? route,
  showArrow = false,
  bool? openExternalLink,
}) {
  return MouseRegion(
    cursor: SystemMouseCursors.click,
    child: GestureDetector(
      onTap: () {
        if (openExternalLink == true) {
          html.window.open(
              'https://www.pwc.tw/zh/industries/biotech-services/bio-news/bio-monthly-updates-2307.html',
              '_blank');
        } else {
          Navigator.of(context).pop();
          Navigator.of(context).pushNamed(route ?? '/');
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DefaultTextStyle(
              style: UITextStyle.title1.copyWith(color: WangHannColor.white),
              child: Text(
                item,
                style: UITextStyle.body1.copyWith(color: WangHannColor.white),
              ),
            ),
            if (showArrow == true) ...[
              const Gap(4),
              context.isSmallScreen
                  ? SvgPicture.asset(
                      IconPath.mobileArrow,
                    )
                  : SvgPicture.asset(IconPath.arrow,
                      width: 24,
                      colorFilter: const ColorFilter.mode(
                        WangHannColor.white,
                        BlendMode.srcIn,
                      ))
            ]
          ],
        ),
      ),
    ),
  );
}
