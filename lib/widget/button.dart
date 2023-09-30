import 'package:flutter/material.dart';

import '../utils/colors.dart';

class CustomButton extends StatelessWidget {
  final bool? isEnabled;

  final String lbBtn;
  final VoidCallback onPressed;

  const CustomButton({
    Key? key,
    required this.lbBtn,
    required this.onPressed,
    this.isEnabled,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      width: MediaQuery.of(context).size.width * 0.90,
      height: 45,
      child: ElevatedButton(
          onPressed: isEnabled ?? true ? onPressed : null,
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: primaryBlue,
            // shape: const StadiumBorder(),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                ' $lbBtn ',
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              ),
            ],
          )),
    );
  }
}

class CustomButtonShape extends StatelessWidget {
  final bool? isEnabled;

  final String lbBtn;
  final VoidCallback onPressed;

  const CustomButtonShape({
    Key? key,
    required this.lbBtn,
    required this.onPressed,
    this.isEnabled,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      width: MediaQuery.of(context).size.width * 0.90,
      height: 45,
      child: ElevatedButton(
          onPressed: isEnabled ?? true ? onPressed : null,
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: bgColor,
            shape: const RoundedRectangleBorder(
              side: BorderSide(color: primaryBlue),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                ' $lbBtn ',
                style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: primaryBlue),
              ),
            ],
          )),
    );
  }
}

class CustombuttonTwotarget extends StatelessWidget {
  final bool? isEnabled;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final String lbBtn;
  final VoidCallback onPressed;
  final Color primarylcolor;
  final bool? isEnabled2;
  final IconData? prefixIcon2;
  final IconData? suffixIcon2;
  final String lbBtn2;
  final VoidCallback onPressed2;
  final Color primarylcolor2;
  const CustombuttonTwotarget(
      {super.key,
      this.isEnabled,
      this.prefixIcon,
      this.suffixIcon,
      required this.lbBtn,
      required this.onPressed,
      required this.primarylcolor,
      this.isEnabled2,
      this.prefixIcon2,
      this.suffixIcon2,
      required this.lbBtn2,
      required this.onPressed2,
      required this.primarylcolor2});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.90,
      margin: const EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: ElevatedButton(
                onPressed: isEnabled ?? true ? onPressed : null,
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: primarylcolor,
                  shape: const RoundedRectangleBorder(
                    side: BorderSide(color: primaryBlue),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      ' $lbBtn ',
                      style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: primaryBlue),
                    ),
                  ],
                )),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: ElevatedButton(
                onPressed: isEnabled2 ?? true ? onPressed2 : null,
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: primarylcolor2,
                  // shape: const StadiumBorder(),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      ' $lbBtn2 ',
                      style: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.w500),
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
