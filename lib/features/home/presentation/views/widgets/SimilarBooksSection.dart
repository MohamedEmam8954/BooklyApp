import 'package:booklyapp/core/utils/styles.dart';
import 'package:booklyapp/features/home/presentation/views/widgets/SimilarBooksListView%20.dart';
import 'package:flutter/material.dart';

class SimilarBooksSection extends StatelessWidget {
  const SimilarBooksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Opacity(
          opacity: 0.5,
          child: Text(
            "You Also See",
            style: AppSyles.style18,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        SimilarBooksListView(),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
