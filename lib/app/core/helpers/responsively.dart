import 'package:flutter/material.dart';

class Responsively {
  static double _handleWidth(double size, MediaQueryData data) {
    final mediaQuerySize = data.size;
    final coefficient = size / 430; //put mockup width here
    return mediaQuerySize.width * coefficient;
  }

  static double _handleHeight(double size, MediaQueryData data) {
    final mediaQuerySize = data.size;
    final coefficient = size / 932; //put mockup height here
    return mediaQuerySize.height * coefficient;
  }

  static double auto(double size, MediaQueryData data) {
    final width = data.size.width;
    final height = data.size.height;

    return width > height
        ? _handleWidth(size, data)
        : _handleHeight(size, data);
  }
}
