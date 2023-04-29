import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class TextWidget extends StatelessWidget {
  const TextWidget(
      {super.key,
      required this.text,
      this.textAlign,
      this.color,
      this.fontSize,
      this.fontWeight,
      this.letterSpacing,
      this.decoration,
      this.maxLines,
      this.overflow});

  final String text;
  final TextAlign? textAlign;
  final TextDecoration? decoration;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? letterSpacing;
  final TextOverflow? overflow;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign ?? TextAlign.start,
      overflow: overflow,
      maxLines: maxLines,
      style: GoogleFonts.inter(
        textStyle: TextStyle(
          color: color ?? Colors.black,
          fontSize: fontSize ?? 12.sp,
          fontWeight: fontWeight ?? FontWeight.w400,
          decoration: decoration ?? TextDecoration.none,
          letterSpacing: letterSpacing ?? 0,
        ),
      ),
    );
  }
}

class GradientTextWidget extends StatelessWidget {
  const GradientTextWidget({
    super.key,
    required this.text,
    this.textAlign,
    this.fontSize,
    this.fontWeight,
    this.letterSpacing,
    required this.gradient,
    this.decoration,
    this.maxLines,
  });

  final String text;
  final TextAlign? textAlign;
  final TextDecoration? decoration;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? letterSpacing;
  final List<Color> gradient;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return GradientText(
      text,
      textAlign: textAlign ?? TextAlign.center,
      style: GoogleFonts.inter(
        textStyle: TextStyle(
          decoration: decoration ?? TextDecoration.none,
          fontSize: fontSize,
          fontWeight: fontWeight,
          letterSpacing: letterSpacing ?? 0,
        ),
      ),
      colors: gradient,
      maxLines: maxLines,
    );
  }
}
