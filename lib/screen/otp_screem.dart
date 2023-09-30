import 'package:flutter/material.dart';
import 'package:flutter_login/widget/button.dart';

import '../utils/colors.dart';
import 'otp_ verification_screen.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'OTP จะถูกส้งไปที่โทรศัพท์',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              '082-xxxx-8998',
              style: TextStyle(fontSize: 20, color: primaryBlue),
            ),
            SizedBox(height: 50),
            CustomButton(
                lbBtn: 'ขอรหัส OTP',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const OtpVerificationScreen()),
                  );
                }),
            SizedBox(height: 20),
            Text(
              'กรณีเบอร์ไม่ถูกต้องกรุณาติต่อเบอร์ 02-XXX-XXXXX',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
