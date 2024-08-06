import 'package:booklyapp/core/widgets/apiServices.dart';
import 'package:booklyapp/features/home/data/repo/homerepoimp.dart';
import 'package:booklyapp/features/search/data/repo/searchRepoImp.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class ServiceLocator {
  static GetIt getIt = GetIt.instance;
  setUp() {
    getIt.registerSingleton<ApiServices>(ApiServices(dio: Dio()));
    getIt.registerSingleton<HomeRepoImp>(
      HomeRepoImp(apiServices: getIt.get<ApiServices>()),
    );
    getIt.registerSingleton<SearchRepoImp>(
        SearchRepoImp(apiServices: getIt.get<ApiServices>()));
  }
}
