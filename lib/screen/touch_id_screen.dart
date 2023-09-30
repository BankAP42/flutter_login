import 'package:flutter/material.dart';
import 'package:flutter_login/widget/button.dart';

import '../utils/colors.dart';
import 'login_by_pin_screen.dart';

class TouchIdScreen extends StatelessWidget {
  const TouchIdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: primaryBlue,
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          const Row(
            children: [
              Text(
                'Touch ID',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Row(
            children: [
              Text('ตั้งค่าล็อคอินด้วยลายนิ้วมือ\nเพื่อการเข้าถึงที่เร็วขึ้น'),
            ],
          ),
          SizedBox(height: 70),
          Container(
            decoration: BoxDecoration(
                color: accentGrey.withOpacity(0.1), shape: BoxShape.circle),
            child: Icon(
              Icons.fingerprint,
              size: 100,
              color: primaryBlue,
            ),
          ),
          SizedBox(height: 80),
          CustomButton(lbBtn: 'ตั้งค่าลายนิ้วมือ', onPressed: () {}),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const LoginByPinScreen()),
              );
            },
            child: Text("ข้าม"),
          ),
        ]),
      ),
    );
  }
}
