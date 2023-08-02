// ignore_for_file: deprecated_member_use

import 'package:fast_pw_manager/constants/app_icons.dart';
import 'package:fast_pw_manager/custom_widgets/alert_dialouge/alert_dialouge.dart';
import 'package:fast_pw_manager/saved_password_view/split_widget/password_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SaveedPasswordScreenWidget extends StatelessWidget {
  const SaveedPasswordScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: -17.h,
              right: -40.w,
              child: SizedBox(
                width: 180.w,
                height: 180.h,
                child: Image.asset(
                  AppIcons.backGroundDecImage,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Positioned(
              top: 19.h,
              left: 25.w,
              child: Transform.rotate(
                angle: -0.4, // Adjust the angle as per your requirement (in radians)
                child: SvgPicture.asset(
                  AppIcons.backGroundDecIcon,
                  height: 70,
                  width: 90,
                  color: const Color(0xFF1C274C).withOpacity(0.3),
                ),
              ),
            ),
            const PasswordListWidget(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialogBoxShowingCompenentToSavePassword(context, '', false, false, false, false, true);
        },
        backgroundColor: const Color(0xFF4FD1D9),
        child: const Icon(Icons.add),
      ),
    );
  }
}