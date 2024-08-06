// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:booklyapp/core/errors/Failures.dart';
import 'package:booklyapp/core/models/book_model/book_model.dart';
import 'package:booklyapp/core/widgets/apiServices.dart';
import 'package:booklyapp/features/search/data/repo/serachRepo.dart';
import 'package:dio/dio.dart';

class SearchRepoImp implements SearchRepo {
  final ApiServices apiServices;
  SearchRepoImp({
    required this.apiServices,
  });
  Future<Either<Failures, List<BookModel>>> searchBook(
      {required String searchBook}) async {
    try {
      var data = await apiServices.fetchBookData(
          endPoint: "/volumes?&filtering=free_ebooks&q=subject:$searchBook");
      List<BookModel> books = [];
      for (var i in data["items"]) {
        books.add(BookModel.fromJson(i));
      }
      return right(books);
    } on DioException catch (e) {
      if (e is DioError) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }
      return left(
        Failures(
          errormessages: e.toString(),
        ),
      );
    }
  }
}
