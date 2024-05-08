import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hyperce/constants/app_colors.dart';
import 'package:hyperce/utils/extensions/num_extensions.dart';
import 'package:hyperce/utils/images.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late bool _passwordVisible;
  @override
  void initState() {
    _passwordVisible = false;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        automaticallyImplyLeading: false,
        title: Column(
          children: [
            Row(
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Image.asset(AppImages.backIcon.path)),
                70.horizontalSpace,
                Text(
                  'My Account',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              18.verticalSpacer,
              Text('Full Name'),
              8.verticalSpacer,
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Albert Stevano Bajefski',
                ),
              ),
              12.verticalSpacer,
              Text('Date of Birth'),
              8.verticalSpacer,
              TextFormField(
                decoration: InputDecoration(
                  hintText: '19/06/1999',
                ),
              ),
              12.verticalSpacer,
              Text('Gender'),
              8.verticalSpacer,
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Male',
                ),
              ),
              12.verticalSpacer,
              Text('Phone'),
              8.verticalSpacer,
              TextFormField(
                decoration: InputDecoration(
                  hintText: '+1 325-433-7656',
                ),
              ),
              12.verticalSpacer,
              Text('Email'),
              8.verticalSpacer,
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'albertstevano@gmail.com',
                ),
              ),
              12.verticalSpacer,
              Text('Old Password'),
              8.verticalSpacer,
              TextFormField(
                obscureText: !_passwordVisible,
                decoration: InputDecoration(hintText: '********'),
              ),
              12.verticalSpacer,
              Text('New Password'),
              8.verticalSpacer,
              TextFormField(
                obscureText: !_passwordVisible,
                decoration: InputDecoration(hintText: '********'),
              ),
              12.verticalSpacer,
              Text('Enter Password again'),
              8.verticalSpacer,
              TextFormField(
                obscureText: !_passwordVisible,
                decoration: InputDecoration(hintText: '********'),
              ),
              40.verticalSpacer,
              Container(
                width: 327,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Save',
                  ),
                ),
              ),
              20.verticalSpacer,
            ],
          ),
        ),
      ),
    );
  }

  // ignore: unused_element
  Widget _builUserProfileDetails() {
    return Container(
      child: Row(
        children: [
          Image.asset(AppImages.userIcon.path),
          13.w.horizontalSpacer,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Matilda Brown',
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: "ED Garamond",
                    color: Colors.black),
              ),
              Text('matildabrown@gmail.com',
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: "ED Garamond",
                      color: Colors.black)),
            ],
          )
        ],
      ),
    );
  }

  Widget customListTile({
    required String title,
    required String subtitle,
    required Function onTap,
  }) {
    return ListTile(
        contentPadding: EdgeInsets.all(0),
        title: Text(
          title,
          style: TextStyle(
              color: Colors.black, fontSize: 17, fontFamily: "EB Garamond"),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(
              fontSize: 12,
              fontFamily: "ED Garamond",
              color: Color.fromARGB(255, 19, 19, 19)),
        ),
        // leading: Icon(leadingIcon),
        trailing: Icon(
          Icons.arrow_forward_ios,
          size: 20,
        ),
        onTap: () {
          onTap();
        });
  }

  Widget _buildMyOrderFoodCard() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.asset(AppImages.burger.path),
        Column(
          children: [
            Text("Burger with meet"),
            Text("\$ 12230"),
          ],
        ),
        Text('14 items'),
      ],
    );
  }
}
