import 'package:disneycodechallenge_francisco_gomez/core/constants/colors.dart';
import 'package:disneycodechallenge_francisco_gomez/core/constants/strings.dart';
import 'package:flutter/material.dart';

class GenericButtonWidget extends StatelessWidget {
  const GenericButtonWidget(this.isEnabled, {super.key});

  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: isEnabled ? () {} : () {},
      child: Container(
        height: 44,
        width: size.width,
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: isEnabled ? AppColors.actionColor : AppColors.disabledColor,
          borderRadius: BorderRadius.circular(22),
        ),
        child: const Text(
          AppStrings.buttonText,
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.w800),
        ),
      ),
    );
  }
}
