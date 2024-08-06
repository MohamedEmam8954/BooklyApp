import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class CustomAppbarHomeDetails extends StatelessWidget {
  const CustomAppbarHomeDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          color: Colors.white,
          padding: EdgeInsets.zero,
          onPressed: () {
            GoRouter.of(context).pop();
          },
          icon: const Icon(
            FontAwesomeIcons.xmark,
          ),
        ),
        IconButton(
          color: Colors.white,
          padding: EdgeInsets.zero,
          onPressed: () {},
          icon: const Icon(
            FontAwesomeIcons.cartShopping,
          ),
        ),
      ],
    );
  }
}
