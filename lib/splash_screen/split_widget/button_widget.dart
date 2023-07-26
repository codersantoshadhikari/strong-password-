import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nepali_fortify/routes/routes.dart';

class ButtonWidget extends StatefulWidget {
  const ButtonWidget({super.key});

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  @override
  void initState() {
    super.initState();
    // After 1 second, show the button
    Future.delayed(const Duration(milliseconds: 1500), () {
      setState(() {
        Navigator.pushNamedAndRemoveUntil(
            context, Routes.passwordGenerationScreen, (route) => false);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      width: 230.w,
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.r),
            ),
          ),
          backgroundColor: MaterialStateProperty.all(
              const Color.fromARGB(255, 255, 255, 255)),
        ),
        onPressed: () {
          Navigator.pushReplacementNamed(
              context, Routes.passwordGenerationScreen);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Let's Start Generating",
              style: TextStyle(
                color: const Color(0xFF1C0141),
                fontSize: 15.sp,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold,
              ),
            ),
            Icon(
              FontAwesomeIcons.fingerprint,
              size: 25.sp,
              color: const Color(0xFF1C0141),
            ),
          ],
        ),
      ),
    );
  }
}
