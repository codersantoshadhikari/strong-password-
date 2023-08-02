

// ignore_for_file: prefer_const_constructors

import 'package:fast_pw_manager/saved_password_view/split_widget/password_list_header_widget.dart';
import 'package:fast_pw_manager/saved_password_view/split_widget/password_list_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PasswordListWidget extends StatelessWidget {
  const PasswordListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              PasswordListHeaderWidget(),
              PasswordListViewWidget()
            ],
          ),
        ),
      ),
    );
  }
}