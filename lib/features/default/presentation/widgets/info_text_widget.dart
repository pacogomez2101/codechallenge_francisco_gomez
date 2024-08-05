import 'package:disneycodechallenge_francisco_gomez/core/constants/colors.dart';
import 'package:disneycodechallenge_francisco_gomez/core/constants/strings.dart';
import 'package:flutter/material.dart';

class InfoTextWidget extends StatelessWidget {
  const InfoTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(left: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.info,
            size: 14,
          ),
          const SizedBox(width: 6),
          SizedBox(
            width: size.width * 0.86,
            child: const Text(
              AppStrings.adviceText,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: AppColors.headerColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
