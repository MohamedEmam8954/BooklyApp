import 'package:booklyapp/constant.dart';
import 'package:booklyapp/core/utils/app_router.dart';
import 'package:booklyapp/core/utils/image_asset.dart';
import 'package:booklyapp/core/utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> animation;
  @override
  void initState() {
    super.initState();
    sildingAnimation();
    navToHome();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(ImageAssets.imglogo),
        const SizedBox(
          height: 10,
        ),
        AnimatedBuilder(
          animation: animationController,
          builder: (context, child) {
            return SlideTransition(
              position: animation,
              child: Text(
                "Read More Free Books",
                textAlign: TextAlign.center,
                style: AppSyles.style18.copyWith(fontFamily: kGTSectra),
              ),
            );
          },
        )
      ],
    );
  }

  void navToHome() {
    Future.delayed(const Duration(seconds: 3), () {
      GoRouter.of(context).push(AppRouter.khomeview);
    });
  }

  void sildingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    animation =
        Tween<Offset>(begin: const Offset(0, 4), end: const Offset(0, 0))
            .animate(animationController);
    animationController.forward();
  }
}
