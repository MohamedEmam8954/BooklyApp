import 'package:booklyapp/core/widgets/customErrorwidget.dart';
import 'package:booklyapp/core/widgets/customloadingwidget.dart';
import 'package:booklyapp/features/home/presentation/manager/cubit/fetchNewsbookscubir/fetch_news_books_cubit.dart';
import 'package:booklyapp/features/home/presentation/views/widgets/Newst_Books_Item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewstListView extends StatelessWidget {
  const NewstListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchNewsBooksCubit, FetchNewsBooksState>(
      builder: (context, state) {
        if (state is FetchNewsBooksSucess) {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: NewstBooksItem(
                    booksData: state.books[index],
                  ),
                );
              },
              childCount: state.books.length,
            ),
          );
        } else if (state is FetchNewsBooksFailures) {
          return SliverToBoxAdapter(
            child: CustomErrorWidget(errorMessage: state.errorMessage),
          );
        } else {
          return const SliverToBoxAdapter(
            child: CustomLoadingWidget(),
          );
        }
      },
    );
  }
}
