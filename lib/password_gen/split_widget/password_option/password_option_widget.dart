// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fast_pw_manager/constants/app_icons.dart';
import 'package:fast_pw_manager/password_gen/split_widget/password_option/sub-widget/option_row_widget.dart';

import '../../../routes/routes.dart';

class PasswordOptionChooseWidget extends StatefulWidget {
  const PasswordOptionChooseWidget(
      {super.key,
      required this.currentPasswordLength,
      required this.onPasswordLengthChanged,
      required this.isLowerCase,
      required this.onLowerCaseChanged,
      required this.isUpperCase,
      required this.onUpperCaseChanged,
      required this.isNumbers,
      required this.onNumbersChanged,
      required this.isSpecialCharacters,
      required this.onSpecialCharactersChanged,
      required this.copyToClipboard,
      required this.savePassword});
  final double currentPasswordLength;
  final ValueChanged<double> onPasswordLengthChanged;
  final bool isLowerCase;
  final ValueChanged<bool> onLowerCaseChanged;
  final bool isUpperCase;
  final ValueChanged<bool> onUpperCaseChanged;
  final bool isNumbers;
  final ValueChanged<bool> onNumbersChanged;
  final bool isSpecialCharacters;
  final ValueChanged<bool> onSpecialCharactersChanged;
  final VoidCallback copyToClipboard;
  final VoidCallback savePassword;

  @override
  State<PasswordOptionChooseWidget> createState() =>
      _PasswordOptionChooseWidgetState();
}

class _PasswordOptionChooseWidgetState
    extends State<PasswordOptionChooseWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: Container(
        color: const Color(0xFFF7F8FA),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: 25.w,
                right: 25.w,
              ),
              child: const Text(
                'Choose Password Strength',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              child: Container(
                height: 40.h,
                padding: EdgeInsets.only(left: 25),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.w),
                  child: Row(
                    children: [
                      Expanded(flex: 2, child: Text("Length : ")),
                      Expanded(
                          flex: 8,
                          child: Slider(
                            activeColor: const Color(0xFF4FD1D9),
                            inactiveColor: const Color(0xFFD9F3F9),
                            value: widget.currentPasswordLength,
                            min: 8,
                            max: 24,
                            onChanged: (value) {
                              setState(() {
                                if (value <= 10) {
                                  widget.onPasswordLengthChanged(8);
                                } else if (value > 10 && value <= 14) {
                                  widget.onPasswordLengthChanged(12);
                                } else if (value > 14 && value <= 20) {
                                  widget.onPasswordLengthChanged(16);
                                } else {
                                  widget.onPasswordLengthChanged(24);
                                }
                              });
                            },
                            divisions: 3, // Number of divisions (4 segments)
                            label:
                                '${widget.currentPasswordLength.toInt()}', // Display the current value as a label
                          )),
                      Expanded(
                        flex: 1,
                        child: Text(
                          '${widget.currentPasswordLength.toInt()}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              child: OptionRowCardWidget(
                iconAsset: AppIcons.upperCaseIcon,
                text: 'Include UpperCase',
                value: widget.isUpperCase,
                onChanged: widget.onUpperCaseChanged,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              child: OptionRowCardWidget(
                iconAsset: AppIcons.lowerCaseIcon,
                text: 'Include LowerCase',
                value: widget.isLowerCase,
                onChanged: widget.onLowerCaseChanged,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              child: OptionRowCardWidget(
                iconAsset: AppIcons.numberIcon,
                text: 'Include numbers',
                value: widget.isNumbers,
                onChanged: widget.onNumbersChanged,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              child: OptionRowCardWidget(
                iconAsset: AppIcons.specCharactersIcon,
                text: 'Include Special Characters',
                value: widget.isSpecialCharacters,
                onChanged: widget.onSpecialCharactersChanged,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 25.w, right: 25.w),
              child: RichText(
                text: TextSpan(
                  text: 'One Click to Copy & Save!',
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                      text:
                          " Unleash Unparalleled Protection, Copy with Unshakable Conviction, and Safely Save it for Later On.",
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.normal,
                        fontSize: 12.sp,
                        height: 1.3.h,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),
                      backgroundColor:
                          MaterialStateProperty.all(const Color(0xFFFFFFFF)),
                    ),
                    onPressed: widget.copyToClipboard,
                    child: const Center(
                      child: Text(
                        'Copy \t\t+',
                        style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),
                      backgroundColor:
                          MaterialStateProperty.all(const Color(0xFF4FD1D9)),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(
                          context, Routes.saveGeneratedPassWordScreen);
                    },
                    child: Center(
                      child: Row(
                        children: [
                          Text(
                            'View',
                            style: TextStyle(color: Color(0xFFFFFFFF)),
                          ),
                          SizedBox(width: 5.w),
                          Icon(
                            FontAwesomeIcons.eye,
                            size: 13.sp,
                          )
                        ],
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),
                      backgroundColor:
                          MaterialStateProperty.all(const Color(0xFF4FD1D9)),
                    ),
                    onPressed: widget.savePassword,
                    child: Center(
                      child: Row(
                        children: [
                          Text(
                            'Save',
                            style: TextStyle(color: Color(0xFFFFFFFF)),
                          ),
                          SizedBox(width: 5.w),
                          Icon(
                            Icons.save,
                            size: 14.sp,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
