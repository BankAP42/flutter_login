import 'package:flutter/material.dart';
import 'package:flutter_login/widget/button.dart';

import '../utils/colors.dart';
import 'login_screen.dart';

class TermAndCondition extends StatelessWidget {
  const TermAndCondition({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: primaryBlue,
        ),
        title: const Text('เงื่อนไขการใช้งาน'),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
          ),
        ),
      ),
      body: Column(
        children: [
          ElevatedButton(
            child: const Text('Submit', style: TextStyle(color: Colors.blue)),
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
              onPrimary: Colors.blue, // สีขอบเมื่อถูกกด
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0), // ปรับขอบ
                side: BorderSide(color: Colors.blue), // สีขอบ
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustombuttonTwotarget(
                  lbBtn: 'ปฎิเสธ',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()),
                    );
                  },
                  primarylcolor: bgColor,
                  lbBtn2: 'ยอมรับ',
                  onPressed2: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()),
                    );
                  },
                  primarylcolor2: primaryBlue)
            ],
          )
        ],
      ),
    );
  }
}
