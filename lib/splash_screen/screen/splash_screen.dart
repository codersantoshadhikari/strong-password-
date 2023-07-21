// import 'dart:async';

// import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:strong_password_generator/constants/app_icons.dart';
import 'package:strong_password_generator/routes/routes.dart';
// import 'package:strong_password_generator/constants/app_icons.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:strong_password_generator/routes/routes.dart';

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
      duration: Duration(seconds: 3),
    );

    _imagePositionAnimation = Tween<EdgeInsets>(
      begin: EdgeInsets.only(top: 270.h),
      end: EdgeInsets.only(top: 260.h),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Interval(0.0, 0.5, curve: Curves.easeInOut),
    ));

    _controller.forward(); // Start the first animation

    // After 1 second, show the button
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _showButton = true;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool _showButton = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Color(0xFF1C0141), // Change this to your desired background color
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: _imagePositionAnimation.value.top,
                  child: Container(
                    width: 270.w, // Set the desired image width
                    height: 270.h, // Set the desired image height
                    child: Image.asset(AppIcons
                        .appLogo), // Replace 'your_image.png' with your image path
                  ),
                ),
                if (_showButton)
                  Positioned(
                    top: 550.h,
                    child: Container(
                      height: 40.h,
                      width: 230.w,
                      child: ElevatedButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.r),
                            )),
                            backgroundColor:
                                MaterialStateProperty.all(Color.fromARGB(255, 255, 255, 255))),
                        onPressed: () {
                          Navigator.pushNamedAndRemoveUntil(
                              context,
                              Routes.passwordGenerationScreen,
                              (route) => false);
                          // Handle button click action here
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("Let's Start Generating",
                                style: TextStyle(
                                    color: Color(0xFF1C0141),
                                    fontSize: 15.sp,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.bold)),
                            Icon(FontAwesomeIcons.fingerprint,
                                size: 25.sp, color: Color(0xFF1C0141))
                          ],
                        ),
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
  // Scaffold(
  //   backgroundColor: Color(0xFF1C0141),
  //   body: Center(child: Container(),),
  // );
}










// // import 'dart:async';

// // import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:strong_password_generator/constants/app_icons.dart';
// // import 'package:strong_password_generator/constants/app_icons.dart';
// // import 'package:flutter_screenutil/flutter_screenutil.dart';
// // import 'package:strong_password_generator/routes/routes.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({Key? key}) : super(key: key);

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
//   late AnimationController _controllerExpanded;
//   late AnimationController _controller;
//   late Animation<double> _imageAnimation;
//   late Animation<EdgeInsets> _imagePositionAnimation;
// //  late Animation<Offset> _buttonAnimation;

   
//   @override
//   void initState() {
//     super.initState();

//     _controller = AnimationController(
//       vsync: this,
//       duration: Duration(seconds: 4), // Total duration of the animation
//     );

//     // _imageAnimation = Tween<double>(
//     //   begin: 0.0,
//     //   end: 270.0,
//     // ).animate(CurvedAnimation(
//     //   parent: _controller,
//     //   curve: Curves.easeInOut,
//     // ));

//     _imagePositionAnimation = Tween<EdgeInsets>(
//       end: EdgeInsets.zero,
//       begin: EdgeInsets.only(top: 20.0),
//     ).animate(CurvedAnimation(
//       parent: _controller,
//       curve: Interval(0.5, 1.0, curve: Curves.easeInOut),
//     ));

//     _controller.forward(); // Start the animation
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFF1C0141), // Change this to your desired background color
//       body: Padding(
//         padding: EdgeInsets.only(top: 250.h,left: 70.w,right: 70.w),
//         child: Column(
//           children: [
//             AnimatedBuilder(
//               animation: _controller,
//               builder: (context, child) {
//                 return Container(
//                   margin: _imagePositionAnimation.value,
//                   width: 270.w,
//                   height: 270.h,
//                   child: Image.asset(AppIcons.appLogo), // Replace 'your_image.png' with your image path
//                 );
//               },
//             ),
//             ElevatedButton(onPressed: (){}, child: Text("Let's Go"))
//           ],
//         ),
//       ),
//     );
//   }
//     // Scaffold(
//     //   backgroundColor: Color(0xFF1C0141),
//     //   body: Center(child: Container(),),
//     // );
//   }
