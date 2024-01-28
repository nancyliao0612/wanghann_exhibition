import 'dart:js' as js;

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
  const Navbar(this.context, this.itemScrollController, this.extra,
      {super.key});

  final BuildContext context;
  final ItemScrollController? itemScrollController;
  final String? extra;
  // final bool? showGoHome;

  @override
  State<Navbar> createState() => _NavbarState();

  @override
  Size get preferredSize => context.isSmallScreen
      ? const Size.fromHeight(45.3)
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
        widget.itemScrollController?.scrollTo(
          index: 5,
          duration: const Duration(seconds: 2),
          curve: Curves.easeInOutCubic,
          // alignment: 1.0,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    print('extra ${widget.extra}');
    //FIXME: AppBar should be transparent

    void scrollTo(int index) async {
      // if (widget.itemScrollController?.isAttached ?? false) {
      // await Navigator.of(context).pushNamed('/');

      print('widget.itemScrollController ${widget.itemScrollController}');

      widget.itemScrollController?.scrollTo(
        index: index,
        duration: const Duration(seconds: 2),
        curve: Curves.easeInOutCubic,
        // alignment: 1.0,
      );
      // }
    }

    Widget menuItem(
      BuildContext context, {
      required String item,
      required int index,
    }) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: TextButton(
          onPressed: () async {
            print('index $index');
            Navigator.of(context).pop();
            // if (widget.showGoHome == true && mounted) {
            //   print('here');
            //   await Navigator.of(context).pushNamed('/');
            // }
            scrollTo(index);
          },
          style: const ButtonStyle(
            padding:
                MaterialStatePropertyAll<EdgeInsetsGeometry?>(EdgeInsets.zero),
          ),
          child: Text(
            item,
            style: UITextStyle.title1.copyWith(color: WangHannColor.white),
          ),
        ),
      );
    }

    Widget pcMenuItem(String item, int index) {
      return TextButton(
          onPressed: () => scrollTo(index),
          child: Text(
            item,
            style: UITextStyle.title1PC.copyWith(color: WangHannColor.white),
          ));
    }

    return AppBar(
      backgroundColor: WangHannColor.black.withOpacity(0.7),
      // toolbarOpacity: 0.7,
      // bottomOpacity: 0.7,
      toolbarHeight: context.isSmallScreen ? 45.3 : 60,
      leading: Row(
        children: [
          const Gap(12),
          Expanded(
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () => Navigator.of(context).pushNamed('/'),
                child: SvgPicture.asset(
                  context.isSmallScreen
                      ? LogoPath.smallWangHannLogo
                      : LogoPath.largeWangHannLogo,
                ),
              ),
            ),
          ),
        ],
      ),
      leadingWidth: context.isSmallScreen ? 88 : 135,
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
                          //FIXME
                          anchorPoint: const Offset(-20, -50),
                          builder: (context) {
                            return Column(
                              children: <Widget>[
                                Container(
                                  margin: const EdgeInsets.only(top: 45.3),
                                  width: MediaQuery.of(context).size.width,
                                  color: WangHannColor.darkGrey,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 16),
                                    child: StatefulBuilder(
                                      builder: (context, setState) => Column(
                                        children: <Widget>[
                                          menuItem(
                                            context,
                                            item: 'SERVICE',
                                            index: 1,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              IconButton(
                                                visualDensity:
                                                    VisualDensity.compact,
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
                                                color: WangHannColor.white,
                                                iconSize: 18,
                                              ),
                                              menuItem(
                                                context,
                                                item: 'WORKS',
                                                index: 4,
                                              ),
                                              IconButton(
                                                visualDensity:
                                                    VisualDensity.compact,
                                                onPressed: () {},
                                                icon: const Icon(Icons
                                                    .arrow_drop_down_outlined),
                                                color: Colors.transparent,
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
                                            context,
                                            item: 'ABOUT',
                                            index: 5,
                                          ),
                                          menuItem(
                                            context,
                                            item: 'CONTACT',
                                            index: 6,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            );
                          });
                    },
                    icon: const Icon(Icons.menu_sharp),
                  ),
                  context.isSmallScreen ? const Gap(12) : const Gap(24),
                ],
              )
            : SizedBox(
                height: 60,
                child: Row(
                  children: [
                    pcMenuItem('Service', 1),
                    const Gap(24),
                    TextButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            barrierColor: Colors.transparent,
                            builder: (context) {
                              return Column(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(top: 59),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 16),
                                    height: 198,
                                    width: MediaQuery.of(context).size.width,
                                    color: WangHannColor.darkGrey,
                                    child: Column(
                                      children: [
                                        clientCaseItem(
                                          context,
                                          isSmallScreen: context.isSmallScreen,
                                          item: 'TSITC 台灣免疫暨腫瘤學會',
                                          route: '/TSITC',
                                        ),
                                        clientCaseItem(
                                          context,
                                          isSmallScreen: context.isSmallScreen,
                                          item: 'AbbVie 艾柏維',
                                          route: '/AbbVie',
                                        ),
                                        clientCaseItem(
                                          context,
                                          isSmallScreen: context.isSmallScreen,
                                          item: 'Merck KGaA 默克',
                                          route: '/Merck',
                                        ),
                                        clientCaseItem(
                                          context,
                                          isSmallScreen: context.isSmallScreen,
                                          item: '外貿協會',
                                          route: '/TAITRA',
                                        ),
                                        clientCaseItem(
                                          context,
                                          isSmallScreen: context.isSmallScreen,
                                          item: '羅氏 x 資誠聯合會計師事務所',
                                          showArrow: true,
                                          openExternalLink: true,
                                        ),
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
                          style: UITextStyle.title1PC
                              .copyWith(color: WangHannColor.white),
                        )),
                    const Gap(24),
                    pcMenuItem('About', 5),
                    const Gap(24),
                    pcMenuItem('Contact', 6),
                    const Gap(16),
                  ],
                ),
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
  return TextButton(
    onPressed: () {
      if (openExternalLink == true) {
        js.context.callMethod('open', [
          'https://www.pwc.tw/zh/industries/biotech-services/bio-news/bio-monthly-updates-2307.html'
        ]);
      } else {
        Navigator.of(context).pop();
        Navigator.of(context).pushNamed(route ?? '/');
      }
    },
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          item,
          style: (isSmallScreen ? UITextStyle.body1 : UITextStyle.body1PC)
              .copyWith(color: WangHannColor.white),
        ),
        if (showArrow == true) ...[
          const Gap(4),
          SvgPicture.asset(IconPath.arrow,
              width: context.isSmallScreen ? 20 : 24,
              colorFilter:
                  const ColorFilter.mode(WangHannColor.white, BlendMode.srcIn))
        ]
      ],
    ),
  );
}
