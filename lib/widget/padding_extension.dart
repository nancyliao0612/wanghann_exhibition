import 'package:flutter/material.dart';
import 'package:wang_hann_exhibition/app_ui/color/wang_hann_color.dart';

extension WidgetX on Widget {
  Widget mobileBlackBackgroundPadding() => ColoredBox(
        color: WangHannColor.black,
        child: Padding(
          key: key,
          padding: const EdgeInsets.only(
            left: 24,
            right: 24,
            top: 48,
            bottom: 48,
          ),
          child: this,
        ),
      );

  Widget mobileBlackBackgroundPaddingForService() => ColoredBox(
        color: WangHannColor.black,
        child: Padding(
          key: key,
          padding: const EdgeInsets.only(
            left: 24,
            right: 24,
            top: 12,
            bottom: 48,
          ),
          child: this,
        ),
      );

  Widget pcBlackBackgroundPadding() => ColoredBox(
        color: WangHannColor.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ConstrainedBox(
              key: key,
              constraints: const BoxConstraints(maxWidth: 960),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 64,
                ),
                child: this,
              ),
            )
          ],
        ),
      );

  Widget pcServiceBlackBackgroundPadding() => ColoredBox(
        color: WangHannColor.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ConstrainedBox(
              key: key,
              constraints: const BoxConstraints(maxWidth: 960),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 24,
                  right: 24,
                  top: 5,
                  bottom: 64,
                ),
                child: this,
              ),
            )
          ],
        ),
      );

  Widget pcWhiteBackgroundPadding(Key? key) => ColoredBox(
        color: WangHannColor.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ConstrainedBox(
              key: key,
              constraints: const BoxConstraints(maxWidth: 960),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 64,
                ),
                child: this,
              ),
            )
          ],
        ),
      );

  Widget partnerBackgroundPadding(bool pcScreen) => ColoredBox(
        color: WangHannColor.white,
        child: Padding(
          key: key,
          padding: EdgeInsets.symmetric(
            horizontal: 24,
            vertical: pcScreen ? 64 : 32,
          ),
          child: this,
        ),
      );

  Widget customWhiteBackgroundPadding({
    required bool isSmallScreen,
    bool? isPadScreen = false,
  }) =>
      ColoredBox(
        color: WangHannColor.white,
        child: isSmallScreen || isPadScreen!
            ? Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 32,
                ),
                child: this,
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ConstrainedBox(
                    key: key,
                    constraints: const BoxConstraints(maxWidth: 960),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 64,
                      ),
                      child: this,
                    ),
                  )
                ],
              ),
      );

  Widget customBlackBackgroundPadding(bool isSmallScreen) => ColoredBox(
        color: WangHannColor.black,
        child: isSmallScreen
            ? Padding(
                key: key,
                padding: const EdgeInsets.only(
                  left: 24,
                  right: 24,
                  top: 64,
                  bottom: 64,
                ),
                child: this,
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ConstrainedBox(
                    key: key,
                    constraints: const BoxConstraints(maxWidth: 960),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 24,
                        right: 24,
                        top: 64,
                        bottom: 64,
                      ),
                      child: this,
                    ),
                  )
                ],
              ),
      );

  Widget get blackBackground => ColoredBox(
        color: WangHannColor.black,
        child: this,
      );

  Widget get whiteBackground => ColoredBox(
        color: WangHannColor.white,
        child: this,
      );

  Widget get portfolioBlackBackgroundPadding => ColoredBox(
        color: WangHannColor.black,
        child: Padding(
          padding:
              const EdgeInsets.only(right: 24, left: 24, top: 64, bottom: 64),
          child: this,
        ),
      );

  Widget get whiteBackgroundPadding => ColoredBox(
        color: WangHannColor.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 36),
          child: this,
        ),
      );
}
