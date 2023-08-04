// ignore_for_file: prefer_const_constructors

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GeneratedPasswordStringWidget extends StatelessWidget {
  const GeneratedPasswordStringWidget(
      {super.key,
      required this.generatedPassword,
      required this.ongeneratedPasswordChanged});
  final String generatedPassword;
  final ValueChanged<String> ongeneratedPasswordChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15.sp),
      child: Container(
        height: 40.h,
        decoration: BoxDecoration(
          color: const Color(0xFFF6F5F5),
          borderRadius: BorderRadius.circular(13.r),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 5,
                child: Padding(
                  padding: generatedPassword == ''
                      ? EdgeInsets.zero
                      : EdgeInsets.only(left: 35.w),
                  child: AutoSizeText(
                    generatedPassword == ''
                        ? 'Ready To Generate Password?'
                        : generatedPassword,
                    presetFontSizes: [22.sp, 18.sp, 15.sp],
                    maxLines: 1,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                  ),
                ),
              ),
              generatedPassword != ''
                  ? Expanded(
                      flex: 1,
                      child: GestureDetector(
                          onTap: () {
                            ongeneratedPasswordChanged('');
                          },
                          child: const Icon(Icons.close)))
                  : const SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}
