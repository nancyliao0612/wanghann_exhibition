import 'dart:js' as js;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:themed/themed.dart';
import 'package:wang_hann_exhibition/app_ui/color/wang_hann_color.dart';
import 'package:wang_hann_exhibition/app_ui/typography/app_text_style.dart';

class BaseWork extends StatefulWidget {
  const BaseWork({
    this.route,
    this.externalLink,
    required this.imageUrl,
    required this.client,
    required this.event,
    required this.isSmallScreen,
    super.key,
  });

  final String? route;
  final bool? externalLink;
  final String imageUrl;
  final String client;
  final String event;
  final bool isSmallScreen;

  @override
  State<BaseWork> createState() => _BaseWorkState();
}

class _BaseWorkState extends State<BaseWork> {
  bool isHover = false;

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
          onHover: (hover) {
            setState(() {
              isHover = hover;
            });
          },
          child: ChangeColors(
            saturation: isHover ? 0 : -1,
            hue: isHover ? 0 : -1,
            brightness: isHover ? 0 : -0.05,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CachedNetworkImage(
                  imageUrl: widget.imageUrl,
                ),
                const Gap(8),
                Text(
                  widget.client,
                  style: (widget.isSmallScreen
                          ? UITextStyle.title1
                          : UITextStyle.title1PC)
                      .copyWith(
                    color: WangHannColor.black,
                  ),
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
