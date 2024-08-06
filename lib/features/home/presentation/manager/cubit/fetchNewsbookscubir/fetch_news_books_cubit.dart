import 'package:bloc/bloc.dart';
import 'package:booklyapp/core/errors/Failures.dart';
import 'package:booklyapp/core/models/book_model/book_model.dart';
import 'package:booklyapp/features/home/data/repo/Homerepo.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'fetch_news_books_state.dart';

class FetchNewsBooksCubit extends Cubit<FetchNewsBooksState> {
  FetchNewsBooksCubit(this.homeRepo) : super(FetchNewsBooksInitial());
  final HomeRepo homeRepo;
  fetchNewstBooks() async {
    Either<Failures, List<BookModel>> data = await homeRepo.fetchNewstBooks();
    data.fold(
      (failure) => emit(
        FetchNewsBooksFailures(errorMessage: failure.errormessages),
      ),
      (books) => emit(FetchNewsBooksSucess(books: books)),
    );
  }
}
