import 'package:booklyapp/core/models/book_model/book_model.dart';
import 'package:booklyapp/features/home/presentation/manager/cubit/fetchsimiliarbook/fetch_simliar_book_cubit.dart';
import 'package:booklyapp/features/home/presentation/views/widgets/Home_Details_Body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeDetailsView extends StatefulWidget {
  const HomeDetailsView({
    super.key,
    required this.bookModel,
  });
  final BookModel bookModel;

  @override
  State<HomeDetailsView> createState() => _HomeDetailsViewState();
}

class _HomeDetailsViewState extends State<HomeDetailsView> {
  @override
  void initState() {
    BlocProvider.of<FetchSimliarBookCubit>(context).fetchSimliarBooks(
        category: widget.bookModel.volumeInfo!.categories?[0] == null
            ? "programming"
            : widget.bookModel.volumeInfo!.categories![0]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: HomeDetailsBody(
          bookModel: widget.bookModel,
        ),
      ),
    );
  }
}
