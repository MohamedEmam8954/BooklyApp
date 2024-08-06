import 'package:booklyapp/core/utils/image_asset.dart';
import 'package:booklyapp/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SearchInitialBook extends StatelessWidget {
  const SearchInitialBook({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            ImageAssets.nobooks,
            fit: BoxFit.fill,
            width: 100,
            height: 100,
          ),
          Opacity(
            opacity: 0.5,
            child: Text(
              "there is No books search now!",
              style: TextStyle(
                  color: Colors.white.withOpacity(0.4),
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
