// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flash_pw_manager/constants/app_icons.dart';

class CustomSnackBarMessage extends StatefulWidget {
  const CustomSnackBarMessage(
      {super.key,
      required this.headerText,
      required this.bodyText,
      required this.backgroundColor,
      required this.bubbleColor,
      required this.iconToShowInbubble});
  final String headerText;
  final String bodyText;
  final Color backgroundColor;
  final Color bubbleColor;
  final Widget iconToShowInbubble;

  @override
  State<CustomSnackBarMessage> createState() => _CustomSnackBarMessageState();
}

class _CustomSnackBarMessageState extends State<CustomSnackBarMessage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: EdgeInsets.all(14.sp),
          height: 75.h,
          // width: 500.w,
          decoration: BoxDecoration(
              color: widget.backgroundColor,
              // Color(0xFFC72C41),
              borderRadius: BorderRadius.circular(20.r)),
          child: Row(
            children: [
              SizedBox(
                width: 48.w,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.headerText,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      widget.bodyText,
                      style: TextStyle(color: Colors.white, fontSize: 12.sp),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 0.h,
          child: SvgPicture.asset(
            AppIcons.bubbleArt,
            height: 48.h,
            width: 38.w,
            color: widget.bubbleColor,
          ),
        ),
        Positioned(
          top: -18.h,
          left: 10.w,
          child: SvgPicture.asset(
            AppIcons.failBubble,
            height: 45.h,
            width: 25.w,
            color: widget.bubbleColor,
          ),
        ),
        Positioned(top: -15.h, left: 14.w, child: widget.iconToShowInbubble)
      ],
    );
  }
}
