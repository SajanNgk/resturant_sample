import 'package:hyperce/screens/main/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../api/db/db_helper.dart';
import '../onboarding_screen/onboarding_screen.dart';

class OuterLayerScreen extends StatefulWidget {
  const OuterLayerScreen({Key? key}) : super(key: key);

  @override
  State<OuterLayerScreen> createState() => _OuterLayerScreenState();
}

class _OuterLayerScreenState extends State<OuterLayerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable:
            Hive.box<int>(DatabaseHelper.outerlayerDB).listenable(),
        builder: (context, Box<int> boxs, child) {
          int value = boxs.get("state", defaultValue: 0)!;
          print("===========");
          print(value);
          print("===========");
          return value == 0 ? OnBoardingScreen() : MainPage();
        },
      ),
    );
  }
}
