import 'package:flutter/material.dart';
import 'package:hyperce/utils/extensions/num_extensions.dart';
import 'package:hyperce/utils/images.dart';

class PaymentCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // Adjust height according to your preference
      width: double.infinity, // Take full width of the screen
      // Add some margin for spacing
      decoration: BoxDecoration(
        color: Colors.blueGrey[800], // Set background color
        borderRadius: BorderRadius.circular(16), // Add rounded corners
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3), // Add shadow
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            10.verticalSpacer,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(AppImages.visaIcon.path),
                Image.asset(AppImages.cardIcon.path),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Card Number',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 4),
            Text(
              '1234 5678 9012 3456',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Card Holder ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Matilda Brown',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Expires',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      '12/23',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            20.verticalSpacer,
          ],
        ),
      ),
    );
  }
}
