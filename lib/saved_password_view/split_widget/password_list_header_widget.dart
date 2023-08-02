

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PasswordListHeaderWidget extends StatelessWidget {
  const PasswordListHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
     return Padding(
      padding: EdgeInsets.only(top: 120.h, bottom: 50.h),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child:  Icon(
              Icons.arrow_back,
              size: 30.sp,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 25.h),
            child: Text(
              "My Passwords",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
                fontSize: 24.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}