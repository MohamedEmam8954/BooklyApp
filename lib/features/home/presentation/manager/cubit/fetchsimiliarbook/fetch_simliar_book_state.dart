part of 'fetch_simliar_book_cubit.dart';

sealed class FetchSimliarBookState extends Equatable {
  const FetchSimliarBookState();

  @override
  List<Object> get props => [];
}

final class FetchSimliarBookInitial extends FetchSimliarBookState {}

final class FetchSimliarBookLoading extends FetchSimliarBookState {}

final class FetchSimliarBookSucess extends FetchSimliarBookState {
  final List<BookModel> books;

  const FetchSimliarBookSucess({required this.books});
}

final class FetchSimliarBookFailure extends FetchSimliarBookState {
  final String errormessage;

  const FetchSimliarBookFailure({required this.errormessage});
}
