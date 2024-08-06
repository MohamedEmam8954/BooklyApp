import 'dart:developer';

import 'package:booklyapp/core/errors/Failures.dart';
import 'package:booklyapp/core/widgets/apiServices.dart';
import 'package:booklyapp/core/models/book_model/book_model.dart';
import 'package:booklyapp/features/home/data/repo/Homerepo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImp implements HomeRepo {
  final ApiServices apiServices;
  HomeRepoImp({required this.apiServices});

  @override
  Future<Either<Failures, List<BookModel>>> fetchFeatureBooks() async {
    try {
      var getdata = await apiServices.fetchBookData(
          endPoint: "/volumes?&filtering=free_ebooks&q=subject:programming");
      List<BookModel> books = [];
      for (var i in getdata["items"]) {
        books.add(BookModel.fromJson(i));
      }
      return right(books);
    } on DioError catch (e) {
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      return left(ServerFailure(errormessages: e.toString()));
    }
  }

  @override
  Future<Either<Failures, List<BookModel>>> fetchNewstBooks() async {
    try {
      var getdata = await apiServices.fetchBookData(
          endPoint:
              "/volumes?&filtering=free_ebooks&Sorting=Newst&q=subject:flutter");
      List<BookModel> books = [];
      for (var i in getdata["items"]) {
        books.add(BookModel.fromJson(i));
        books.add(BookModel.fromJson(i));
      }
      return right(books);
    } on DioError catch (e) {
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      return left(ServerFailure(errormessages: e.toString()));
    }
  }

  @override
  Future<Either<Failures, List<BookModel>>> fetchSimilarBooks(
      {required String category}) async {
    try {
      var getdata = await apiServices.fetchBookData(
          endPoint: "/volumes?&filtering=free_ebooks&q=subject:$category");
      List<BookModel> books = [];
      for (var i in getdata["items"]) {
        try {
          books.add(BookModel.fromJson(i));
        } catch (e) {
          log("this is an error with $i");
        }
      }
      return right(books);
    } on DioError catch (e) {
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      return left(ServerFailure(errormessages: e.toString()));
    }
  }
}
