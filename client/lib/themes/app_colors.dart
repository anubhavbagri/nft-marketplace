import 'package:client/utils/hex_color.dart';
import 'package:flutter/material.dart';

class AppColors {
  const AppColors._();

  static final primary = HexColor("#7D36D4");
  static final secondary = HexColor("#C68DFF");
  static final tertiary = HexColor("#381858");
  static final white = HexColor("#FFFFFF");
  static final black = HexColor("#000000");

  static final Shader purpleGradient = LinearGradient(
    colors: <Color>[HexColor("#9A58DB"), HexColor("#42039C")],
  ).createShader(
    const Rect.fromLTWH(100.0, 0.0, 200.0, 20.0),
  );
}
