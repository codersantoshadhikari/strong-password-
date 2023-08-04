import 'package:flash_pw_manager/constants/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';

class LogoComponent extends StatelessWidget {
  const LogoComponent({super.key});

  @override
  Widget build(BuildContext context) {
   return Padding(
      padding: EdgeInsets.only(left: 135.w, top: 140.h),
      child: Container(
        height: 70,
        width: 70,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Theme.of(context).colorScheme.background,
            width: 8.w,
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50.r),
          child: Image.asset(AppIcons.onlyLogo)
        ),
      ),
    );
  }
}