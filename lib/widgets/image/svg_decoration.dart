import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_svg/flutter_svg.dart';

class SvgDecoration extends Decoration {
  SvgDecoration.string(
    String rawSvg, {
    this.key,
    this.colorFilter,
  }) : rawSvgFuture = Future.value(rawSvg);

  SvgDecoration.file(
    File file, {
    this.key,
    this.colorFilter,
  }) : rawSvgFuture = file.readAsString();

  SvgDecoration.asset(
    String asset, {
    this.key,
    this.colorFilter,
  }) : rawSvgFuture = rootBundle.loadString(asset);

  final Future<String> rawSvgFuture;
  final String? key;
  ColorFilter? colorFilter;

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _SvgDecorationPainter(rawSvgFuture, onChanged, key, colorFilter);
  }
}

class _SvgDecorationPainter extends BoxPainter {
  _SvgDecorationPainter(
    this.rawSvgFuture,
    VoidCallback? onChanged,
    String? key,
    ColorFilter? colorFilter,
  ) {
    rawSvgFuture
        .then((rawSvg) => svg.fromSvgString(rawSvg, key ?? '(no key)'))
        .then((d) {
      drawable = d.mergeStyle(
        DrawableStyle(
          fill: DrawablePaint(PaintingStyle.fill, colorFilter: colorFilter,),

        ),
      );
      onChanged?.call();
    });
  }

  final Future<String> rawSvgFuture;
  DrawableRoot? drawable;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    if (drawable != null) {
      canvas
        ..save()
        ..translate(offset.dx, offset.dy);
      drawable!
        ..scaleCanvasToViewBox(canvas, configuration.size!)
        ..draw(canvas, offset & configuration.size!);
      canvas.restore();
    }
  }
}
