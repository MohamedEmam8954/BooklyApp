import 'package:booklyapp/core/widgets/servicelocator.dart';
import 'package:booklyapp/features/Splah_Screen/presentation/views/splahview.dart';
import 'package:booklyapp/core/models/book_model/book_model.dart';
import 'package:booklyapp/features/home/data/repo/homerepoimp.dart';
import 'package:booklyapp/features/home/presentation/manager/cubit/fetchsimiliarbook/fetch_simliar_book_cubit.dart';
import 'package:booklyapp/features/home/presentation/views/home_details_view.dart';
import 'package:booklyapp/features/home/presentation/views/homeview.dart';
import 'package:booklyapp/features/search/presentation/views/serachView.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static String khomeview = "/homeview";
  static String kSplashView = "/splashview";
  static String kHomeDetails = "/homeDetails";
  static String kSearchView = "/searchView";

  static GoRouter goRouter = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const SplashView()),
      GoRoute(
        path: khomeview,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: kHomeDetails,
        builder: (context, state) {
          return BlocProvider(
            create: (context) =>
                FetchSimliarBookCubit(ServiceLocator.getIt.get<HomeRepoImp>()),
            child: HomeDetailsView(
              bookModel: state.extra as BookModel,
            ),
          );
        },
      ),
      GoRoute(
        path: kSearchView,
        builder: (context, state) => const SearchView(),
      )
    ],
  );
}
