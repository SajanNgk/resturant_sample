import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OurElevatedButton extends StatelessWidget {
  final String title;
  final Color color;
  final Color textColor;
  final Function function;
  const OurElevatedButton(
      {Key? key,
      required this.title,
      required this.function,
      required this.color,
      required this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(
        ScreenUtil().setSp(10),
      ),
      child: SizedBox(
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              color,
            ),
          ),
          onPressed: () {
            function();
          },
          child: Text(
            title,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold,
              fontSize: ScreenUtil().setSp(
                20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
