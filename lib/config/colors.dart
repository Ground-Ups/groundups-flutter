import 'package:flutter/material.dart';

MaterialColor createMaterialColor(Color color) {
  final List<double> strengths = <double>[.05];
  final swatch = <int, Color>{};
  final r = color.red;
  final g = color.green;
  final b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  for (final strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }
  return MaterialColor(color.value, swatch);
}


MaterialColor primary = createMaterialColor(const Color(0xFF2D3436));
MaterialColor warning = createMaterialColor(const Color(0xFFFAAC19));
MaterialColor danger = createMaterialColor(const Color(0xFFF04F52));
MaterialColor success = createMaterialColor(const Color(0xFF75C043));
MaterialColor info = createMaterialColor(const Color(0xFF1890FF));
MaterialColor disable = createMaterialColor(const Color(0xFFEEEEEE));
MaterialColor secondary = createMaterialColor(const Color(0xFF00B894));





const backgroundColor = Color.fromARGB(255, 243, 243, 243);
const disableBg = Color(0xFFe5e6ea);
const disableText = Color(0xFF838699);





