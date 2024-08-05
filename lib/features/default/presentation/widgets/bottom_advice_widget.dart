import 'package:disneycodechallenge_francisco_gomez/core/constants/colors.dart';
import 'package:disneycodechallenge_francisco_gomez/core/constants/strings.dart';
import 'package:flutter/material.dart';

class BottomAdviceWidget extends StatelessWidget {
  const BottomAdviceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: 92,
      color: AppColors.headerColor,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                AppStrings.bottomAdviceTitle,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(
                width: size.width * 0.6,
                child: const Text(
                  AppStrings.bottomAdviceText,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w400),
                ),
              ),
            ],
          ),
          const Spacer(),
          Icon(
            Icons.cancel,
            color: Colors.white,
            size: size.width * 0.075,
          )
        ],
      ),
    );
  }
}
