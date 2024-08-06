import 'package:booklyapp/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookRating extends StatelessWidget {
  const BookRating(
      {super.key,
      required this.rate,
      required this.count,
      required this.mainAxisAlignment});
  final double rate;
  final int count;
  final MainAxisAlignment mainAxisAlignment;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        const Icon(
          FontAwesomeIcons.solidStar,
          color: Colors.amber,
          size: 18,
        ),
        const SizedBox(
          width: 4.5,
        ),
        Text(
          rate.toString(),
          style: AppSyles.style18,
        ),
        const SizedBox(
          width: 2.5,
        ),
        Opacity(
          opacity: 0.6,
          child: Text(
            "($count)",
            style: AppSyles.style16,
          ),
        ),
      ],
    );
  }
}
