import 'package:demo/core/constants/num_constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CommonTextWidget extends StatelessWidget {
  const CommonTextWidget(
      {this.top,
      this.left,
      this.right,
      this.bottom,
      this.textAlign,
      this.color,
      this.text,
        this.textOverflow,
      this.fontSize,
      this.fontWeight,
      this.style,
        this.decoration,
      super.key});

  final String? text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final TextAlign? textAlign;
  final TextStyle? style;
  final double? left;
  final double? right;
  final double? top;
  final TextDecoration? decoration;
  final TextOverflow? textOverflow;
  final double? bottom;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: left ?? zero,
          right: right ?? zero,
          bottom: bottom ?? zero,
          top: top ?? zero),
      child: Text(
      overflow: textOverflow,
        textAlign: textAlign,
        text ?? '',
        style: style ??
            GoogleFonts.roboto(
              decoration: decoration,
                color: color ?? Colors.black.withOpacity(zero50),
                fontWeight: fontWeight ?? FontWeight.w500,
                fontSize: fontSize ?? fourteen),
      ),
    );
  }
}
