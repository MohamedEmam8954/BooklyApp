import 'package:booklyapp/core/utils/app_router.dart';
import 'package:booklyapp/core/widgets/customErrorwidget.dart';
import 'package:booklyapp/core/widgets/customloadingwidget.dart';
import 'package:booklyapp/features/home/presentation/manager/cubit/fetchbookcubit/fetchbook_cubit.dart';
import 'package:booklyapp/features/home/presentation/views/widgets/customImage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class FeaturedListViewBooks extends StatelessWidget {
  const FeaturedListViewBooks({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return BlocBuilder<FetchbookCubit, FetchbookState>(
      builder: (context, state) {
        if (state is Fetchbooksucess) {
          return SizedBox(
            height: height * 0.3,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: state.books.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: GestureDetector(
                    onTap: () {
                      GoRouter.of(context).push(AppRouter.kHomeDetails,
                          extra: state.books[index]);
                    },
                    child: CustomImage(
                      bookImg: state
                              .books[index].volumeInfo?.imageLinks!.thumbnail ??
                          "",
                    ),
                  ),
                );
              },
            ),
          );
        } else if (state is FetchbookFailure) {
          return CustomErrorWidget(errorMessage: state.errorMessage);
        } else {
          return const CustomLoadingWidget();
        }
      },
    );
  }
}
