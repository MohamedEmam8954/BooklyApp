part of 'fetchbook_cubit.dart';

sealed class FetchbookState extends Equatable {
  const FetchbookState();

  @override
  List<Object> get props => [];
}

final class FetchbookInitial extends FetchbookState {}

final class FetchbookLoading extends FetchbookState {}

final class Fetchbooksucess extends FetchbookState {
  final List<BookModel> books;

  const Fetchbooksucess({required this.books});
}

final class FetchbookFailure extends FetchbookState {
  final String errorMessage;

  const FetchbookFailure({required this.errorMessage});
}
