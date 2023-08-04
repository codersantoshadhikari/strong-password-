import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flash_pw_manager/constants/app_icons.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 270.w, // Set the desired image width
      height: 270.h, // Set the desired image height
      child: Image.asset(
          AppIcons.appLogo), // Replace 'your_image.png' with your image path
    );
  }
}
