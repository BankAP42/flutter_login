import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../widget/pin/pin_widget.dart';
import 'confirm_pin_screen.dart';

class CreatePinScreen extends StatefulWidget {
  const CreatePinScreen({super.key});

  @override
  State<CreatePinScreen> createState() => _CreatePinScreenState();
}

class _CreatePinScreenState extends State<CreatePinScreen> {
  MPinController mPinController = MPinController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  const Padding(padding: EdgeInsets.only(top: 150)),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.1,
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios_new,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      color: primaryBlue,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                child: Text('ตั้งรหัส PIN CODE'),
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
                              print('You entered -> $mPin');
                              mPinController.notifyWrongInput();

                              if (mPin != '444444') {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: Text('ใส่เลข4'),
                                        content: Text('4 4 4 4 4 4'),
                                      );
                                    });
                              } else {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ConfirmPinScreen(
                                        pinnumber: mPin,
                                      ),
                                    ));
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
                            physics: const ScrollPhysics(),
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
