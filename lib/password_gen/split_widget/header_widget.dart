import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 35.h, left: 25.w, bottom: 0),
      child: Text(
        'User OnBoard',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15.sp,
          fontFamily: 'Roboto',
        ),
      ),
    );
  }
}
