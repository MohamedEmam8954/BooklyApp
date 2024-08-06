import 'package:booklyapp/constant.dart';
import 'package:booklyapp/core/function/url_launcher.dart';
import 'package:booklyapp/core/utils/styles.dart';
import 'package:booklyapp/core/widgets/custombuttom.dart';
import 'package:booklyapp/core/models/book_model/book_model.dart';
import 'package:booklyapp/features/home/presentation/views/widgets/bookRating.dart';
import 'package:flutter/material.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          bookModel.volumeInfo!.title!,
          style: AppSyles.style26.copyWith(
            fontFamily: kGTSectra,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 5,
        ),
        Opacity(
          opacity: 0.7,
          child: Text(
            bookModel.volumeInfo!.authors![0],
            style: AppSyles.style16,
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 8),
        const BookRating(
          rate: 4.5,
          count: 2500,
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          children: [
            Expanded(
              child: CustomButtom(
                textcolor: Colors.black,
                onTap: () {},
                color: Colors.white,
                title: "Free",
                topleft: const Radius.circular(8),
                bottomleft: const Radius.circular(8),
              ),
            ),
            Expanded(
              child: CustomButtom(
                textcolor: Colors.white,
                onTap: () {
                  urlLauncher(
                      url: bookModel.volumeInfo!.previewLink!,
                      context: context);
                },
                color: const Color(0xfffb8c60),
                title: "Preview",
                topright: const Radius.circular(8),
                bottomright: const Radius.circular(8),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
