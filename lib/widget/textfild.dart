import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextfieldOutlined extends StatelessWidget {
  final String label;
  final int? maxLenght;
  final TextInputType? keyboardType;
  final TextEditingController controller;
  final bool? isObscured;
  final bool? focus;
  final int? maxLines;
  final bool? isDisabled;

  final List<TextInputFormatter>? inputeFormatter;
  const TextfieldOutlined({
    Key? key,
    required this.label,
    required this.controller,
    this.maxLenght,
    this.maxLines,
    this.isObscured,
    this.inputeFormatter,
    this.keyboardType,
    this.focus,
    this.isDisabled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Textformfield(
        child: TextFormField(
      controller: controller,
      autofocus: focus ?? true,
      textAlign: TextAlign.center,
      style: const TextStyle(color: Colors.black),
      keyboardType: keyboardType,
      maxLength: maxLenght,
      maxLines: maxLines ?? 1,
      textInputAction: TextInputAction.done,
      obscureText: isObscured ?? false ? true : false,
      inputFormatters: inputeFormatter,
      enabled: isDisabled ?? true ? true : false,
      autovalidateMode: AutovalidateMode.disabled,
      decoration: InputDecoration(
        labelText: label,
        contentPadding:
            const EdgeInsets.only(left: 25, right: 25, top: 10, bottom: 10),
        isDense: true,
      ),
    ));
  }
}

class Textformfield extends StatelessWidget {
  final Widget child;
  const Textformfield({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
        height: 62,
        margin: const EdgeInsets.symmetric(vertical: 5),
        width: size.width * 0.85,
        child: child);
  }
}
