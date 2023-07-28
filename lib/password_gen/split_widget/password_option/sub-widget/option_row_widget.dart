import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OptionRowCardWidget extends StatelessWidget {
  const OptionRowCardWidget({
    super.key,
    this.iconAsset,
    required this.text,
    required this.value,
    required this.onChanged,
  });
  final String? iconAsset;
  final String text;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (value == true) {
          onChanged(false);
        } else {
          onChanged(true);
        }
      },
      child: Container(
        height: 40.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          color: Colors.white,
        ),
        child: Row(
          children: [
            // if (iconAsset != null)
            Expanded(
              flex: 1,
              child: Padding(
                  padding: EdgeInsets.only(left: 25.w),
                  child: SvgPicture.asset(
                    iconAsset!,
                    width: 35.w,
                    height: 35.h,
                  )),
            ),
            Expanded(
              flex: iconAsset != null ? 2 : 3,
              child: Text(text),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.only(right: 5.w),
                child: Switch(
                  activeColor: const Color(0xFF4FD1D9),
                  activeTrackColor: const Color(0xFFD9F3F9),
                  value: value,
                  onChanged: onChanged,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
