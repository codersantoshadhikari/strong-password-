import 'package:fast_pw_manager/constants/app_icons.dart';
import 'package:fast_pw_manager/password_gen/bloc/save_generated_data_bloc.dart';
import 'package:fast_pw_manager/saved_password_view/split_widget/password_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PasswordListViewWidget extends StatelessWidget {
  const PasswordListViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SaveGeneratedDataBloc, SaveGeneratedDataState>(
      builder: (context, state) {
        return SizedBox(
          height: 570,
          child: state.savedPasswords.isEmpty
              ? Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50.h,
                      ),
                      Image.asset(
                        AppIcons.emptyListIcon,
                        width: 200.w,
                        height: 200.h,
                      ),
                      Padding(
                        padding: EdgeInsets.all(35.sp),
                        child: Text(
                          'Looks like page is empty. Start adding new items',
                          style: TextStyle(
                            fontSize: 20.sp,
                            color: Colors.black38,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                )
              : ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: state.savedPasswords.length,
                  itemBuilder: (context, index) {
                    final passwordData = state.savedPasswords[index];
                    return PasswordCardWidget(passwordData: passwordData);
                  },
                ),
        );
      },
    );
  }
}
