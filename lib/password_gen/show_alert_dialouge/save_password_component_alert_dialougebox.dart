// ignore_for_file: prefer_const_constructors

import 'package:drop_shadow/drop_shadow.dart';
import 'package:flash_pw_manager/password_gen/bloc/save_generated_data_bloc.dart';
import 'package:flash_pw_manager/password_gen/show_alert_dialouge/split_widget/action_button_widget.dart';
import 'package:flash_pw_manager/password_gen/show_alert_dialouge/split_widget/form_fields.dart';
import 'package:flash_pw_manager/password_gen/show_alert_dialouge/split_widget/social_media_icons.dart';
import 'package:flash_pw_manager/password_gen/split_widget/password_generator_utils/password_generator_utils.dart';
import 'package:flash_pw_manager/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants/app_icons.dart';

List<String> listOficonsImage = [
  AppIcons.googleIcon,
  AppIcons.facebookIcon,
  AppIcons.instagramIcon,
  AppIcons.twitterIcon,
  AppIcons.figmaIcon,
  AppIcons.linkedinIcon,
  AppIcons.githubIcon,
  AppIcons.dockerIcon
];

class SavePasswordComponentAlert extends StatefulWidget {
  const SavePasswordComponentAlert(
      {super.key,
      required this.generatedPassword,
      required this.isUpperCase,
      required this.isLowerCase,
      required this.isnumbers,
      required this.isSpecialCharacters,
      required this.isFloatingButtonPressed});
  final String generatedPassword;
  final bool isUpperCase;
  final bool isLowerCase;
  final bool isnumbers;
  final bool isSpecialCharacters;
  final bool isFloatingButtonPressed;

  @override
  State<SavePasswordComponentAlert> createState() =>
      _SavePasswordComponentAlertState();
}

class _SavePasswordComponentAlertState
    extends State<SavePasswordComponentAlert> {
  int choosedImageIndex = -1;
  TextEditingController userNameorId = TextEditingController();
  TextEditingController password = TextEditingController();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _userNameFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    password.text = widget.generatedPassword;
  }

void _onIconSelected(int index) {
    setState(() {
      choosedImageIndex = index;
    });
  }

  @override
  void dispose() {
    super.dispose();
    password.dispose();
    userNameorId.dispose();
    _passwordFocusNode.dispose();
    _userNameFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
   return DropShadow(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: AlertDialog(
          backgroundColor: const Color(0xFFF7F8FA),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.r)),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 100.w),
              child: choosedImageIndex == -1
                  ? Container(
                      height: 50.h,
                      width: 50.w,
                      decoration: BoxDecoration(
                          image: const DecorationImage(
                              image: AssetImage(AppIcons.onlyLogo),
                              fit: BoxFit.contain),
                          shape: BoxShape.circle,
                          border: Border.all(
                              width: 2.w, color: const Color(0xFF4FD1D9))),
                    )
                  : SizedBox(
                      height: 50.h,
                      width: 50.w,
                      child: SvgPicture.asset(listOficonsImage[choosedImageIndex]),
                    ),
            ),
            FormFieldWidget(
              userNameController: userNameorId,
              passwordController: password,
              userNameFocusNode: _userNameFocusNode,
              passwordFocusNode: _passwordFocusNode,
            ),
            SocialMediaIcons(
              listOfIcons: listOficonsImage,
              onIconSelected: _onIconSelected,
            ),
            ActionButtonWidget(
              onCancelPressed: () {
                Navigator.pop(context);
              },
              onSavePressed: () {
                _passwordFocusNode.unfocus();
                _userNameFocusNode.unfocus();
                PasswordGeneratorUtils.savePassword(
                  password.text,
                  widget.isUpperCase,
                  widget.isLowerCase,
                  widget.isnumbers,
                  widget.isSpecialCharacters,
                  BlocProvider.of<SaveGeneratedDataBloc>(context),
                  choosedImageIndex,
                  userNameorId.text,
                );
                Navigator.pop(context);
                if (widget.isFloatingButtonPressed == false) {
                  Navigator.pushNamed(context, Routes.saveGeneratedPassWordScreen);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}