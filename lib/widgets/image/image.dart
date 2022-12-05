import 'package:flutter/material.dart';

import 'package:ground_ups/widgets/image/groundUps_svg_provider.dart';
import 'package:ground_ups/widgets/image/svg_decoration.dart';

class GUImage extends StatelessWidget {
  final String src;
  double? height;
  double? width;
  double? ratio;
  BoxShape? shape;
  BoxBorder? border;

  BorderRadiusGeometry? borderRadius;
  EdgeInsetsGeometry? margin;
  ColorFilter? colorFilter;

  final Widget child;

  GUImage(
    this.src, {
    super.key,
    this.height,
    this.width,
    this.ratio,
    this.shape,
    this.border,
    this.borderRadius,
    this.margin,
    this.colorFilter,
    this.child = const Text(''),
  });

  @override
  Widget build(BuildContext context) {
    final svgRegX = RegExp(r'<\s*svg[^>]*>(.*?)<\s*/\s*svg>');
    if (svgRegX.hasMatch(src)) {
      return Container(
        height: height,
        width: width ?? MediaQuery.of(context).size.width,
        margin: margin,
        decoration: BoxDecoration(
          shape: shape ?? BoxShape.rectangle,
          borderRadius: borderRadius,
          border: border,
        ),
        child: Container(
          decoration:
              SvgDecoration.string(src,colorFilter:colorFilter ), // need to marge with ImageProvider
          child: child,
        ),
      );
    }
    return AspectRatio(
      aspectRatio: ratio ?? 1,
      child: Container(
        height: height,
        width: width ?? MediaQuery.of(context).size.width,
        margin: margin,
        decoration: BoxDecoration(
          shape: shape ?? BoxShape.rectangle,
          borderRadius: borderRadius,
          border: border,
          image: DecorationImage(
            fit: BoxFit.fill,
            colorFilter: colorFilter,
            image: getImageProvider(src),
          ),
        ),
        child: child,
      ),
    );
  }
}

ImageProvider<Object> getImageProvider(String src) {
  final httpRegX = RegExp(
    r'(http|ftp|https):\/\/([\w_-]+(?:(?:\.[\w_-]+)+))([\w.,@?^=%&:\/~+#-]*[\w@?^=%&\/~+#-])',
  );
  final svgRegX = RegExp(r'<\s*svg[^>]*>(.*?)<\s*/\s*svg>');
  final svgExtRegX = RegExp(r'\.(svg)(?:\?.*|)$');
  if (httpRegX.hasMatch(src) && !svgRegX.hasMatch(src)) {
    if (svgExtRegX.hasMatch(src)) {
      return GroundUpsSvg(
        src,
        source: SvgSource.network,
      );
    } else {
      return NetworkImage(src);
    }
  } else {
    if (svgExtRegX.hasMatch(src)) {
      return GroundUpsSvg(
        src,
      );
    } else {
      return AssetImage(src);
    }
  }
}
