// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialMediaIcons extends StatefulWidget {
  const SocialMediaIcons({super.key, required this.listOfIcons,
    required this.onIconSelected,});
    final List<String> listOfIcons;
  final Function(int) onIconSelected;

  @override
  State<SocialMediaIcons> createState() => _SocialMediaIconsState();
}

class _SocialMediaIconsState extends State<SocialMediaIcons> {
  int choosedImageIndex = -1;
  @override
  Widget build(BuildContext context) {
     return Column(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
          child: Text(
            "Choose Your Preferred Social Media Platform",
            style: TextStyle(
              fontSize: 15.sp,
              color: Colors.black38,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 20),
          child: SizedBox(
            height: 50.h,
            width: 400,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: widget.listOfIcons.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        choosedImageIndex = index;
                      });
                      widget.onIconSelected(index);
                    },
                    child: SizedBox(
                      height: 30.h,
                      width: 35.w,
                      child: SvgPicture.asset(
                        widget.listOfIcons[index],
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}