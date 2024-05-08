import 'package:flutter/material.dart';
import 'package:hyperce/sidebar/reward/myreward.dart';
import 'package:hyperce/sidebar/reward/mystatus.dart';
import 'package:hyperce/sidebar/reward/redeem.dart';
import 'package:hyperce/sidebar/reward/upload.dart';

class RewardPage extends StatefulWidget {
  const RewardPage({super.key});

  @override
  State<RewardPage> createState() => _RewardPageState();
}

class _RewardPageState extends State<RewardPage> with TickerProviderStateMixin {
  late TabController viewController;
  TextStyle tabStyle = TextStyle(
    color: Colors.black,
    fontSize: 12,
    overflow: TextOverflow.ellipsis,
    fontWeight: FontWeight.w800,
  );
  @override
  void initState() {
    viewController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Center(
                  child: Text(
                    "Rewards",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
              TabBar(
                dividerColor: Colors.red,
                indicatorColor: Colors.black,
                controller: viewController,
                tabs: [
                  Tab(child: Text("Redeem", style: tabStyle)),
                  Tab(child: Text("My Status", style: tabStyle)),
                  Tab(child: Text("My Rewards", style: tabStyle)),
                  Tab(child: Text("Upload", style: tabStyle)),
                ],
              ),
              // 10.h.verticalSpacer,
              Expanded(
                child: TabBarView(
                  physics: BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics(),
                  ),
                  controller: viewController,
                  children: [
                    Redeem(),
                    MyStatus(),
                    MyRewards(),
                    Upload(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
