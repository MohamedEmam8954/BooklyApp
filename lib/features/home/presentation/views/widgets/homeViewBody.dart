import 'package:booklyapp/core/utils/styles.dart';
import 'package:booklyapp/features/home/presentation/views/widgets/Newst_List_View.dart';
import 'package:booklyapp/features/home/presentation/views/widgets/custom_Appbar_Home.dart';
import 'package:booklyapp/features/home/presentation/views/widgets/featured_ListView_book.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.04,
        vertical: width * 0.02,
      ),
      child: const CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: CustomAppBarHome(),
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: 15),
          ),
          SliverToBoxAdapter(
            child: FeaturedListViewBooks(),
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: 30),
          ),
          SliverToBoxAdapter(
            child: Text(
              "Newst Books",
              style: AppSyles.style18,
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: 15),
          ),
          NewstListView(),
        ],
      ),
    );
  }
}
