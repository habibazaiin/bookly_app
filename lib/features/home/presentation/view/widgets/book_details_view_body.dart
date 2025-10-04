import 'package:bookly_app/features/home/presentation/view/widgets/custom_book_details_app_bar.dart';
import 'package:bookly_app/features/home/presentation/view/widgets/featured_list_view_item.dart';
import 'package:bookly_app/features/home/presentation/view/widgets/features_list_view.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.16;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          CustomBookDetailsAppBar(),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: width),
            child: FeaturedListViewItem(),
          ),
        ],
      ),
    );
  }
}
