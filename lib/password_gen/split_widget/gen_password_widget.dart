import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nepali_fortify/constants/app_icons.dart';

class GeneratePasswordWidget extends StatelessWidget {
  const GeneratePasswordWidget({super.key,required this.generatePassword});
   final VoidCallback generatePassword;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                  image: AssetImage(AppIcons.onlyLogo),
                  fit: BoxFit.cover,
                ),
                color: Color(0xFF1C0141),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all(
                    const Color(0xFFD9F9E1),
                  ),
                ),
                onPressed: generatePassword,
                child: const Center(
                  child: Text(
                    'Generate',
                    style: TextStyle(color: Color(0xFF5FA773)),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}