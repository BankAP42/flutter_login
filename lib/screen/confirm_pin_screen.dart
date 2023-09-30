import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_login/screen/touch_id_screen.dart';

import '../utils/colors.dart';
import '../widget/pin/pin_widget.dart';

class ConfirmPinScreen extends StatefulWidget {
  final String pinnumber;

  const ConfirmPinScreen({super.key, required this.pinnumber});

  @override
  State<ConfirmPinScreen> createState() => _ConfirmPinScreenState();
}

class _ConfirmPinScreenState extends State<ConfirmPinScreen> {
  MPinController mPinController = MPinController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.only(top: 150)),
            const SizedBox(
              child: Text('ยันยันรหัส PIN CODE'),
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
                            log('You entered -> $mPin');
                            if (mPin == widget.pinnumber) {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const TouchIdScreen()),
                                (Route<dynamic> route) => false,
                              );
                              mPinController.notifyWrongInput();
                            } else {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: const Text('รหัสไม่ถูกต้อง'),
                                      content: const Text(
                                          'รหัสของท่านไม่ถูกต้อง กรุณาลองไหม่'),
                                      actions: [
                                        TextButton(
                                          child: const Text('ตกลง'),
                                          onPressed: () {
                                            int count = 0;
                                            Navigator.of(context)
                                                .popUntil((_) => count++ >= 2);
                                          },
                                        ),
                                      ],
                                    );
                                  });
                              mPinController.notifyWrongInput();
                            }
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
                              textColor: bgColor,
                              child: const Icon(Icons.fingerprint),
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
