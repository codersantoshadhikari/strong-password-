import 'package:fast_pw_manager/custom_widgets/text_field/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FormFieldWidget extends StatelessWidget {
  const FormFieldWidget({super.key,required this.userNameController,
    required this.passwordController,
    required this.userNameFocusNode,
    required this.passwordFocusNode,});
   final TextEditingController userNameController;
  final TextEditingController passwordController;
  final FocusNode userNameFocusNode;
  final FocusNode passwordFocusNode;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 20.h),
          child: CustomTextFieldWidget(
            focusNode: userNameFocusNode,
            textColor: Colors.black87,
            controller: userNameController,
            inputAction: TextInputAction.next,
            validator: (value) {
              if ((value ?? '').isEmpty) {
                return 'Username cannot be empty';
              } else {
                return null;
              }
            },
            radius: 15.r,
            borderSide: const BorderSide(width: 2, color: Color(0xFF4FD1D9)),
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
            focusNode: passwordFocusNode,
            textColor: Colors.black87,
            controller: passwordController,
            inputAction: TextInputAction.done,
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
    );
  }
}