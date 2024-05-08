import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../api/db/db_helper.dart';
import 'login_screen.dart';

class OurAuthCheckScreen extends StatefulWidget {
  const OurAuthCheckScreen({super.key});

  @override
  State<OurAuthCheckScreen> createState() => _OurAuthCheckScreenState();
}

class _OurAuthCheckScreenState extends State<OurAuthCheckScreen> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable:
          Hive.box<String>(DatabaseHelper.authTokenDB).listenable(),
      builder: (context, Box<String> boxs, child) {
        String value = boxs.get("state", defaultValue: "")!;
        print("===========");
        print(value);
        print("===========");
        return value == "" ? LoginScreen() : Text("ss");
      },
    );
  }
}
