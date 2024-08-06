import 'package:booklyapp/core/widgets/servicelocator.dart';
import 'package:booklyapp/features/search/data/repo/searchRepoImp.dart';
import 'package:booklyapp/features/search/presentation/manager/cubit/search_book_cubit.dart';
import 'package:booklyapp/features/search/presentation/views/widgets/searchViewBody.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) =>
              SearchBookCubit(ServiceLocator.getIt.get<SearchRepoImp>()),
          child: const SearchViewBody(),
        ),
      ),
    );
  }
}
