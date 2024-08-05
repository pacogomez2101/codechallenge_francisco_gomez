import 'package:disneycodechallenge_francisco_gomez/core/constants/colors.dart';
import 'package:flutter/material.dart';

class CheckboxItemWidget extends StatelessWidget {
  const CheckboxItemWidget(this.name, this.isSelected, {super.key});

  final bool isSelected;
  final String name;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: 20,
      child: Row(
        children: [
          Container(
            alignment: Alignment.center,
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              border: isSelected
                  ? const Border()
                  : Border.all(color: AppColors.borderColor),
              color: isSelected ? AppColors.selectedColor : Colors.transparent,
            ),
            child: const Icon(Icons.check, color: Colors.white, size: 16),
          ),
          const SizedBox(width: 10),
          Text(
            name,
            style: const TextStyle(
              color: AppColors.headerColor,
              fontWeight: FontWeight.w400,
              fontSize: 16,
            ),
          )
        ],
      ),
    );
  }
}
