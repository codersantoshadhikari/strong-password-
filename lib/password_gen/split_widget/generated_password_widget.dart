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
            children: [
              Expanded(
                flex: 5,
                child: Padding(
                  padding: EdgeInsets.only(left:generatedPassword ==''?25.w: 35.w),
                  child: Text(
                    generatedPassword == ''
                        ? 'Ready To Generate Password?'
                        : generatedPassword,
                    style: TextStyle(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                  ),
                ),
              ),
             generatedPassword != ''? Expanded(
                  flex: 1,
                  child: GestureDetector(
                      onTap: () {
                        ongeneratedPasswordChanged('');
                      },
                      child: const Icon(Icons.close))):const SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}
