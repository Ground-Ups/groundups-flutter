
import 'package:flutter/material.dart';

import 'package:ground_ups/widgets/image/groundUps_svg_provider.dart';

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
    bool isSvg = false;
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
          colorFilter: colorFilter ?? const ColorFilter.mode(Colors.black26, BlendMode.colorBurn),
          image: const GroundUpsSvg(
            'https://dev.w3.org/SVG/tools/svgweb/samples/svg-files/ubuntu.svg',
            source: SvgSource.network,
          ),
        ),
      ),
      child: child,
    );
  }
}

// find link
/*
(http|ftp|https):\/\/([\w_-]+(?:(?:\.[\w_-]+)+))([\w.,@?^=%&:\/~+#-]*[\w@?^=%&\/~+#-])*/

//find svg code
//<\s*svg[^>]*>(.*?)<\s*/\s*svg>

// find .svg
//\.(svg)(?:\?.*|)$
