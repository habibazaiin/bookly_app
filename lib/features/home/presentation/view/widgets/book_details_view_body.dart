import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/core/widgets/custom_button.dart';
import 'package:bookly_app/features/home/presentation/view/widgets/book_rating.dart';
import 'package:bookly_app/features/home/presentation/view/widgets/books_action.dart';
import 'package:bookly_app/features/home/presentation/view/widgets/books_similar_list_view.dart';
import 'package:bookly_app/features/home/presentation/view/widgets/custom_book_details_app_bar.dart';
import 'package:bookly_app/features/home/presentation/view/widgets/featured_list_view_item.dart';
import 'package:bookly_app/features/home/presentation/view/widgets/features_list_view.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.2;
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                CustomBookDetailsAppBar(),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width),
                  child: FeaturedListViewItem(),
                ),
                const SizedBox(height: 42),
                Text(
                  'The Jungle Book',
                  style: Styles.textStyle30.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                Opacity(
                  opacity: 0.7,
                  child: Text(
                    'Rudyard Kipling',
                    style: Styles.textStyle18.copyWith(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(height: 18),
                BookRating(mainAxisAlignment: MainAxisAlignment.center),
                SizedBox(height: 37),
                BooksAction(),
                Expanded(child: SizedBox(height: 50)),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'you can also like',
                    style: Styles.textStyle14.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(height: 16),
                BooksSimilarListView(),
                SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
