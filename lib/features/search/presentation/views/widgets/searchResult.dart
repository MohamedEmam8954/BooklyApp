import 'package:booklyapp/core/utils/styles.dart';
import 'package:flutter/material.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Result:",
          style: AppSyles.style20,
        ),
      ],
    );
  }
}
