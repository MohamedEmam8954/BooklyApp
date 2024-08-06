import 'package:booklyapp/core/widgets/customtextfield.dart';
import 'package:booklyapp/features/search/presentation/manager/cubit/search_book_cubit.dart';
import 'package:booklyapp/features/search/presentation/views/widgets/searchlistView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextField(
            onsubmit: (value) {
              BlocProvider.of<SearchBookCubit>(context)
                  .searchBook(searchBook: value);
            },
            hintText: "Search",
          ),
          const SizedBox(
            height: 20,
          ),
          const Expanded(child: SearchListView())
        ],
      ),
    );
  }
}
