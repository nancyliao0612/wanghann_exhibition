import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:universal_html/html.dart' as html;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:wang_hann_exhibition/app_ui/color/wang_hann_color.dart';
import 'package:wang_hann_exhibition/app_ui/typography/app_text_style.dart';
import 'package:wang_hann_exhibition/constant/icon_path.dart';
import 'package:wang_hann_exhibition/tap_provider.dart';
import 'package:wang_hann_exhibition/utils/context_extension.dart';

class BaseWork extends ConsumerStatefulWidget {
  const BaseWork({
    this.route,
    this.externalLink,
    required this.imageUrl,
    required this.blackImageUrl,
    required this.client,
    required this.event,
    this.showArrow = false,
    this.tapNumber,
    super.key,
  });

  final String? route;
  final bool? externalLink;
  final String imageUrl;
  final String blackImageUrl;
  final String client;
  final String event;
  final bool showArrow;
  final String? tapNumber;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BaseWorkState();
}

class _BaseWorkState extends ConsumerState<BaseWork> {
  bool isHover = false;
  bool isTapDown = false;

  @override
  Widget build(BuildContext context) {
    final currentTap = ref.watch(tapProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        context.isSmallScreen ? const Gap(36) : const Gap(48),
        InkWell(
            onTapDown: (detail) {
              if (context.isSmallScreen) {
                ref
                    .read(tapProvider.notifier)
                    .update((_) => widget.tapNumber ?? '0');
              }
            },
            onTap: () {
              if (widget.externalLink == true) {
                html.window.open(
                  'https://www.pwc.tw/zh/industries/biotech-services/bio-news/bio-monthly-updates-2307.html',
                  '_blank',
                );
              } else {
                Navigator.of(context).pushNamed(widget.route ?? '/');
              }
            },
            onHover: (hover) {
              setState(() {
                isHover = hover;
              });
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                (isHover || currentTap == widget.tapNumber)
                    ? CachedNetworkImage(
                        imageUrl: widget.imageUrl,
                        placeholder: (context, url) => AspectRatio(
                          aspectRatio: 3 / 2,
                          child: CachedNetworkImage(
                            imageUrl: widget.blackImageUrl,
                          ),
                        ),
                      )
                    : CachedNetworkImage(
                        imageUrl: widget.blackImageUrl,
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
                  style: UITextStyle.caption.copyWith(
                    color: WangHannColor.black,
                  ),
                )
              ],
            )),
      ],
    );
  }
}
