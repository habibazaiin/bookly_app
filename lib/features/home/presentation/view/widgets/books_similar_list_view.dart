import 'package:bookly_app/features/home/presentation/view/widgets/featured_list_view_item.dart';
import 'package:flutter/material.dart';

class BooksSimilarListView extends StatelessWidget {
  const BooksSimilarListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .15,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.zero,
        itemBuilder: (context, Index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: FeaturedListViewItem(),
          );
        },
      ),
    );
  }
}