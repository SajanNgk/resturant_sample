import 'package:flutter/material.dart';
import 'package:hyperce/utils/extensions/num_extensions.dart';

class FilterButton extends StatelessWidget {
  final String? name;
  //final bool isPrefixIcon;
  final String buttonLabel = '';

  const FilterButton({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.grey, borderRadius: BorderRadius.circular(8)),
          height: 18,
          child: Row(
            children: [
              16.horizontalSpacer,
              Text(buttonLabel),
              16.horizontalSpacer,
            ],
          ),
        ),
        Text(name!),
      ],
    );
  }
}
