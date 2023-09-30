import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class MPinAnimationController {
  late void Function(String) animate;
  late void Function() clear;
}

class MPinAnimation extends StatefulWidget {
  final MPinAnimationController controller;

  const MPinAnimation({Key? key, required this.controller}) : super(key: key);
  @override
  _MPinAnimationState createState() => _MPinAnimationState(controller);
}

class _MPinAnimationState extends State<MPinAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> sizeAnimation;
  late Animation<double> opacityAnimation;
  String pin = '';

  void animate(String input) {
    controller.forward();
    setState(() {
      pin = input;
    });
  }

  void clear() {
    setState(() {
      pin = '';
    });
  }

  _MPinAnimationState(controller) {
    controller?.animate = animate;
    controller?.clear = clear;
  }

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );

    sizeAnimation = Tween<double>(begin: 24, end: 24).animate(controller);
    opacityAnimation = Tween<double>(begin: 24, end: 24).animate(controller);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      alignment: Alignment.center,
      child: Container(
        height: sizeAnimation.value,
        width: sizeAnimation.value,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(sizeAnimation.value / 2),
          color: pin == '' ? Colors.white54 : primaryBlue,
          border: Border.all(
            color: primaryBlue,
          ),
        ),
      ),
    );
  }
}
