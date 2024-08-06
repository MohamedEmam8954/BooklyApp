import 'package:booklyapp/core/utils/styles.dart';
import 'package:flutter/material.dart';

class SearchNoResult extends StatelessWidget {
  const SearchNoResult({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
          "there No Result Try Later! ",
          style: AppSyles.style20,
        ),
      ],
    );
  }
}
