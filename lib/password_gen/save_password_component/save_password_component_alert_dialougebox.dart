// ignore_for_file: prefer_const_constructors

import 'package:drop_shadow/drop_shadow.dart';
import 'package:fast_pw_manager/custom_widgets/text_field/custom_textfield.dart';
import 'package:fast_pw_manager/password_gen/bloc/save_generated_data_bloc.dart';
import 'package:fast_pw_manager/password_gen/split_widget/password_generator_utils/password_generator_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants/app_icons.dart';
import '../../custom_widgets/elevated_button/custom_eleveted_button.dart';

class SavePasswordComponentAlert extends StatefulWidget {
  const SavePasswordComponentAlert(
      {super.key,
      required this.generatedPassword,
      required this.isUpperCase,
      required this.isLowerCase,
      required this.isnumbers,
      required this.isSpecialCharacters});
  final String generatedPassword;
  final bool isUpperCase;
  final bool isLowerCase;
  final bool isnumbers;
  final bool isSpecialCharacters;

  @override
  State<SavePasswordComponentAlert> createState() =>
      _SavePasswordComponentAlertState();
}

class _SavePasswordComponentAlertState
    extends State<SavePasswordComponentAlert> {
  // GlobalKey<FormState> savePasswordKey = GlobalKey<FormState>();
  int choosedImageIndex = -1;
  TextEditingController userNameorId = TextEditingController();
  TextEditingController password = TextEditingController();
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
  @override
  void initState() {
    super.initState();
    password.text = widget.generatedPassword;
  }

  @override
  Widget build(BuildContext context) {
    return DropShadow(
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
                    child:
                        SvgPicture.asset(listOficonsImage[choosedImageIndex]),
                  ),
          ),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 20.h),
                child: CustomTextFieldWidget(
                  textColor: Colors.black87,
                  controller: userNameorId,
                  inputAction: TextInputAction.next, // Moves focus to next.
                  // controller: userName,
                  validator: (value) {
                    if ((value ?? '').isEmpty) {
                      return 'Username cannot be empty';
                    } else {
                      return null;
                    }
                  },
                  radius: 15.r,
                  borderSide:
                      const BorderSide(width: 2, color: Color(0xFF4FD1D9)),
                  backgroundColor: Colors.white,
                  prefixIcon: Icon(Icons.account_circle_outlined,
                      color: Colors.tealAccent[700]!.withOpacity(0.3)),
                  hintText: 'Username/Id',
                  hintStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: 15.sp,
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 15.h),
                child: CustomTextFieldWidget(
                  textColor: Colors.black87,
                  controller: password,
                  inputAction: TextInputAction.done, // Hides the keyboard.
                  // controller: password,
                  validator: (value) {
                    if ((value ?? '').isEmpty) {
                      return 'password field cannot be empty';
                    } else {
                      return null;
                    }
                  },
                  borderSide: BorderSide(
                    width: 2.w,
                    color: const Color(0xFF4FD1D9),
                  ),
                  radius: 15.r,
                  hintText: "Password",
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 15.sp),
                  isPassword: true,
                  backgroundColor: Colors.white,
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Colors.tealAccent[700]!.withOpacity(0.3),
                  ),
                ),
              ),
            ],
          ),
          // PaymentMethodGrid(),
          Padding(
            padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Text(
              "Choose Your Preferred Social Media Platform",
              style: TextStyle(
                  fontSize: 15.sp,
                  color: Colors.black38,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 20),
            child: SizedBox(
              height: 50.h, width: 400,
              // color: Colors.amber,
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: listOficonsImage.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            choosedImageIndex = index;
                          });
                        },
                        child: SizedBox(
                          height: 30.h,
                          width: 35.w,
                          child: SvgPicture.asset(
                            listOficonsImage[index],
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                text1: 'Cancel',
                txtColor: Colors.black,
                bgColor: Color(0xFFFFFFFF),
                bdRadius: 8.r,
              ),
              CustomElevatedButton(
                onPressed: () {
                  // if (savePasswordKey.currentState!.validate()) {
                  PasswordGeneratorUtils.savePassword(
                      widget.generatedPassword,
                      widget.isUpperCase,
                      widget.isLowerCase,
                      widget.isnumbers,
                      widget.isSpecialCharacters,
                      BlocProvider.of<SaveGeneratedDataBloc>(context));
                  // }
                  // Navigator.pop(context);
                },
                text1: 'Save',
                bgColor: const Color(0xFF4FD1D9),
                bdRadius: 8.r,
              ),
            ],
          )
        ],
      ),
    );
  }
}
