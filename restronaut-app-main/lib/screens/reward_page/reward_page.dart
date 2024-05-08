import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hyperce/constants/app_colors.dart';
import 'package:hyperce/screens/reward_page/widget/my_rewards_card.dart';
import 'package:hyperce/utils/extensions/num_extensions.dart';
import 'package:hyperce/utils/images.dart';
import 'package:hyperce/utils/ui_helper.dart';

class RewardsPage extends StatefulWidget {
  const RewardsPage({super.key});

  @override
  State<RewardsPage> createState() => _RewardsPageState();
}

class _RewardsPageState extends State<RewardsPage>
    with TickerProviderStateMixin {
  bool isUploadEmpty = false;
  final tabs = ['Redeem', 'My Rewards', 'My status', 'Upload'];
  late final TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        automaticallyImplyLeading: false,
        toolbarHeight: 70,
        title: TabBar(
          labelColor: Colors.black,
          indicatorColor: Colors.black,
          controller: _tabController,
          tabs: tabs
              .map(
                (e) => Tab(
                  child: Text(
                    e,
                    style: TextStyle(fontSize: 9),
                  ),
                ),
              )
              .toList(),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          _buildRedeemPage(),
          _buildMyRewardsPage(),
          _buildMyStatusPage(),
          _buildUploadPage(),
        ],
      ),
    );
  }

  Widget _buildMyRewardsPage() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: ListView(
        children: [
          20.verticalSpacer,
          RewardCard(),
          16.verticalSpace,
          RewardCard(),
          200.verticalSpacer,
          Container(
              height: 200, child: SvgPicture.asset(AppImages.noReward.path)),
          20.verticalSpacer,
          Text(
            "You don't have any",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w500,
            ),
          ),
          10.verticalSpacer,
          Text(
            "rewards left",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w500,
            ),
          ),
          20.verticalSpacer,
          Text("..."),
        ],
      ),
    );
  }

  Widget _buildRedeemPage() {
    return Container(
      child: ListView(
        children: [
          30.verticalSpacer,
          Row(
            children: [
              70.horizontalSpacer,
              Image.asset(AppImages.picadillyPlusLogo.path),
              30.horizontalSpacer,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Piccadilly Plus',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'VIP Member',
                    style: TextStyle(
                      fontSize: 8,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    "750",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text('Available Points'),
                ],
              )
            ],
          ),
          24.verticalSpacer,
          Container(
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                20.horizontalSpacer,
                _buildRedeemCard(),
                20.horizontalSpacer,
                _buildRedeemCard(),
                20.horizontalSpacer,
                _buildRedeemCard(),
                20.horizontalSpacer,
                _buildRedeemCard(),
                20.horizontalSpacer,
                ClipRRect(
                  borderRadius: BorderRadius.circular(15), // Image border
                  child: SizedBox.fromSize(
                    child: Image.asset(AppImages.startBucksCoffee.path,
                        fit: BoxFit.cover),
                  ),
                ),
                20.horizontalSpacer,
                ClipRRect(
                  borderRadius: BorderRadius.circular(15), // Image border
                  child: SizedBox.fromSize(
                    child: Image.asset(AppImages.startBucksCoffee.path,
                        fit: BoxFit.cover),
                  ),
                ),
                20.horizontalSpacer,
                ClipRRect(
                  borderRadius: BorderRadius.circular(15), // Image border
                  child: SizedBox.fromSize(
                    child: Image.asset(AppImages.startBucksCoffee.path,
                        fit: BoxFit.cover),
                  ),
                ),
                20.horizontalSpacer,
                ClipRRect(
                  borderRadius: BorderRadius.circular(15), // Image border
                  child: SizedBox.fromSize(
                    child: Image.asset(AppImages.startBucksCoffee.path,
                        fit: BoxFit.cover),
                  ),
                ),
              ],
            ),
          ),
          16.verticalSpacer,
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('200-300 points'),
                8.verticalSpacer,
                GridView.builder(
                  itemCount: 5,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 1.1,
                    crossAxisCount: 2,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 12.0,
                  ),
                  itemBuilder: (context, index) {
                    return _buildRewardFoodContainer(context);
                  },
                ),
              ],
            ),
          ),

          //   ListView.builder(itemBuilder:
          // (){

          // }
          //    Image.asset(AppImages.startBucksCoffee.path))
          // SingleChildScrollView(
          //   scrollDirection: Axis.horizontal,
          //   child: Row(
          //     children: [
          //       Image.asset(AppImages.startBucksCoffee.path),
          //     ],
          //   ),
          // ),

          // GridView.builder(
          //   itemCount: 5,
          //   shrinkWrap: true,
          //   physics: const NeverScrollableScrollPhysics(),
          //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //     childAspectRatio: 1.4,
          //     crossAxisCount: 2,
          //     crossAxisSpacing: 8.0,
          //     mainAxisSpacing: 12.0,
          //   ),
          //   itemBuilder: (context, index) {
          //     return Image.asset(AppImages.startBucksCoffee.path);
          //   },
          // ),
        ],
      ),
    );
  }

  Widget _buildMyStatusPage() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: ListView(
        children: [
          40.verticalSpacer,
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white),
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    64.verticalSpacer,
                    Text('Piccadilly Plus'),
                    8.verticalSpacer,
                    Text(
                      'VIP member',
                      style: TextStyle(
                          color: AppColors.appTextSecondaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                    ),
                    8.verticalSpacer,
                    Text('Valid Until  1/1/25'),
                    8.verticalSpacer,
                    Text(
                      'To Achieve Silver Status',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    8.verticalSpacer,
                    Text(
                      'Earn 1000 more points by the end of this year',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    8.verticalSpacer,
                    Container(
                      width: 269,
                      padding:
                          EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                      decoration: BoxDecoration(
                          color: AppColors.grey,
                          border: Border.all(color: AppColors.lineDivider),
                          borderRadius: BorderRadius.circular(16)),
                      child: Text('0 points'),
                    ),
                    8.verticalSpacer,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          '1000 points',
                          style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    40.verticalSpacer,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'View benefits',
                          style: TextStyle(
                              color: AppColors.appTextSecondaryColor,
                              fontSize: 10,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          'View 2026 status',
                          style: TextStyle(
                              color: AppColors.appTextSecondaryColor,
                              fontSize: 10,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    23.verticalSpacer,
                  ],
                ),
              ),
              Positioned(
                top: -35,
                left: 0,
                right: 0,
                child: Center(
                  child: Container(
                    width: 89,
                    height: 89,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Container(
                      width: 73,
                      height: 73,
                      decoration: BoxDecoration(
                        color: AppColors.lineDivider,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Image.asset(
                          AppImages.picadillyPLogo.path,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          300.verticalSpacer,
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: AppColors.lineDivider,
                )),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 11),
                  decoration: BoxDecoration(color: AppColors.yellowColor),
                  child: Row(
                    children: [
                      10.horizontalSpacer,
                      Container(
                        margin: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.white),
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(AppImages.tier1Logi.path),
                      ),
                      16.horizontalSpacer,
                      Text(
                        "Tier 2",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      )
                    ],
                  ),
                ),
                25.verticalSpacer,
                Row(
                  children: [
                    40.horizontalSpacer,
                    Image.asset(AppImages.picadillyPlusTrophy.path),
                    45.horizontalSpace,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Picadilly Plus",
                          style: TextStyle(fontSize: 12),
                        ),
                        Text("Vip Member"),
                        Text(
                          "750",
                          style: TextStyle(fontSize: 40, color: Colors.black),
                        ),
                        10.verticalSpacer,
                        Text("Available points"),
                      ],
                    )
                  ],
                ),
                12.verticalSpacer,
                UiHelper.horizontalDivider(
                    color: AppColors.lineDivider, thickness: 1, endIndent: 1),
                16.verticalSpacer,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Container(
                          child: Image.asset(AppImages.greenTick.path),
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.green, shape: BoxShape.circle),
                        ),
                        5.verticalSpacer,
                        Text(
                          '750 points',
                          style: TextStyle(fontSize: 10, color: Colors.black),
                        ),
                        5.verticalSpacer,
                        Text(
                          "Total Earned",
                          style: TextStyle(fontSize: 12, color: Colors.black),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          child: Image.asset(AppImages.blueTick.path),
                          decoration: BoxDecoration(
                              color: Colors.blue, shape: BoxShape.circle),
                        ),
                        5.verticalSpacer,
                        Text(
                          '750 points',
                          style: TextStyle(fontSize: 10, color: Colors.black),
                        ),
                        5.verticalSpacer,
                        Text(
                          "Total Redeemed",
                          style: TextStyle(fontSize: 12, color: Colors.black),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          child: Image.asset(AppImages.redTick.path),
                          decoration: BoxDecoration(
                              color: Colors.red, shape: BoxShape.circle),
                        ),
                        5.verticalSpacer,
                        Text(
                          '750 points',
                          style: TextStyle(fontSize: 10, color: Colors.black),
                        ),
                        5.verticalSpacer,
                        Text(
                          "Piccadilly pay\npoints earned",
                          style: TextStyle(fontSize: 12, color: Colors.black),
                        ),
                      ],
                    )
                  ],
                ),
                45.verticalSpacer,
              ],
            ),
          ),
          20.verticalSpacer,
          _buildRewardFoods()
        ],
      ),
    );
  }

  Widget _buildRewardFoods() {
    return Column(
      children: [
        GridView.builder(
          itemCount: 5,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 1.2,
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 12.0,
          ),
          itemBuilder: (context, index) {
            return _buildRewardFoodContainer(context);
          },
        ),
      ],
    );
  }

  Widget _buildRewardFoodContainer(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showCustomDialog(context);
        //  _showDialog(context);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.lineDivider),
        ),
        child: Column(
          children: [
            20.verticalSpacer,
            Image.asset(AppImages.burger.path),
            Text('Burger'),
            5.verticalSpacer,
            Text('200 points'),
            20.verticalSpacer,
          ],
        ),
      ),
    );
  }

  Widget _buildUploadPage() {
    return ListView(children: [
      Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            20.verticalSpacer,
            Text(
              'Missing Piccadilly transaction points',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            16.verticalSpacer,
            Text(
              "Enter the transaction ID or Survey Code from your receipt. You have 48 hours from the purchase date to collect the missing points. See terms and conditions for more information",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            24.verticalSpacer,
            Center(child: Image.asset(AppImages.welcomeToChickFillA.path)),
            20.verticalSpacer,
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Resturant Number',
                fillColor: Colors.white,
              ),
            ),
            8.verticalSpacer,
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Date',
                fillColor: Colors.white,
              ),
            ),
            8.verticalSpacer,
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Order Number',
                fillColor: Colors.white,
              ),
            ),
            8.verticalSpacer,
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Order Total',
                fillColor: Colors.white,
              ),
            ),
            24.verticalSpacer,
            Container(
                width: 350,
                child: ElevatedButton(
                    onPressed: () {}, child: Text('Submit Request'))),
            20.verticalSpacer,
          ],
        ),
      ),
      isUploadEmpty
          ? Stack(
              children: [
                Center(
                  child: Image.asset(
                    AppImages.backGroundImage.path,
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.cover,
                    // height: height / 1.25,
                    // width: width / 0.9,
                  ),
                ),
                50.verticalSpacer,
                Container(
                  child: Column(
                    children: [
                      Center(child: Image.asset(AppImages.sorryImage.path)),
                      20.verticalSpacer,
                      Text(
                        'Oops!! No items found.',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w500),
                      ),
                      10.verticalSpacer,
                      Text(
                        ' You can try checking later',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              ],
            )
          : Container(),
    ]);
  }

  Widget _buildRedeemCard() {
    return Stack(
      children: [
        Container(
          height: 100,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15), // Image border
            child: SizedBox.fromSize(
              child: Image.asset(AppImages.startBucksCoffee.path,
                  fit: BoxFit.cover),
            ),
          ),
        ),
        Positioned(
          left: 80,
          top: 10,
          child: Column(
            children: [
              Text(
                "Iced Latte",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
              Text(
                "500 points",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
              5.verticalSpacer,
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding:
                        const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                  ),
                  onPressed: () {},
                  child: Text(
                    'Redeem',
                    style: TextStyle(color: Colors.black, fontSize: 12),
                  ))
            ],
          ),
        )
      ],
    );
  }

  void _showCustomDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        final screenHeight = MediaQuery.of(context).size.height;
        return Dialog(
          insetPadding: EdgeInsets.zero,
          backgroundColor: Colors.transparent,
          child: Stack(
            children: [
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: screenHeight * 0.5, // Take up 30% of the height
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(AppImages.burger.path),
                        Text(
                          'Frosted Lemonade',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w600),
                        ),
                        13.verticalSpacer,
                        Text('200 points, valid until May 9, 2024'),
                        13.verticalSpacer,
                        Container(
                          width: 358,
                          child: ElevatedButton(
                              onPressed: () {},
                              // style: ElevatedButton.styleFrom(
                              //   padding: EdgeInsets.symmetric(
                              //     horizontal: 123,
                              //   ),
                              // ),
                              child: Text('Redeem Item')),
                        ),
                        7.verticalSpacer,
                        Container(
                          width: 358,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  side: BorderSide(
                                      color:
                                          AppColors.mainColor), // Border color
                                ),
                                backgroundColor: AppColors.backgroundColor),
                            onPressed: () {},
                            // style: ElevatedButton.styleFrom(
                            //   padding: EdgeInsets.symmetric(
                            //     horizontal: 123,
                            //   ),
                            // ),
                            child: Text(
                              'Gift to a friend',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                        7.verticalSpacer,
                        Container(
                          width: 358,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  side: BorderSide(
                                      color:
                                          AppColors.mainColor), // Border color
                                ),
                                backgroundColor: AppColors.lightGrey),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            // style: ElevatedButton.styleFrom(
                            //   padding: EdgeInsets.symmetric(
                            //     horizontal: 123,
                            //   ),
                            // ),
                            child: Text(
                              'Cancel',
                              style: TextStyle(color: AppColors.mainColor),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
