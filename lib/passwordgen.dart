import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:nepali_fortify/routes/routes.dart';

import 'bloc/save_generated_data_bloc.dart';
import 'constants/app_icons.dart';
import 'function/generate_unique_id.dart';
import 'model/save_password_model.dart';
import 'savescreen.dart';

class PasswordGeneratorScreen extends StatefulWidget {
  const PasswordGeneratorScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _PasswordGeneratorScreenState createState() =>
      _PasswordGeneratorScreenState();
}

class _PasswordGeneratorScreenState extends State<PasswordGeneratorScreen> {
  double _currentPasswordLength = 8;
  bool _isLowerCase = true;
  bool _isUpperCase = false;
  bool _isnumbers = false;
  bool _isSpecialCharacters = false;

  String generatedPassword = 'Ready To Generate Password?';
  List<String> savedPasswords = []; // List to hold all the saved passwords

  final TextEditingController _lengthController = TextEditingController();

  void generatePassword() {
    final random = Random();
    String charset = '';

    if (_isUpperCase) {
      charset += 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    }
    if (_isLowerCase) {
      charset += 'abcdefghijklmnopqrstuvwxyz';
    }
    if (_isnumbers) {
      charset += '0123456789';
    }
    if (_isSpecialCharacters) {
      charset += '!@#\$%^&*()';
    }

    String password = '';

    for (int i = 0; i < _currentPasswordLength; i++) {
      password += charset[random.nextInt(charset.length)];
    }

    setState(() {
      generatedPassword = password;
    });
  }

  void copyToClipboard() {
    Clipboard.setData(ClipboardData(text: generatedPassword));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Password copied to clipboard')),
    );
  }

  void savePassword() {
    if (generatedPassword.isNotEmpty) {
      setState(() {
        savedPasswords.add(
            generatedPassword); // Add the generated password to the savedPasswords list
      });

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return const SaveScreen();
          },
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _lengthController.text = _currentPasswordLength.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 35.h, left: 25.w, bottom: 0),
                child: Text(
                  'User OnBoard',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15.sp,
                      fontFamily: 'Roboto'),
                ),
              ),
              SizedBox(
                  // color: Colors.red,
                  height: 200.h,
                  // flex: 2,
                  child: Padding(
                    padding:
                        EdgeInsets.only(left: 25.w, right: 25.w, top: 10.h),
                    child: Row(
                      children: [
                        Expanded(
                            flex: 4,
                            child: RichText(
                              text: TextSpan(
                                text: '\n\nWelcome,\n\n',
                                style: const TextStyle(
                                    fontSize: 12, color: Colors.black),
                                children: [
                                  TextSpan(
                                      text:
                                          'The Genius\nBehind\nUnbeatable Passwords',
                                      style: TextStyle(
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.w600,
                                          fontSize: 20.sp,
                                          height: 1.3.h)),
                                ],
                              ),
                            )),
                        Expanded(
                            flex: 3,
                            child: Padding(
                              padding: EdgeInsets.only(left: 20.w),
                              child: Column(
                                children: [
                                  Expanded(
                                      flex: 6,
                                      child: Container(
                                        width: 150.w,
                                        height: 150.h,
                                        decoration: const BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    AppIcons.onlyLogo),
                                                fit: BoxFit.cover),
                                            color: Color(0xFF1C0141),
                                            shape: BoxShape.circle),
                                      )),
                                  Expanded(
                                      flex: 2,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: ElevatedButton(
                                            style: ButtonStyle(
                                                shape: MaterialStateProperty.all<
                                                        RoundedRectangleBorder>(
                                                    RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15.r),
                                                )),
                                                backgroundColor:
                                                    MaterialStateProperty.all(
                                                        const Color(
                                                            0xFFD9F9E1))),
                                            onPressed: generatePassword,
                                            child: const Center(
                                              child: Text(
                                                'Generate',
                                                style: TextStyle(
                                                    color: Color(0xFF5FA773)),
                                              ),
                                            )),
                                      ))
                                ],
                              ),
                            ))
                      ],
                    ),
                  )),
              Padding(
                padding: EdgeInsets.all(15.sp),
                child: Container(
                  height: 40.h,
                  decoration: BoxDecoration(
                      color: const Color(0xFFF6F5F5),
                      borderRadius: BorderRadius.circular(13.r)),
                  child: Center(
                    child: Text(
                      generatedPassword,
                      style: TextStyle(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54),
                    ),
                  ),
                ),
              ),
              Container(
                  height: 500.h,
                  color: Colors.amber,
                  child: Padding(
                    padding: EdgeInsets.only(top: 0.h),
                    child: Container(
                      color: const Color(0xFFF7F8FA),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 25.w, right: 25.w, top: 20.h),
                              child: const Text(
                                'Choose Password Length',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 25.w),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 8,
                                    child: Slider(
                                      activeColor: const Color(0xFF4FD1D9),
                                      inactiveColor: const Color(0xFFD9F3F9),
                                      value: _currentPasswordLength,
                                      min: 8,
                                      max: 25,
                                      onChanged: (newValue) {
                                        setState(() {
                                          _currentPasswordLength = newValue;
                                        });
                                      },
                                      divisions:
                                          17, // Number of divisions between min and max (25-8 = 17)
                                    ),
                                  ),
                                  Expanded(
                                      flex: 1,
                                      child: Text(
                                        '${_currentPasswordLength.toInt()}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20.sp),
                                      ))
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 25.w),
                              child: Container(
                                height: 70.h,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.r),
                                    color: Colors.white),
                                child: Row(children: [
                                  Expanded(
                                      flex: 1,
                                      child: SvgPicture.asset(
                                        AppIcons.upperCaseIcon,
                                        width: 35.w,
                                        height: 35.h,
                                      )),
                                  const Expanded(
                                      flex: 2,
                                      child: Text('Include UpperCase')),
                                  Expanded(
                                    flex: 1,
                                    child: Padding(
                                      padding: EdgeInsets.only(right: 5.w),
                                      child: Switch(
                                        activeColor: const Color(0xFF4FD1D9),
                                        activeTrackColor:
                                            const Color(0xFFD9F3F9),
                                        value: _isUpperCase,
                                        onChanged: (newValue) {
                                          setState(() {
                                            _isUpperCase = newValue;
                                          });
                                        },
                                      ),
                                    ),
                                  )
                                ]),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 25.w),
                              child: Container(
                                height: 70.h,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.r),
                                    color: Colors.white),
                                child: Row(children: [
                                  Expanded(
                                      flex: 1,
                                      child: SvgPicture.asset(
                                        AppIcons.lowerCaseIcon,
                                        width: 35.w,
                                        height: 35.h,
                                      )),
                                  const Expanded(
                                      flex: 2,
                                      child: Text('Include LowerCase')),
                                  Expanded(
                                    flex: 1,
                                    child: Padding(
                                      padding: EdgeInsets.only(right: 5.w),
                                      child: Switch(
                                        activeColor: const Color(0xFF4FD1D9),
                                        activeTrackColor:
                                            const Color(0xFFD9F3F9),
                                        value: _isLowerCase,
                                        onChanged: (newValue) {
                                          setState(() {
                                            _isLowerCase = newValue;
                                          });
                                        },
                                      ),
                                    ),
                                  )
                                ]),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 25.w),
                              child: Container(
                                height: 70.h,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.r),
                                    color: Colors.white),
                                child: Row(children: [
                                  Expanded(
                                      flex: 1,
                                      child: SvgPicture.asset(
                                        AppIcons.numberIcon,
                                        width: 30.w,
                                        height: 30.h,
                                      )),
                                  const Expanded(
                                      flex: 2, child: Text('Include numbers')),
                                  Expanded(
                                    flex: 1,
                                    child: Padding(
                                      padding: EdgeInsets.only(right: 5.w),
                                      child: Switch(
                                        activeColor: const Color(0xFF4FD1D9),
                                        activeTrackColor:
                                            const Color(0xFFD9F3F9),
                                        value: _isnumbers,
                                        onChanged: (newValue) {
                                          setState(() {
                                            _isnumbers = newValue;
                                          });
                                        },
                                      ),
                                    ),
                                  )
                                ]),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 25.w),
                              child: Container(
                                height: 70.h,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.r),
                                    color: Colors.white),
                                child: Row(children: [
                                  Expanded(
                                      flex: 1,
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 25.w),
                                        child: Text(
                                          '@#&',
                                          style: TextStyle(
                                              fontSize: 18.sp,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )),
                                  const Expanded(
                                      flex: 2,
                                      child:
                                          Text('Include Special Characters')),
                                  Expanded(
                                    flex: 1,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          right: 12.w, left: 2.w),
                                      child: Switch(
                                        activeColor: const Color(0xFF4FD1D9),
                                        activeTrackColor:
                                            const Color(0xFFD9F3F9),
                                        value: _isSpecialCharacters,
                                        onChanged: (newValue) {
                                          setState(() {
                                            _isSpecialCharacters = newValue;
                                          });
                                        },
                                      ),
                                    ),
                                  )
                                ]),
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
                                      fontWeight: FontWeight.bold),
                                  children: [
                                    TextSpan(
                                        text:
                                            " Unleash Unparalleled Protection, Copy with Unshakable Conviction, and Safely Save it for Later On.",
                                        style: TextStyle(
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.normal,
                                            fontSize: 8.sp,
                                            height: 1.3.h)),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 2.h),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  ElevatedButton(
                                      style: ButtonStyle(
                                          shape: MaterialStateProperty.all<
                                                  RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(2.r),
                                          )),
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  const Color(0xFFFFFFFF))),
                                      onPressed: copyToClipboard,
                                      child: const Center(
                                        child: Text(
                                          'Copy \t\t+',
                                          style: TextStyle(
                                              color:
                                                  Color.fromARGB(255, 0, 0, 0)),
                                        ),
                                      )),
                                  SizedBox(
                                    width: 150.h,
                                  ),
                                  ElevatedButton(
                                      style: ButtonStyle(
                                          shape: MaterialStateProperty.all<
                                                  RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8.r),
                                          )),
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  const Color(0xFF4FD1D9))),
                                      onPressed: () {
                                        var savedData =
                                            SaveGeneratedPasswordModel(
                                                id: generateUniqueId('Pass-'),
                                                generatedPassword:
                                                    generatedPassword,
                                                date: DateTime.now()
                                                    .toString()
                                                    .split(' ')
                                                    .first,
                                                time: DateFormat('hh:mm a')
                                                    .format(DateTime.now()));

                                        BlocProvider.of<SaveGeneratedDataBloc>(
                                                context)
                                            .add(SaveNewGeneratedPassword(
                                                modelListofSavedPassword:
                                                    savedData));

                                        Navigator.pushNamed(context,
                                            Routes.saveGeneratedPassWordScreen);
                                      },
                                      child: const Center(
                                        child: Text(
                                          'Save',
                                          style: TextStyle(
                                              color: Color(0xFFFFFFFF)),
                                        ),
                                      )),
                                ],
                              ),
                            )
                          ]),
                    ),
                  )),
            ],
          ),
        ));
  }
}
