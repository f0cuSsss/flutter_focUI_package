import 'package:flutter/material.dart';

/// Returns darken color
Color fGetDarkenColor(Color color, [double amount = .1]) {
  assert(amount >= 0 && amount <= 1);

  final hsl = HSLColor.fromColor(color);
  final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));

  return hslDark.toColor();
}

/// Returns lighten color
Color fGetLightenColor(Color color, [double amount = .1]) {
  assert(amount >= 0 && amount <= 1);

  final hsl = HSLColor.fromColor(color);
  final hslLight = hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));

  return hslLight.toColor();
}

/// Returns color that matches the background
Color fGetColorFromBackground(Color color) {
  final double relativeLuminance = color.computeLuminance();
  const double kThreshold = 0.15;

  if ((relativeLuminance + 0.05) * (relativeLuminance + 0.05) > kThreshold) {
    return Colors.black;
  }
  return Colors.white;
}
