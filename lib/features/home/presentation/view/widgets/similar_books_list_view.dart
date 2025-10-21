import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/entities/book_entity.dart';
import 'package:bookly_app/features/home/presentation/view/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key, required this.bookEntity});
  final List<BookEntity> bookEntity;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .15,
      child: ListView.builder(
        itemCount: bookEntity.length,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: GestureDetector(
              onTap: () {
                context.push(
                  AppRouter.kBookDetailsView,
                  extra: bookEntity[index],
                );
              },
              child: CustomBookImage(imageURL: bookEntity[index].image ?? ''),
            ),
          );
        },
      ),
    );
  }
}
