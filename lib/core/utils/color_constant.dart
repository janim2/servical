import 'dart:ui';
import 'package:flutter/material.dart';

class ColorConstant {
  static Color primary = fromHex('#0c6366');

  static Color secondary = fromHex('#f6fcfc');

  static Color white = fromHex('#ffffff');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
