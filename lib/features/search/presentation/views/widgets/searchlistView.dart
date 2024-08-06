import 'package:booklyapp/core/widgets/customErrorwidget.dart';
import 'package:booklyapp/core/widgets/customloadingwidget.dart';
import 'package:booklyapp/features/home/presentation/views/widgets/Newst_Books_Item.dart';
import 'package:booklyapp/features/search/presentation/manager/cubit/search_book_cubit.dart';
import 'package:booklyapp/features/search/presentation/views/widgets/searchInitialbook.dart';
import 'package:booklyapp/features/search/presentation/views/widgets/searchResult.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchListView extends StatelessWidget {
  const SearchListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBookCubit, SearchBookState>(
      builder: (context, state) {
        if (state is SearchBooksucess) {
          return ListView.builder(
            itemCount: state.books.length,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: NewstBooksItem(
                  booksData: state.books[index],
                ),
              );
            },
          );
        } else if (state is SearchBookFailure) {
          return CustomErrorWidget(errorMessage: state.errorMessage);
        } else if (state is SearchBookInitial) {
          return const SearchInitialBook();
        } else {
          return const CustomLoadingWidget();
        }
      },
    );
  }
}
