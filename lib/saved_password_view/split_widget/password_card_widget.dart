// ignore_for_file: prefer_const_constructors

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flash_pw_manager/constants/app_icons.dart';
import 'package:flash_pw_manager/model/save_password_model.dart';
import 'package:flash_pw_manager/password_gen/bloc/save_generated_data_bloc.dart';
import 'package:flash_pw_manager/password_gen/show_alert_dialouge/save_password_component_alert_dialougebox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../password_gen/split_widget/password_generator_utils/password_generator_utils.dart';

class PasswordCardWidget extends StatefulWidget {
  const PasswordCardWidget({super.key, required this.passwordData});
  final SaveGeneratedPasswordModel passwordData;

  @override
  State<PasswordCardWidget> createState() => _PasswordCardWidgetState();
}

class _PasswordCardWidgetState extends State<PasswordCardWidget> {
  bool _isPasswordVisible = false;
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      background: Container(
        decoration: BoxDecoration(
          color: const Color(0xCCDC4E59),
          borderRadius: BorderRadius.circular(15.r),
        ),
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20.0),
        child: const Icon(
          Icons.delete,
          color: Colors.white,
        ),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        final oldSavedPassword = SaveGeneratedPasswordModel(
          socialMediaName: widget.passwordData.socialMediaName,
          userName: widget.passwordData.userName,
          chosenIndex: widget.passwordData.chosenIndex,
          id: widget.passwordData.id,
          generatedPassword: widget.passwordData.generatedPassword,
          date: widget.passwordData.date,
          time: widget.passwordData.time,
          category: widget.passwordData.category,
          choosedIndex: null,
        );

        BlocProvider.of<SaveGeneratedDataBloc>(context).add(DeleteOldPassword(
          modelListofSavedPassword: oldSavedPassword,
        ));
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: SizedBox(
          height: 190.h,
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.all(15.sp),
            child: Row(
              children: [
                widget.passwordData.chosenIndex == -1
                    ? Expanded(
                        child: Container(
                        height: 50.h,
                        width: 50.h,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(AppIcons.appLogo),
                                fit: BoxFit.contain),
                            color: Color(0xFF1C0141),
                            shape: BoxShape.circle),
                      ))
                    : Expanded(
                        child: Container(
                        height: 50.h,
                        width: 50.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: SvgPicture.asset(
                            listOficonsImage[widget.passwordData.chosenIndex]),
                      )),
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: EdgeInsets.only(left: 15.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AutoSizeText(
                                    widget.passwordData.userName,
                                    presetFontSizes: [18.sp, 15.sp, 10.sp],
                                    maxLines: 1,
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  !_isPasswordVisible
                                      ? Text(
                                          "********",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w100,
                                              fontSize: 15.sp),
                                        )
                                      : AutoSizeText(
                                          widget.passwordData.generatedPassword,
                                          presetFontSizes: [
                                            15.sp,
                                            12.sp,
                                            10.sp
                                          ],
                                          maxLines: 1,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w200),
                                        ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      copyToClipboard(widget
                                          .passwordData.generatedPassword);
                                    },
                                    child: SvgPicture.asset(AppIcons.copyIcon),
                                  ),
                                  SizedBox(
                                    height: 3.h,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _isPasswordVisible =
                                            !_isPasswordVisible;
                                      });
                                    },
                                    child: SizedBox(
                                      height: 15.h,
                                      width: 15.w,
                                      child: SvgPicture.asset(
                                        _isPasswordVisible
                                            ? AppIcons.eyeshowIcon
                                            : AppIcons.eyeHideIcon,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.h),
                        AutoSizeText(
                          widget.passwordData.socialMediaName,
                          presetFontSizes: [15.sp, 12.sp, 10.sp],
                          maxLines: 1,
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(0, 0, 255, 0.5)),
                        ),
                        SizedBox(height: 10.h),
                        Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Text(widget.passwordData.date),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(widget.passwordData.time),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void copyToClipboard(String generatedPassword) {
    PasswordGeneratorUtils.copyToClipboard(generatedPassword, context);
  }
}
