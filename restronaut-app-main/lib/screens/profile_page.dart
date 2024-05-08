import 'package:get/get.dart';
import 'package:hyperce/api/graphql_service.dart';
import 'package:hyperce/constants/app_constants.dart';
import 'package:hyperce/controllers/progress_controller.dart';
import 'package:hyperce/controllers/username_controller.dart';
import 'package:hyperce/screens/authentication/login_screen.dart';
import 'package:hyperce/screens/faq_page.dart';
import 'package:hyperce/screens/payment/payment_page.dart';
import 'package:hyperce/screens/settings/settings_page.dart';
import 'package:hyperce/screens/tracking_page.dart';
import 'package:hyperce/screens/wallet/wallet_page.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final GraphQLService qlService = GraphQLService();
  final userController = Get.put(UserController());

  @override
  void initState() {
    //to check user on init
    userController.checkLoggedInStatus();
    Get.put(ProgressController());

    super.initState();
  }

  // to show user logout dialog
  void showLogoutDialog(BuildContext context) {
    Get.defaultDialog(
      title: 'Logout',
      middleText: 'Are you sure you want to logout?',
      confirm: ElevatedButton(
        onPressed: () async {
          await qlService.userLogout(context);
          userController.isLoggedIn.value = false;

          Get.back();
        },
        child: Text('Logout'),
      ),
      cancel: ElevatedButton(
        onPressed: () {
          Get.back(); // Close the dialog
        },
        child: Text('Cancel'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF9F9F9),
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: Padding(
            padding:
                EdgeInsets.only(left: 16.0, right: 16.0, top: kToolbarHeight),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:

                      // User is logged in, display the Avatar
                      InkWell(
                    child: Obx(() {
                      if (userController.isLoggedIn.value) {
                        return CircleAvatar(
                          maxRadius: 48,
                          backgroundImage: AssetImage('assets/background.jpg'),
                        );
                      } else {
                        // User is not logged in, display guest icon
                        return Icon(
                          Icons.account_circle,
                          size: 96,
                          color: Colors.grey,
                        );
                      }
                    }),
                    onTap: () {
                      if (userController.isLoggedIn.value) {
                        showLogoutDialog(context);
                      } else {
                        Get.to(LoginScreen());
                      }
                    },
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        if (userController.isLoggedIn.value) {
                          showLogoutDialog(context);
                        } else {
                          Get.to(LoginScreen());
                        }
                      },
                      //UI part update for user login with check
                      child: Obx(() {
                        print("Inside obx " + userController.username.value);
                        print("Is user logged in? " +
                            userController.isLoggedIn.value.toString());

                        if (userController.isLoggedIn.value) {
                          return Text(
                            'Welcome ${userController.username.value}',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          );
                        } else {
                          return Text(
                            "Welcome, Guest!",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          );
                        }
                      }),
                    )),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 16.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8),
                          bottomLeft: Radius.circular(8),
                          bottomRight: Radius.circular(8)),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: transparentYellow,
                            blurRadius: 4,
                            spreadRadius: 1,
                            offset: Offset(0, 1))
                      ]),
                  height: 150,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            IconButton(
                              icon: Image.asset('assets/icons/wallet.png'),
                              onPressed: () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (_) => WalletPage())),
                            ),
                            Text(
                              'Wallet',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            IconButton(
                              icon: Image.asset('assets/icons/truck.png'),
                              onPressed: () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (_) => TrackingPage())),
                            ),
                            Text(
                              'Shipped',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            IconButton(
                              icon: Image.asset('assets/icons/card.png'),
                              onPressed: () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (_) => PaymentPage())),
                            ),
                            Text(
                              'Payment',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            IconButton(
                              icon: Image.asset('assets/icons/contact_us.png'),
                              onPressed: () {},
                            ),
                            Text(
                              'Support',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                ListTile(
                  title: Text('Settings'),
                  subtitle: Text('Privacy and others'),
                  leading: Image.asset(
                    'assets/icons/settings_icon.png',
                    fit: BoxFit.scaleDown,
                    width: 30,
                    height: 30,
                  ),
                  trailing: Icon(Icons.chevron_right, color: yellow),
                  onTap: () => Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => SettingsPage())),
                ),
                Divider(),
                ListTile(
                  title: Text('Help & Support'),
                  subtitle: Text('Help center and legal support'),
                  leading: Image.asset('assets/icons/support.png'),
                  trailing: Icon(
                    Icons.chevron_right,
                    color: yellow,
                  ),
                ),
                Divider(),
                ListTile(
                  title: Text('FAQ'),
                  subtitle: Text('Questions and Answer'),
                  leading: Image.asset('assets/icons/faq.png'),
                  trailing: Icon(Icons.chevron_right, color: yellow),
                  onTap: () => Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => FaqPage())),
                ),
                Divider(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
