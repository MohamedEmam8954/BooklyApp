import 'package:booklyapp/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomButtom extends StatelessWidget {
  const CustomButtom(
      {super.key,
      required this.color,
      required this.title,
      this.topleft,
      this.topright,
      this.bottomleft,
      this.bottomright,
      required this.onTap,
      required this.textcolor});
  final Color color, textcolor;
  final String title;
  final Radius? topleft, topright, bottomleft, bottomright;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: 38,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.only(
            topLeft: topleft ?? Radius.zero,
            topRight: topright ?? Radius.zero,
            bottomLeft: bottomleft ?? Radius.zero,
            bottomRight: bottomright ?? Radius.zero,
          ),
        ),
        child: Text(
          title,
          style: AppSyles.style18.copyWith(
            color: textcolor,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
