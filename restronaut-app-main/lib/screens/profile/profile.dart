// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:hyperce/utils/extensions/num_extensions.dart';
// import 'package:hyperce/utils/images.dart';

// class Profile extends StatefulWidget {
//   const Profile({super.key});

//   @override
//   State<Profile> createState() => _ProfileState();
// }

// class _ProfileState extends State<Profile> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Container(
//           padding: EdgeInsets.symmetric(horizontal: 24),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               40.h.verticalSpacer,
//               Center(
//                 child: Text(
//                   'Profile settings',
//                   style: TextStyle(fontSize: 16),
//                 ),
//               ),
//               42.verticalSpacer,
//               Center(
//                 child: CircleAvatar(
//                   backgroundImage: AssetImage(AppImages.userProfile.path),
//                   radius: 40,
//                 ),
//               ),

//               28.verticalSpacer,

//               Text('Full Name'),
//               8.verticalSpacer,
//               TextFormField(
//                 decoration: InputDecoration(
//                   hintText: 'Albert Stevano Bajefski',
//                 ),
//               ),
//               12.verticalSpacer,
//               Text('Date of Birth'),
//               8.verticalSpacer,
//               TextFormField(
//                 decoration: InputDecoration(
//                   hintText: '19/06/1999',
//                 ),
//               ),
//               12.verticalSpacer,
//               Text('Gender'),
//               8.verticalSpacer,
//               TextFormField(
//                 decoration: InputDecoration(
//                   hintText: 'Male',
//                 ),
//               ),
//               12.verticalSpacer,
//               Text('Phone'),
//               8.verticalSpacer,
//               TextFormField(
//                 decoration: InputDecoration(
//                   hintText: '+1 325-433-7656',
//                 ),
//               ),
//               12.verticalSpacer,
//               Text('Email'),
//               8.verticalSpacer,
//               TextFormField(
//                 decoration: InputDecoration(
//                   hintText: 'albertstevano@gmail.com',
//                 ),
//               ),
//               36.verticalSpacer,
//               Container(
//                 width: 327,
//                 child: ElevatedButton(
//                   onPressed: () {},
//                   child: Text(
//                     'Save',
//                   ),
//                 ),
//               ),
//               100.verticalSpacer,
//               Row(
//                 children: [
//                   Text("order Id"),
//                   ElevatedButton(onPressed: () {}, child: Text('In delievery')),
//                 ],
//               ),
//               12.verticalSpacer,
//               Divider(),
//               _buildMyOrderFoodCard(),
//               Divider(),
//               24.verticalSpacer,
//               Text('Profile'),
//               8.verticalSpacer,
//               ListTile(
//                 leading: Icon(Icons.person), // Icon on the left
//                 title: Text('John Doe'), // Text in the middle
//                 trailing:
//                     Image.asset(AppImages.rightArrow.path), // Icon on the right
//               ),

//               // Text(
//               //   'My Account',
//               //   style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
//               // ),
//               // 20.h.verticalSpacer,
//               // _builUserProfileDetails(),
//               // 9.h.verticalSpacer,
//               // customListTile(
//               //     title: "My Orders",
//               //     subtitle: "Already Have 12 orders",
//               //     onTap: () {
//               //       Get.to(Order());
//               //     }),
//               // customListTile(
//               //   title: "Shipping address",
//               //   subtitle: "3 addresses",
//               //   onTap: () {},
//               // ),
//               // customListTile(
//               //     title: "Payment methods",
//               //     subtitle: "Visa **34",
//               //     onTap: () {
//               //       Get.to(PaymentOption());
//               //     }),
//               // customListTile(
//               //   title: "Promocodes",
//               //   subtitle: "You have special promo code",
//               //   onTap: () {},
//               // ),
//               // customListTile(
//               //   title: "My Reviews",
//               //   subtitle: "Reviews for 4 items",
//               //   onTap: () {},
//               // ),
//               // customListTile(
//               //     title: "Settings",
//               //     subtitle: 'Notifications, Password',
//               //     onTap: () {}),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   // ignore: unused_element
//   Widget _builUserProfileDetails() {
//     return Container(
//       child: Row(
//         children: [
//           Image.asset(AppImages.userIcon.path),
//           13.w.horizontalSpacer,
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'Matilda Brown',
//                 style: TextStyle(
//                     fontSize: 20,
//                     fontFamily: "ED Garamond",
//                     color: Colors.black),
//               ),
//               Text('matildabrown@gmail.com',
//                   style: TextStyle(
//                       fontSize: 14,
//                       fontFamily: "ED Garamond",
//                       color: Colors.black)),
//             ],
//           )
//         ],
//       ),
//     );
//   }

//   Widget customListTile({
//     required String title,
//     required String subtitle,
//     required Function onTap,
//   }) {
//     return ListTile(
//         contentPadding: EdgeInsets.all(0),
//         title: Text(
//           title,
//           style: TextStyle(
//               color: Colors.black, fontSize: 17, fontFamily: "EB Garamond"),
//         ),
//         subtitle: Text(
//           subtitle,
//           style: TextStyle(
//               fontSize: 12,
//               fontFamily: "ED Garamond",
//               color: Color.fromARGB(255, 19, 19, 19)),
//         ),
//         // leading: Icon(leadingIcon),
//         trailing: Icon(
//           Icons.arrow_forward_ios,
//           size: 20,
//         ),
//         onTap: () {
//           onTap();
//         });
//   }

//   Widget _buildMyOrderFoodCard() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: [
//         Image.asset(AppImages.burger.path),
//         Column(
//           children: [
//             Text("Burger with meet"),
//             Text("\$ 12230"),
//           ],
//         ),
//         Text('14 items'),
//       ],
//     );
//   }
// }
