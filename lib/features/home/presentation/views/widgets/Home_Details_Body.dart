import 'package:booklyapp/core/utils/image_asset.dart';
import 'package:booklyapp/core/models/book_model/book_model.dart';
import 'package:booklyapp/features/home/presentation/views/widgets/BookDetailsSection.dart';
import 'package:booklyapp/features/home/presentation/views/widgets/SimilarBooksSection.dart';
import 'package:booklyapp/features/home/presentation/views/widgets/customAppbarHomeDetails.dart';
import 'package:booklyapp/features/home/presentation/views/widgets/customImage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeDetailsBody extends StatelessWidget {
  const HomeDetailsBody({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomAppbarHomeDetails(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.24),
                  child: CustomImage(
                    bookImg: bookModel.volumeInfo?.imageLinks?.thumbnail ??
                        ImageAssets.defalutImg,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                BookDetailsSection(
                  bookModel: bookModel,
                ),
                const Expanded(
                  child: SizedBox(
                    height: 50,
                  ),
                ),
                const SimilarBooksSection(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
