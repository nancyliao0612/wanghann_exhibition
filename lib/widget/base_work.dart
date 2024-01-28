import 'dart:js' as js;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:themed/themed.dart';
import 'package:wang_hann_exhibition/app_ui/color/wang_hann_color.dart';
import 'package:wang_hann_exhibition/app_ui/typography/app_text_style.dart';
import 'package:wang_hann_exhibition/constant/icon_path.dart';
import 'package:wang_hann_exhibition/utils/context_extension.dart';

class BaseWork extends StatefulWidget {
  const BaseWork({
    this.route,
    this.externalLink,
    required this.imageUrl,
    required this.client,
    required this.event,
    required this.isSmallScreen,
    this.showArrow = false,
    super.key,
  });

  final String? route;
  final bool? externalLink;
  final String imageUrl;
  final String client;
  final String event;
  final bool isSmallScreen;
  final bool showArrow;

  @override
  State<BaseWork> createState() => _BaseWorkState();
}

class _BaseWorkState extends State<BaseWork> {
  bool isHover = false;
  bool isFocus = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.isSmallScreen ? const Gap(36) : const Gap(48),
        InkWell(
          onTap: () {
            if (widget.externalLink == true) {
              js.context.callMethod('open', [
                'https://www.pwc.tw/zh/industries/biotech-services/bio-news/bio-monthly-updates-2307.html'
              ]);
            } else {
              Navigator.of(context).pushNamed(widget.route ?? '/');
            }
          },
          onFocusChange: (focus) {
            setState(() {
              isFocus = focus;
            });
          },
          onHover: (hover) {
            setState(() {
              isHover = hover;
            });
          },
          child: ChangeColors(
            saturation: isHover || isFocus ? 0 : -1,
            hue: isHover || isFocus ? 0 : -1,
            brightness: isHover || isFocus ? 0 : -0.05,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CachedNetworkImage(
                  imageUrl: widget.imageUrl,
                ),
                const Gap(8),
                Row(
                  children: [
                    Text(
                      widget.client,
                      style: (widget.isSmallScreen
                              ? UITextStyle.title1
                              : UITextStyle.title1PC)
                          .copyWith(
                        color: WangHannColor.black,
                      ),
                    ),
                    if (widget.showArrow == true) ...[
                      const Gap(4),
                      SvgPicture.asset(
                        IconPath.arrow,
                        width: context.isSmallScreen ? 20 : 24,
                      )
                    ]
                  ],
                ),
                Text(
                  widget.event,
                  style: (widget.isSmallScreen
                          ? UITextStyle.caption
                          : UITextStyle.captionPC)
                      .copyWith(
                    color: WangHannColor.black,
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
