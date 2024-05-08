import 'package:flutter/material.dart';
import 'package:hyperce/utils/extensions/num_extensions.dart';
import 'package:hyperce/utils/images.dart';

class CartCart extends StatefulWidget {
  const CartCart({super.key});

  @override
  State<CartCart> createState() => _CartCartState();
}

class _CartCartState extends State<CartCart> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
      ),
      child: Column(
        children: [
          13.verticalSpacer,
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Checkbox(
                      value: isChecked,
                      onChanged: (value) {
                        setState(() {
                          isChecked = value!;
                        });
                      },
                    ),
                    Image.asset(AppImages.burger.path),
                    16.horizontalSpacer,
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Chicken Burger'),
                            Text('\$12.5'),
                            Row(
                              children: [
                                Icon(Icons.add_circle),
                                5.horizontalSpacer,
                                Text('1'),
                                5.horizontalSpacer,
                                Icon(Icons.remove_circle),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                Image.asset(AppImages.tashIcon.path),
                12.horizontalSpacer
              ],
            ),
          ),
          13.verticalSpacer,
        ],
      ),
    );
  }
}
