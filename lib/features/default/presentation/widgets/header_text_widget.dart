import 'package:codechallenge_francisco_gomez/core/constants/colors.dart';
import 'package:flutter/material.dart';

class HeaderTextWidget extends StatelessWidget {
  const HeaderTextWidget(this.text, {super.key});

  final String text;
  // final GlobalKey key;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      key: key,
      width: size.width,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        text,
        style: TextStyle(
            color: AppColors.headerColor,
            fontSize: size.width * 0.045,
            fontWeight: FontWeight.w800),
      ),
    );
  }
}
