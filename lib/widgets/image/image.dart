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
  EdgeInsetsGeometry? padding;
  Color? bgColor;
  ColorFilter? colorFilter;
  BoxFit? fit;

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
    this.padding,
    this.colorFilter,
    this.bgColor,
    this.fit,
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
        padding: padding,
        decoration:
            SvgDecoration.string(src), // need to marge with ImageProvider
        child: child,
      );
    }
    return Container(
      height: height,
      width: width ?? MediaQuery.of(context).size.width,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        shape: shape ?? BoxShape.rectangle,
        borderRadius: borderRadius,
        border: border,
        color: bgColor,
        image: DecorationImage(
          fit: fit ?? BoxFit.fill,
          colorFilter: colorFilter,
          image: getImageProvider(src),
        ),
      ),
      child: child,
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
