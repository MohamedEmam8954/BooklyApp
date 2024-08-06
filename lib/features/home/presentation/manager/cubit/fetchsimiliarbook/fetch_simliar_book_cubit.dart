import 'package:bloc/bloc.dart';
import 'package:booklyapp/core/errors/Failures.dart';
import 'package:booklyapp/core/models/book_model/book_model.dart';
import 'package:booklyapp/features/home/data/repo/Homerepo.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'fetch_simliar_book_state.dart';

class FetchSimliarBookCubit extends Cubit<FetchSimliarBookState> {
  FetchSimliarBookCubit(this.homeRepo) : super(FetchSimliarBookInitial());
  final HomeRepo homeRepo;
  fetchSimliarBooks({required String category}) async {
    emit(FetchSimliarBookLoading());
    Either<Failures, List<BookModel>> data =
        await homeRepo.fetchSimilarBooks(category: category);
    data.fold(
      (failures) => emit(
        FetchSimliarBookFailure(errormessage: failures.errormessages),
      ),
      (books) => emit(
        FetchSimliarBookSucess(books: books),
      ),
    );
  }
}
