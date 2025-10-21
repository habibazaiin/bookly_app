import 'package:flutter/material.dart';

class CustomBookImageLoadingIndicator extends StatelessWidget {
  const CustomBookImageLoadingIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: AspectRatio(
        aspectRatio: 2.5 / 4,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}