import 'package:booklyapp/core/utils/app_router.dart';
import 'package:booklyapp/core/utils/image_asset.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class CustomAppBarHome extends StatelessWidget {
  const CustomAppBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(
          ImageAssets.imglogo,
          width: 85,
          fit: BoxFit.fill,
        ),
        IconButton(
          color: Colors.white,
          padding: EdgeInsets.zero,
          onPressed: () {
            GoRouter.of(context).push(AppRouter.kSearchView);
          },
          icon: const Icon(
            FontAwesomeIcons.magnifyingGlass,
          ),
        )
      ],
    );
  }
}
