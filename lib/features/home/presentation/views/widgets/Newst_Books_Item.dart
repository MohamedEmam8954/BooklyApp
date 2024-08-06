import 'package:booklyapp/constant.dart';
import 'package:booklyapp/core/utils/app_router.dart';
import 'package:booklyapp/core/utils/image_asset.dart';
import 'package:booklyapp/core/utils/styles.dart';
import 'package:booklyapp/core/models/book_model/book_model.dart';
import 'package:booklyapp/features/home/presentation/views/widgets/bookRating.dart';
import 'package:booklyapp/features/home/presentation/views/widgets/customImage.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NewstBooksItem extends StatelessWidget {
  const NewstBooksItem({super.key, required this.booksData});
  final BookModel booksData;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kHomeDetails, extra: booksData);
      },
      child: Row(
        children: [
          SizedBox(
            width: 80,
            child: CustomImage(
              bookImg: booksData.volumeInfo!.imageLinks?.thumbnail ??
                  ImageAssets.defalutImg,
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: width * 0.5,
                  child: Text(
                    booksData.volumeInfo!.title!,
                    style: AppSyles.style20.copyWith(
                      fontFamily: kGTSectra,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Opacity(
                  opacity: 0.6,
                  child: Text(
                    booksData.volumeInfo!.authors![0],
                    style: AppSyles.style16,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      r"Free",
                      style: AppSyles.style20,
                    ),
                    BookRating(
                      rate: 4.5,
                      count: 2500,
                      mainAxisAlignment: MainAxisAlignment.center,
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
