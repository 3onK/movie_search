// 커스텀 텍스트 위젯

import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color? color;
  final FontWeight fontWeight;
  final double fontSize;
  final double height;
  final TextOverflow overflow;
  final TextAlign textAlign;
  final int? maxLines;

  const CustomText({
    Key? key,
    required this.text,
    this.color = const Color(0xff191919),
    this.fontWeight = FontWeight.w400,
    this.fontSize = 14.0,
    this.height = 1.2,
    this.overflow = TextOverflow.clip,
    this.textAlign = TextAlign.start,
    this.maxLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
      textAlign: textAlign,
      maxLines: maxLines,
      style: TextStyle(
        height: height,
        color: color,
        fontWeight: fontWeight,
        fontSize: fontSize,
      ),
    );
  }
}
