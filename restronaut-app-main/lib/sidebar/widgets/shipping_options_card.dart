import 'package:flutter/material.dart';
import 'package:hyperce/constants/app_colors.dart';
import 'package:hyperce/utils/extensions/num_extensions.dart';

class LabeledRadioButton extends StatelessWidget {
  final String label;
  final String value;
  final String? groupValue;
  final void Function(String?)? onChanged;
  final bool disabled;

  const LabeledRadioButton({
    super.key,
    required this.label,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.disabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: disabled ? null : () => onChanged?.call(value),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
              border: Border.all(
                color: AppColors.mainColor,
              )),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 9.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Radio(
                  activeColor: AppColors.mainColor,
                  value: value,
                  groupValue: groupValue,
                  onChanged: disabled ? null : onChanged,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      label,
                      style: TextStyle(
                        color: Color.fromARGB(255, 38, 38, 38),
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                    4.verticalSpacer,
                    Text(
                      "1015 Figueroa Terrace Apt 21, Los Angeles, CA 90",
                      style: TextStyle(
                        color: Color.fromARGB(255, 74, 72, 72),
                        fontWeight: FontWeight.w500,
                        fontSize: 11,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
