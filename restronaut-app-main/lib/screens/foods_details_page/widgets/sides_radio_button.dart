import 'package:flutter/material.dart';
import 'package:hyperce/constants/app_colors.dart';
import 'package:hyperce/utils/extensions/num_extensions.dart';

class FoodSidesRadioButton extends StatelessWidget {
  final String label;
  final String price;
  final String image;
  final String value;
  final String? groupValue;
  final void Function(String?)? onChanged;
  final bool disabled;

  const FoodSidesRadioButton({
    super.key,
    required this.label,
    required this.price,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.disabled = false,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: disabled ? null : () => onChanged?.call(value),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        decoration: BoxDecoration(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(image),
                11.horizontalSpacer,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      label,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      price,
                      style: TextStyle(
                        color: AppColors.lineDivider,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Radio(
              activeColor: AppColors.mainColor,
              value: value,
              groupValue: groupValue,
              onChanged: disabled ? null : onChanged,
            ),
          ],
        ),
      ),
    );
  }
}
