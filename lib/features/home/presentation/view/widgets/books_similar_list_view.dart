import 'package:bookly_app/features/home/presentation/view/widgets/custom_book_image.dart';
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
            child: CustomBookImage(
              imageURL:
                  'https://th.bing.com/th/id/OSK.56824888c78d672aece69be7be5d66a2?w=160&h=238&c=7&rs=1&qlt=80&o=6&dpr=1.3&pid=SANGAM',
            ),
          );
        },
      ),
    );
  }
}
