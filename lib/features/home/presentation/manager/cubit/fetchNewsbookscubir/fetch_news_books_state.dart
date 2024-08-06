part of 'fetch_news_books_cubit.dart';

sealed class FetchNewsBooksState extends Equatable {
  const FetchNewsBooksState();

  @override
  List<Object> get props => [];
}

final class FetchNewsBooksInitial extends FetchNewsBooksState {}

final class FetchNewsBooksLoading extends FetchNewsBooksState {}

final class FetchNewsBooksSucess extends FetchNewsBooksState {
  final List<BookModel> books;

  const FetchNewsBooksSucess({required this.books});
}

final class FetchNewsBooksFailures extends FetchNewsBooksState {
  final String errorMessage;

  const FetchNewsBooksFailures({required this.errorMessage});
}
