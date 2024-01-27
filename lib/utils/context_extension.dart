import 'package:flutter/material.dart';

extension MediaQueryX on BuildContext {
  bool get isSmallScreen => MediaQuery.sizeOf(this).width <= 960;
}
