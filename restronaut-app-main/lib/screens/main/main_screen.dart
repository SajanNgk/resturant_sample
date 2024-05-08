import 'package:hyperce/constants/app_colors.dart';
import 'package:hyperce/screens/GiftPage.dart';
import 'package:hyperce/screens/forgot_password/forgot_password.dart';
import 'package:hyperce/screens/home_page/home_page.dart';
import 'package:hyperce/screens/menu_page/menu_page.dart';
import 'package:hyperce/screens/checkout/check_out_page.dart';
import 'package:flutter/material.dart';
import 'package:hyperce/screens/reward_page/reward_page.dart';
import 'package:hyperce/screens/scan_page/scan_page.dart';
import 'package:hyperce/sidebar/profile.dart';
import 'package:hyperce/utils/images.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with TickerProviderStateMixin<MainPage> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> screens = [
    // HomeScreen(),
    HomePage(),
    MenuPage(),
    Scan(),
    GiftPage(),
    RewardsPage(),

    // CategoriesPage(),
    //CategoryListPage(),
    Profile(),
    ForgotPassword(),
    CheckOutPage(),

    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_selectedIndex],
      bottomNavigationBar: Container(
        height: 63,
        child: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Container(
                child: Image.asset(
                  AppImages.home.path,
                  width: 24,
                  height: 30,
                ),
              ),
              label: 'home',
            ),
            BottomNavigationBarItem(
              icon: Container(
                child: Image.asset(
                  AppImages.menuIcon.path,
                  width: 24,
                  height: 30,
                ),
              ),
              label: 'menu',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                AppImages.scanIcon.path,
                width: 24,
                height: 30,
              ),
              label: 'scan',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                AppImages.giftIcon.path,
                width: 24,
                height: 30,
              ),
              label: 'gift',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                AppImages.rewardsIcon.path,
                width: 24,
                height: 30,
              ),
              label: 'rewards',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: AppColors.mainColor,
          unselectedItemColor: AppColors.mainColor,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
