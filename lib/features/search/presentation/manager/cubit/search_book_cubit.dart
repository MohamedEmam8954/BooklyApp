import 'package:bloc/bloc.dart';
import 'package:booklyapp/core/errors/Failures.dart';
import 'package:booklyapp/core/models/book_model/book_model.dart';
import 'package:booklyapp/features/search/data/repo/serachRepo.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'search_book_state.dart';

class SearchBookCubit extends Cubit<SearchBookState> {
  final SearchRepo searchRepo;
  bool isSucess = false;

  SearchBookCubit(this.searchRepo) : super(SearchBookInitial());

  Future<void> searchBook({required String searchBook}) async {
    emit(SearchBookLoading());

    Either<Failures, List<BookModel>> data =
        await searchRepo.searchBook(searchBook: searchBook);

    data.fold(
      (failure) {
        emit(SearchBookFailure(errorMessage: failure.errormessages));
      },
      (books) {
        isSucess = true;
        emit(SearchBooksucess(books: books));
      },
    );
  }
}
