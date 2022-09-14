import 'dart:ui';

import 'package:flutter/material.dart';

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    String changedHexColor = 'FFFFFF';
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      changedHexColor = "FF$hexColor";
    } else if (hexColor.length == 3) {
      hexColor = hexColor + hexColor;
      changedHexColor = "FF$hexColor";
    }
    return int.parse(changedHexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
