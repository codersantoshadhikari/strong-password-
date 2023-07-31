// ignore_for_file: deprecated_member_use

import 'package:fast_pw_manager/constants/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomTextFieldWidget extends StatefulWidget {
  const CustomTextFieldWidget(
      {super.key,
      this.controller,
      this.validator,
      this.hintText,
      this.onTap,
      this.readOnly = false,
      this.suffixIcon,
      this.maxLines,
      this.isPassword = false,
      this.textInputType,
      this.prefixIcon,
      this.backgroundColor,
      this.textColor,
      this.hintStyle,
      this.radius,
      this.verticalPadding,
      this.horizontalPadding,
      this.borderSide,
      // this.formKey,
      this.inputAction,
      this.onChanged,
      this.onFieldSubmitted,
      this.maxLength,
      this.initialValue,
      this.labelText,
      this.isError,
      this.labelStyle,
      this.floatingStyle});

  final Color? backgroundColor;
  final Color? textColor;
  final TextEditingController? controller;
  final String? hintText;
  final bool? readOnly;
  final VoidCallback? onTap;
  final String? Function(String?)? validator;
  final Widget? prefixIcon;
  final TextInputType? textInputType;
  final Widget? suffixIcon;
  final bool isPassword;
  final int? maxLines;
  final TextStyle? hintStyle;
  final double? radius;
  final double? verticalPadding;
  final double? horizontalPadding;
  final BorderSide? borderSide;
  // final GlobalKey<FormState>? formKey;
  final TextInputAction? inputAction;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final String? initialValue;
  final int? maxLength;
  final String? labelText;
  final bool? isError;
  final TextStyle? labelStyle;
  final TextStyle? floatingStyle;

  @override
  CustomTextFieldWidgetState createState() => CustomTextFieldWidgetState();
}

class CustomTextFieldWidgetState extends State<CustomTextFieldWidget> {
  late bool isPassword;

  @override
  void initState() {
    isPassword = widget.isPassword;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // enableSuggestions: false,
      // maxLengthEnforcement: MaxLengthEnforcement.enforced,
      // autofocus: true,
      onFieldSubmitted: widget.onFieldSubmitted,
      maxLength: widget.maxLength,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      initialValue: widget.initialValue,
      onChanged: widget.onChanged,
      textInputAction: widget.inputAction,
      // key: widget.formKey,
      style: TextStyle(color: widget.textColor),
      onTap: widget.onTap,
      readOnly: widget.readOnly ?? false,
      controller: widget.controller,
      obscureText: isPassword,
      validator: widget.validator,
      maxLines: widget.maxLines ?? 1,
      keyboardType: widget.textInputType,
      decoration: InputDecoration(
        // counterStyle: TextStyle(height: double.minPositive,),
        //  counterText: "",
        counterStyle:
            TextStyle(color: Theme.of(context).colorScheme.background),
        labelStyle: widget.labelStyle,
        // Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 15.sp),
        floatingLabelStyle: widget.floatingStyle,
        // Theme.of(context)
        //     .textTheme
        //     .bodyText2!
        //     .copyWith(fontSize: 18.sp, color: Colors.teal),
        labelText: widget.labelText,
        fillColor:
            widget.backgroundColor ?? Theme.of(context).colorScheme.background,
        filled: true,
        prefixIcon: widget.prefixIcon,
        contentPadding: EdgeInsets.symmetric(
          horizontal: widget.horizontalPadding ?? 12.w,
          vertical: widget.verticalPadding ?? 16.h,
        ),
        border: OutlineInputBorder(
          borderSide: widget.borderSide ??
              const BorderSide(color: Color.fromRGBO(0, 191, 165, 1)),
          borderRadius: BorderRadius.all(Radius.circular(widget.radius ?? 7.r)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: widget.borderSide ??
              const BorderSide(color: Color.fromRGBO(0, 191, 165, 1)),
          borderRadius: BorderRadius.all(Radius.circular(widget.radius ?? 7.r)),
        ),
        hintText: widget.hintText,
        hintStyle: widget.hintStyle ??
            Theme.of(context).textTheme.bodyText1!.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: 15.sp,
                  color: Colors.black54,
                ),
        suffixIcon: widget.suffixIcon ??
            (widget.isPassword
                ? InkWell(
                    onTap: () {
                      setState(() {
                        isPassword = !isPassword;
                      });
                    },
                    child: Padding(
                      padding: EdgeInsets.only(right: 25.w),
                      child: SvgPicture.asset(
                          isPassword
                              ? AppIcons.eyeshowIcon
                              : AppIcons.eyeHideIcon,
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? Colors.grey
                                  : Colors.grey),
                    ),
                  )
                : null),
      ),
    );
  }
}
