import 'package:bookly_app/core/widgets/FadingWidget.dart';
import 'package:bookly_app/features/home/presentation/view/widgets/custom_book_image_loading_indicator.dart';
import 'package:flutter/material.dart';

class FeaturedListViewLoadingIndicator extends StatelessWidget {
  const FeaturedListViewLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return FadingWidget(
      repeat: true,
      duration: const Duration(seconds: 1),
      placeholder: Container(), 
      child: SizedBox(
        height: MediaQuery.of(context).size.height * .3,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: 5,
          padding: EdgeInsets.zero,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: CustomBookImageLoadingIndicator(),
            );
          },
        ),
      ),
    );
  }
}


