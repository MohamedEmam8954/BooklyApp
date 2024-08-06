// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';

class ApiServices {
  String url = "https://www.googleapis.com/books/v1";
  String apiKey = "AIzaSyCxQj_LDvv3gbmZJnIrfPTM5qUfNo3l2pU";
  Dio dio;
  ApiServices({
    required this.dio,
  });
  fetchBookData({required String endPoint}) async {
    Response response = await dio.get("$url$endPoint&key=$apiKey");
    return response.data;
  }
}
