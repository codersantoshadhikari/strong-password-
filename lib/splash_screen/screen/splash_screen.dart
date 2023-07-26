import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fast_pw_manager/splash_screen/split_widget/button_widget.dart';
import 'package:fast_pw_manager/splash_screen/split_widget/logo_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<EdgeInsets> _imagePositionAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _imagePositionAnimation = Tween<EdgeInsets>(
      begin: EdgeInsets.only(top: 270.h),
      end: EdgeInsets.only(top: 260.h),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.0, 0.5, curve: Curves.easeInOut),
    ));

    _controller.forward(); // Start the first animation
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(
          0xFF1C0141), // Change this to your desired background color
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Positioned(
                    top: _imagePositionAnimation.value.top,
                    child: const LogoWidget(),
                  );
                }),
            Positioned(top: 550.h, child: const ButtonWidget()),
          ],
        ),
      ),
    );
  }
}
