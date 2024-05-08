import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hyperce/utils/extensions/num_extensions.dart';
import 'package:hyperce/utils/images.dart';

class Scan extends StatelessWidget {
  const Scan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            AppImages.backGroundImage.path,
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              130.h.verticalSpacer,
              Text(
                '250',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.w600),
              ),
              Text(
                'Points Redeemed',
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
              ),
              10.verticalSpacer,
              Center(child: Image.asset(AppImages.barCode.path)),
              16.h.verticalSpacer,
              Text(
                'Member since 2024',
                style: TextStyle(fontSize: 14),
              ),
              10.h.verticalSpacer,
              Text(
                'Scan to earn points',
                style: TextStyle(fontSize: 18),
              ),
              10.verticalSpacer,
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'You can scan your code at the\n',
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                    TextSpan(
                      text: 'register to pay and to earn\n',
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                    TextSpan(
                      text: 'points toward your next reward',
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  ],
                ),
              ),
              100.h.verticalSpacer,
              ElevatedButton(onPressed: () {}, child: Text('Add funds'))
            ],
          ),
        ],
      ),
    );
  }
}
