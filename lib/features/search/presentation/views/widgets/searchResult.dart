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
          "the result is:",
          style: AppSyles.style18,
        ),
        SizedBox(
          height: 32,
        ),
      ],
    );
  }
}
