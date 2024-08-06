import 'package:booklyapp/core/widgets/customloadingwidget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({super.key, required this.bookImg});
  final String bookImg;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.4 / 4,
      child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: CachedNetworkImage(
            imageUrl: bookImg,
            fit: BoxFit.fill,
            errorWidget: (context, url, error) => const Icon(Icons.error),
            placeholder: (context, url) => const CustomLoadingWidget(),
          )),
    );
  }
}
