// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomElevatedButton extends StatelessWidget {
  CustomElevatedButton(
      {super.key,
      this.bdRadius,
      this.elevation,
      this.bgColor,
      this.widgetIcon,
      this.text1,
      this.ftSize,
      this.txtColor,
      this.onPressed,
      this.isLoadingPart,
      this.borderColor});
  final double? bdRadius;
  final double? elevation;
  final Color? bgColor;
  final String? text1;
  final double? ftSize;
  final Color? txtColor;
  final Color? borderColor;
  final Function()? onPressed;
  final Widget? widgetIcon;
  bool? isLoadingPart;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
          side: MaterialStateProperty.all<BorderSide>(
              BorderSide(color: borderColor ?? Colors.transparent)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(bdRadius ?? 2.r),
          )),
          elevation: MaterialStateProperty.all(elevation ?? 2),
          backgroundColor: MaterialStateProperty.all(bgColor ?? Colors.grey)),
      child: Center(
        child: Text(
                "$text1",
                style: TextStyle(
                    fontSize: ftSize ?? 12.sp, color: txtColor ?? Colors.white),
              ),
      ),
    );
  }
}
