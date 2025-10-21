import 'package:bookly_app/core/widgets/FadingWidget.dart';
import 'package:bookly_app/features/home/presentation/view/widgets/custom_book_image_loading_indicator.dart';
import 'package:flutter/material.dart';

class NewestBooksListViewLoadingIndicator extends StatelessWidget {
  const NewestBooksListViewLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return FadingWidget(
      repeat: true,
      duration: const Duration(seconds: 1),
      placeholder: Container(),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * .3,
        child: ListView.builder(
          padding: EdgeInsets.zero,
          physics: const BouncingScrollPhysics(),
          itemCount: 5,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                children: [
                  SizedBox(
                    height: 130,
                    child: CustomBookImageLoadingIndicator(),
                  ),
                  SizedBox(width: 30),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .5,
                          child: Container(
                            height: 18,
                            width: MediaQuery.of(context).size.width * 0.5,
                            color: Colors.grey[300],
                          ),
                        ),
                        SizedBox(height: 3),
                        Container(
                          height: 14,
                          width: MediaQuery.of(context).size.width * 0.3,
                          color: Colors.grey[300],
                        ),
                        SizedBox(height: 3),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
