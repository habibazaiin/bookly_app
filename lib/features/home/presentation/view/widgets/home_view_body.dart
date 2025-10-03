import 'package:bookly_app/core/utils/assets.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/presentation/view/widgets/featured_list_view_item.dart';
import 'package:bookly_app/features/home/presentation/view/widgets/features_list_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bookly_app/features/home/presentation/view/widgets/custom_appbar.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(),
          FeaturedListView(),
          SizedBox(height: 50),
          Text('Best Seller', style: Styles.textStyle18),
          BestSellerListViewItem(),
        ],
      ),
    );
  }
}

class BestSellerListViewItem extends StatelessWidget {
  const BestSellerListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 130,
          child: AspectRatio(
            aspectRatio: 2.5 / 4,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                    'https://th.bing.com/th/id/OSK.56824888c78d672aece69be7be5d66a2?w=160&h=238&c=7&rs=1&qlt=80&o=6&dpr=1.3&pid=SANGAM',
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
