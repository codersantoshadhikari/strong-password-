import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DisplayWelcomeWidget extends StatelessWidget {
  const DisplayWelcomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: '\n\nWelcome,\n\n',
        style: const TextStyle(fontSize: 12, color: Colors.black),
        children: [
          TextSpan(
            text: 'The Genius\nBehind\nUnbeatable Passwords',
            style: TextStyle(
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w600,
              fontSize: 25.sp,
              height: 1.3.h,
            ),
          ),
        ],
      ),
    );
  }
}
