import 'package:bloc/bloc.dart';
import 'package:booklyapp/core/errors/Failures.dart';
import 'package:booklyapp/core/models/book_model/book_model.dart';
import 'package:booklyapp/features/home/data/repo/Homerepo.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'fetchbook_state.dart';

class FetchbookCubit extends Cubit<FetchbookState> {
  FetchbookCubit(this.homeRepo) : super(FetchbookInitial());
  final HomeRepo homeRepo;
  fetchFeatureBookdata() async {
    emit(FetchbookLoading());
    Either<Failures, List<BookModel>> data = await homeRepo.fetchFeatureBooks();
    data.fold(
      (failures) => emit(
        FetchbookFailure(errorMessage: failures.errormessages),
      ),
      (books) => emit(
        Fetchbooksucess(books: books),
      ),
    );
  }
}
