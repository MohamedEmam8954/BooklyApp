import 'package:booklyapp/core/errors/Failures.dart';
import 'package:booklyapp/core/models/book_model/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failures, List<BookModel>>> fetchFeatureBooks();
  Future<Either<Failures, List<BookModel>>> fetchNewstBooks();
  Future<Either<Failures, List<BookModel>>> fetchSimilarBooks(
      {required String category});
}
