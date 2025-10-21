import 'package:bookly_app/core/widgets/FadingWidget.dart';
import 'package:bookly_app/features/home/presentation/view/widgets/custom_book_image_loading_indicator.dart';
import 'package:flutter/material.dart';

class SimilarBooksListViewLoadingIndicator extends StatelessWidget {
  const SimilarBooksListViewLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return FadingWidget(
      repeat: true,
      duration: const Duration(seconds: 1),
      placeholder: Container(),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * .15,
        child: ListView.builder(
          itemCount: 5,
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: CustomBookImageLoadingIndicator(),
            );
          },
        ),
      ),
    );
  }
}
