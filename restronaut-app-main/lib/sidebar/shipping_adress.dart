import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hyperce/sidebar/widgets/shipping_options_card.dart';
import 'package:hyperce/utils/extensions/num_extensions.dart';
import 'package:hyperce/utils/images.dart';

class ShippingAddress extends StatefulWidget {
  const ShippingAddress({super.key});

  @override
  State<ShippingAddress> createState() => _ShippingAddressState();
}

class _ShippingAddressState extends State<ShippingAddress> {
  String? selectedOption = 'losangeles';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 40.0,
            horizontal: 16,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Image.asset(
                          AppImages.backIcon.path,
                        )),
                    60.horizontalSpacer,
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "My Addresses",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
                22.h.verticalSpacer,
                Text(
                  "Add Your Location",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                ),
                10.h.verticalSpacer,
                Text(
                  "Choose your location to get started.",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w300,
                    fontSize: 15,
                  ),
                ),
                16.h.verticalSpacer,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 4,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: CupertinoTextField(
                          padding: EdgeInsets.symmetric(vertical: 14.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          placeholder: "San Diego, CA",
                          placeholderStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                          prefix: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 5.0),
                            child: Icon(Icons.location_on),
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          "Save",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                18.h.verticalSpacer,
                Text(
                  "Saved Location",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                18.h.verticalSpacer,
                LabeledRadioButton(
                  label: 'Los Angeles',
                  value: 'losangeles',
                  groupValue: selectedOption,
                  onChanged: (String? value) {
                    setState(() {
                      selectedOption = value!;
                    });
                  },
                ),
                8.verticalSpacer,
                LabeledRadioButton(
                  label: 'New York',
                  value: 'newyork',
                  groupValue: selectedOption,
                  onChanged: (String? value) {
                    setState(() {
                      selectedOption = value!;
                    });
                  },
                ),
                8.verticalSpacer,
                LabeledRadioButton(
                  label: 'Virginia',
                  value: 'virginia',
                  groupValue: selectedOption,
                  onChanged: (String? value) {
                    setState(() {
                      selectedOption = value!;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
