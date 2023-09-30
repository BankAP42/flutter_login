import 'package:flutter/material.dart';
import 'package:flutter_login/screen/term_con_screen.dart';
import 'package:flutter_login/widget/button.dart';

class SelectLanguageScreen extends StatelessWidget {
  const SelectLanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Row(
              children: [
                Expanded(
                  child: Text(
                    'ยินดีตอนรับ',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const Row(
              children: [
                Expanded(
                  child: Text(
                    'กรุณาเลือกภาษา',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 100),
            CustomButton(
                lbBtn: 'English',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TermAndCondition()),
                  );
                }),
            CustomButton(
                lbBtn: 'ไทย',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TermAndCondition()),
                  );
                })
          ],
        ),
      ),
    );
  }
}
