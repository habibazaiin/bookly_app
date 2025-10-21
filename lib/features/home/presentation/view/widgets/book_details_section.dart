import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/core/entities/book_entity.dart';
import 'package:bookly_app/features/home/presentation/view/widgets/book_rating.dart';
import 'package:bookly_app/features/home/presentation/view/widgets/books_action.dart';
import 'package:bookly_app/features/home/presentation/view/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.bookEntity});
  final BookEntity bookEntity;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.2;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width),
          child: CustomBookImage(
            imageURL: bookEntity.image ?? '',
          ),
        ),
        const SizedBox(height: 42),
        Text(
          bookEntity.title,
          style: Styles.textStyle30.copyWith(fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 6),
        Opacity(
          opacity: 0.7,
          child: Text(
            bookEntity.authorName ?? '',
            style: Styles.textStyle18.copyWith(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(height: 18),
        BookRating(
          mainAxisAlignment: MainAxisAlignment.center,
          rating: (bookEntity.rating ?? 0).toDouble(),
          count: (bookEntity.ratingCount ?? 0).toInt(),
        ),
        SizedBox(height: 37),
        BooksAction(bookEntity: bookEntity,),
      ],
    );
  }
}
