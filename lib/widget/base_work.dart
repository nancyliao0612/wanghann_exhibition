import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:universal_html/html.dart' as html;
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

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.isSmallScreen ? const Gap(36) : const Gap(48),
        InkWell(
            onTap: () {
              if (widget.externalLink == true) {
                html.window.open(
                    'https://www.pwc.tw/zh/industries/biotech-services/bio-news/bio-monthly-updates-2307.html',
                    '_blank');
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CachedNetworkImage(
                    imageUrl: widget.imageUrl,
                    placeholder: (context, url) => const AspectRatio(
                      aspectRatio: 3 / 2,
                      child: BlurHash(hash: "LFIE|gIU%MM{~qt7RjM{RjWB9F-;"),
                    ),
                  ),
                  const Gap(8),
                  Row(
                    children: [
                      Text(
                        widget.client,
                        style: UITextStyle.title1.copyWith(
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
                            : UITextStyle.caption)
                        .copyWith(
                      color: WangHannColor.black,
                    ),
                  )
                ],
              ),
            )),
      ],
    );
  }
}
