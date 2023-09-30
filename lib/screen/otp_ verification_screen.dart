import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/colors.dart';
import 'create_pin_screen.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  int countdown = 60;
  bool isCountingDown = false;

  @override
  void initState() {
    startCountdown(setState);
    super.initState();
  }

  void startCountdown(StateSetter setState) {
    setState(() {
      isCountingDown = true;
    });

    Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      setState(() {
        countdown--;
      });

      if (countdown == 0) {
        setState(() {
          isCountingDown = false;
          countdown = 60;
        });
        timer.cancel();
      }
    });
  }

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
      body: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CreatePinScreen()),
          );
        },
        child: Padding(
          padding: EdgeInsets.all(18.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Row(
              children: [
                Text(
                  'ยืนยันตัวตน',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Row(
              children: [
                Text('กรุณากรอกรหัสยืนยันที่เราได้ส่งให้คุณ'),
              ],
            ),
            Row(
              children: [
                Text('082-xxxx-8998'),
              ],
            ),
            SizedBox(height: 70),
            PinOtp(),
            SizedBox(height: 80),
            Text(
              'หากคุณไม่ได้รับรหัส?',
            ),
            TextButton(
              onPressed: () {},
              child: isCountingDown
                  ? Text("ส่งรหัสไหม่ ($countdown วินาที)")
                  : Text("ส่งรหัสไหม่"),
            ),
          ]),
        ),
      ),
    );
  }
}

class PinOtp extends StatelessWidget {
  const PinOtp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 54,
          height: 58,
          child: TextField(
            onChanged: (value) {
              if (value.length == 1) {
                FocusScope.of(context).nextFocus();
              }
            },
            style: Theme.of(context).textTheme.bodyMedium,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
              FilteringTextInputFormatter.digitsOnly
            ],
          ),
        ),
        SizedBox(
          width: 54,
          height: 58,
          child: TextField(
            onChanged: (value) {
              if (value.length == 1) {
                FocusScope.of(context).nextFocus();
              }
            },
            style: Theme.of(context).textTheme.bodyMedium,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
              FilteringTextInputFormatter.digitsOnly
            ],
          ),
        ),
        SizedBox(
          width: 54,
          height: 58,
          child: TextField(
            onChanged: (value) {
              if (value.length == 1) {
                FocusScope.of(context).nextFocus();
              }
            },
            style: Theme.of(context).textTheme.bodyMedium,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
              FilteringTextInputFormatter.digitsOnly
            ],
          ),
        ),
        SizedBox(
          width: 54,
          height: 58,
          child: TextField(
            onChanged: (value) {
              if (value.length == 1) {
                FocusScope.of(context).nextFocus();
              }
            },
            style: Theme.of(context).textTheme.bodyMedium,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
              FilteringTextInputFormatter.digitsOnly
            ],
          ),
        ),
        SizedBox(
          width: 54,
          height: 58,
          child: TextField(
            onChanged: (value) {
              if (value.length == 1) {
                FocusScope.of(context).nextFocus();
              }
            },
            style: Theme.of(context).textTheme.bodyMedium,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
              FilteringTextInputFormatter.digitsOnly
            ],
          ),
        ),
        SizedBox(
          width: 54,
          height: 58,
          child: TextField(
            onChanged: (value) {
              if (value.length == 1) {
                FocusScope.of(context).nextFocus();
              }
            },
            style: Theme.of(context).textTheme.bodyMedium,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
              FilteringTextInputFormatter.digitsOnly
            ],
          ),
        ),
      ],
    );
  }
}
