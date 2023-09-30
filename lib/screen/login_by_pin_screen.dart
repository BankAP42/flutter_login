import 'dart:developer';

import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../widget/pin/pin_widget.dart';

class LoginByPinScreen extends StatefulWidget {
  const LoginByPinScreen({super.key});

  @override
  State<LoginByPinScreen> createState() => _LoginByPinScreenState();
}

class _LoginByPinScreenState extends State<LoginByPinScreen> {
  MPinController mPinController = MPinController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Column(
            children: [
              Icon(Icons.fingerprint, size: 45),
              Text("Touch ID "),
            ],
          ),
          content: Text("เข้าใช้งานด้วย Touch ID หรือยกเลิกกลับไปใช้รหัส PIN"),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Enter Password'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('ยกเลิก'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.only(top: 150)),
            const SizedBox(
              child: Text('กรุณากรอกรหัส PIN '),
            ),
            Stack(
              children: [
                SafeArea(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MPinWidget(
                          pinLegth: 6,
                          controller: mPinController,
                          onCompleted: (mPin) {
                            mPinController.notifyWrongInput();
                            log('You entered -> $mPin');
                          },
                        ),
                        const SizedBox(height: 20),
                        GridView.count(
                          physics: const NeverScrollableScrollPhysics(),
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 20,
                          padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                          crossAxisCount: 3,
                          shrinkWrap: true,
                          childAspectRatio: 1,
                          children: List.generate(
                              9, (index) => buildMaterialButton(index + 1)),
                        ),
                        GridView.count(
                          physics: const NeverScrollableScrollPhysics(),
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 20,
                          padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                          crossAxisCount: 3,
                          shrinkWrap: true,
                          childAspectRatio: 1,
                          children: [
                            MaterialButton(
                              elevation: 0,
                              shape: const CircleBorder(),
                              onPressed: () {},
                              textColor: blackPrimary,
                              child: const Icon(Icons.fingerprint, size: 50),
                            ),
                            buildMaterialButton(0),
                            MaterialButton(
                              elevation: 0,
                              shape: const CircleBorder(),
                              onPressed: () {
                                mPinController.delete();
                              },
                              textColor: blackPrimary,
                              child: const Icon(
                                Icons.backspace_rounded,
                                size: 30,
                              ),
                            ),
                          ],
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text("ลืมรหัส PIN ?"),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  MaterialButton buildMaterialButton(int input) {
    return MaterialButton(
      onPressed: () {
        mPinController.addInput('$input');
      },
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40),
        side: const BorderSide(color: blackPrimary),
      ),
      color: Colors.white,
      child: Text(
        '$input',
        style: const TextStyle(fontSize: 24),
      ),
    );
  }
}
