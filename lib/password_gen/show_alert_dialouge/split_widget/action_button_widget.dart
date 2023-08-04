// ignore_for_file: prefer_const_constructors

import 'package:flash_pw_manager/custom_widgets/elevated_button/custom_eleveted_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ActionButtonWidget extends StatelessWidget {
  const ActionButtonWidget({super.key,  required this.onCancelPressed,
    required this.onSavePressed,});
  final VoidCallback onCancelPressed;
  final VoidCallback onSavePressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CustomElevatedButton(
          onPressed: onCancelPressed,
          text1: 'Cancel',
          txtColor: Colors.black,
          bgColor: Color(0xFFFFFFFF),
          bdRadius: 8.r,
        ),
        CustomElevatedButton(
          onPressed: onSavePressed,
          text1: 'Save',
          bgColor: const Color(0xFF4FD1D9),
          bdRadius: 8.r,
        ),
      ],
    );
  }
}