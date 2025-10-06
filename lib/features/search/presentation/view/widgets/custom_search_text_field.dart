import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search',
        suffixIcon: Opacity(
          opacity: 0.8,
          child: Icon(FontAwesomeIcons.magnifyingGlass, size: 20),
        ),
        enabledBorder: buildWhiteOutlineBorder(),
        focusedBorder: buildWhiteOutlineBorder(),
      ),
    );
  }

  OutlineInputBorder buildWhiteOutlineBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white),
      borderRadius: BorderRadius.circular(12),
    );
  }
}
