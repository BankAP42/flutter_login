import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../widget/button.dart';
import '../widget/textfild.dart';
import 'otp_screem.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController userNameTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextfieldOutlined(
              label: "ชื่อผู้ใช้งาน",
              focus: false,
              controller: userNameTextController,
              keyboardType: TextInputType.emailAddress,
            ),
            TextfieldOutlined(
              isObscured: true,
              focus: false,
              label: "รหัสผ่าน",
              controller: passwordTextController,
              keyboardType: TextInputType.name,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(
                      value: isChecked,
                      onChanged: (value) {
                        setState(() {
                          isChecked = value!;
                        });
                      },
                    ),
                    const Text(
                      "บันทึกการเข้าสู่ระบบ",
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()),
                    );
                  },
                  child: Text(
                    "ลืมรหัสผ่าน?",
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
            CustomButton(
                lbBtn: "เข้าสู่ระบบ",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const OtpScreen()),
                  );
                }),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("ไม่มีบัญชีผู้ใช้"),
              ],
            ),
            SizedBox(height: 15),
            CustomButtonShape(
                lbBtn: "เปิดบัญชีเพื่อลงทะเบียนผู้ใช้",
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) => const LoginScreen()),
                  // );
                }),
          ],
        ),
      ),
    );
  }
}
