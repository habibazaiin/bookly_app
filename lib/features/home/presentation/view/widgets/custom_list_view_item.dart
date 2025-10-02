import 'package:flutter/material.dart';

class CustomListViewItem extends StatelessWidget {
  const CustomListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .27,
      child: AspectRatio(
        aspectRatio: 2.5 / 4,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.red,
            image: DecorationImage(
              image: NetworkImage(
                'https://th.bing.com/th/id/OSK.56824888c78d672aece69be7be5d66a2?w=160&h=238&c=7&rs=1&qlt=80&o=6&dpr=1.3&pid=SANGAM',
              ),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
