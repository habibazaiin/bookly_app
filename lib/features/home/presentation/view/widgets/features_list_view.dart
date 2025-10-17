import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/home/presentation/view/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';


import 'package:go_router/go_router.dart';

class FeaturedListView extends StatelessWidget {
  const FeaturedListView({super.key, required this.bookEntity});
final List<BookEntity> bookEntity;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .3,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: bookEntity.length,
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: GestureDetector(
              onTap: () {
                context.push(AppRouter.kBookDetailsView, extra: bookEntity[index]);
              },
              child: CustomBookImage(imageURL: bookEntity[index].image ?? ''),
            ),
          );
        },
      ),
    );
  }
}

