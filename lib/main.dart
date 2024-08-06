import 'package:booklyapp/constant.dart';
import 'package:booklyapp/core/models/blocObserver.dart';
import 'package:booklyapp/core/utils/app_router.dart';
import 'package:booklyapp/core/widgets/servicelocator.dart';
import 'package:booklyapp/features/home/data/repo/homerepoimp.dart';
import 'package:booklyapp/features/home/presentation/manager/cubit/fetchNewsbookscubir/fetch_news_books_cubit.dart';
import 'package:booklyapp/features/home/presentation/manager/cubit/fetchbookcubit/fetchbook_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const BooklyApp());
  Bloc.observer = MyBlocObserver();
  ServiceLocator().setUp();
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FetchbookCubit(
            ServiceLocator.getIt.get<HomeRepoImp>(),
          )..fetchFeatureBookdata(),
        ),
        BlocProvider(
          create: (context) => FetchNewsBooksCubit(
            ServiceLocator.getIt.get<HomeRepoImp>(),
          )..fetchNewstBooks(),
        ),
      ],
      child: MaterialApp.router(
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme:
              GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
        ),
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.goRouter,
      ),
    );
  }
}
