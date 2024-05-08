import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hyperce/utils/extensions/num_extensions.dart';
import 'package:hyperce/utils/images.dart';

class Redeem extends StatefulWidget {
  const Redeem({super.key});

  @override
  State<Redeem> createState() => _RedeemState();
}

class _RedeemState extends State<Redeem> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            10.h.verticalSpacer,
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(AppImages.picadillyPlusLogo.path),
                  25.h.horizontalSpacer,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Piccadilly Plus",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      2.h.verticalSpacer,
                      Text(
                        "VIP Member",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                        ),
                      ),
                      2.h.verticalSpacer,
                      Text(
                        "750",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 35,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      // 2.h.verticalSpacer,
                      Text(
                        "Available Points",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            20.h.verticalSpacer,
            Container(
              height: 220,
              child: ListView.builder(
                itemCount: 4,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Stack(
                      children: [
                        Container(
                          height: width / 1.7,
                          width: width / 1.3,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              AppImages.startBucksCoffee.path,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 50,
                          right: 25,
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: Column(
                              children: [
                                Text(
                                  "Iced Latte",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                                5.h.verticalSpacer,
                                Text(
                                  "500 Points",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey,
                                    fontSize: 12,
                                  ),
                                ),
                                20.h.verticalSpacer,
                                MaterialButton(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  color: Colors.white,
                                  onPressed: () {},
                                  child: Text(
                                    "Redeem",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
            // 2.h.verticalSpacer,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Text(
                "2 (200-300 points)",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            12.h.verticalSpacer,
            Container(
              child: GridView.builder(
                  physics: BouncingScrollPhysics(
                    parent: NeverScrollableScrollPhysics(),
                  ),
                  shrinkWrap: true,
                  itemCount: 8,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 18,
                    crossAxisSpacing: 18,
                  ),
                  itemBuilder: (context, index) {
                    return Stack(
                      children: [
                        Container(
                          height: 300,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: const Color.fromARGB(255, 47, 47, 47)),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: Image.asset(
                              AppImages.lemonade.path,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 30,
                          right: 25,
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: Column(
                              children: [
                                Text(
                                  "Frosted Lemonade",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.black,
                                  ),
                                ),
                                4.h.verticalSpace,
                                Text(
                                  "500 points",
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
