import 'package:booklyapp/core/errors/Failures.dart';
import 'package:booklyapp/core/models/book_model/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class SearchRepo {
  Future<Either<Failures, List<BookModel>>> searchBook(
      {required String searchBook});
}
