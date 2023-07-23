import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nepali_fortify/bloc/save_generated_data_bloc.dart';
import 'package:nepali_fortify/constants/app_icons.dart';
import 'package:nepali_fortify/model/save_password_model.dart';
import 'package:nepali_fortify/password_gen/split_widget/password_generator_utils/password_generator_utils.dart';

class SaveScreen extends StatefulWidget {
  const SaveScreen({Key? key}) : super(key: key);

  @override
  _SaveScreenState createState() => _SaveScreenState();
}

class _SaveScreenState extends State<SaveScreen> {
  final TextEditingController _editingController = TextEditingController();
  // ignore: unused_field

  @override
  void dispose() {
    _editingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            const Color.fromARGB(255, 44, 52, 97), // Dark blue app bar
        title: const Text(
          'Saved Passwords',
          style: TextStyle(color: Colors.white), // White title text
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 129, 102, 102),
      body: BlocBuilder<SaveGeneratedDataBloc, SaveGeneratedDataState>(
        builder: (context, state) {
          return ListView.builder(
            itemCount: state.savedPasswords.length,
            itemBuilder: (context, index) {
              return Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 90.h),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.arrow_back,
                              size: 30.sp,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10.h),
                            child: Text(
                              "My Passwords",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Roboto',
                                fontSize: 24.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1.5.w,
                          color: const Color(0xFF797878).withOpacity(0.5),
                        ),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: SvgPicture.asset(
                              AppIcons.searchIcon,
                              color: const Color(0xFF797878).withOpacity(0.7),
                              height: 30.h,
                              width: 30.w,
                            ),
                          ),
                          const Expanded(
                            flex: 3,
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Search Passwords...',
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 590,
                      child: BlocBuilder<SaveGeneratedDataBloc,
                          SaveGeneratedDataState>(
                        builder: (context, state) {
                          return ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: state.savedPasswords.length,
                            itemBuilder: (context, index) {
                              final passwordData = state.savedPasswords[index];
                              return Dismissible(
                                key: UniqueKey(),
                                background: Container(
                                  decoration: BoxDecoration(
                                    color: const Color(0xCCDC4E59),
                                    borderRadius: BorderRadius.circular(15.r),
                                  ),
                                  alignment: Alignment.centerRight,
                                  padding: const EdgeInsets.only(right: 20.0),
                                  child: const Icon(
                                    Icons.delete,
                                    color: Colors.white,
                                  ),
                                ),
                                direction: DismissDirection
                                    .endToStart, // Swipe direction
                                onDismissed: (direction) {
                                  var oldSavedPassword =
                                      SaveGeneratedPasswordModel(
                                    id: state.savedPasswords[index].id,
                                    generatedPassword: state
                                        .savedPasswords[index]
                                        .generatedPassword,
                                    date: state.savedPasswords[index].date,
                                    time: state.savedPasswords[index].time,
                                    category:
                                        state.savedPasswords[index].category,
                                  );
                                  BlocProvider.of<SaveGeneratedDataBloc>(
                                          context)
                                      .add(DeleteOldPassword(
                                          modelListofSavedPassword:
                                              oldSavedPassword));
                                },
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: SizedBox(
                                    child: Padding(
                                      padding: EdgeInsets.all(15.sp),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Expanded(
                                                flex: 3,
                                                child: Text(
                                                  passwordData
                                                      .generatedPassword,
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    copyToClipboard(state
                                                        .savedPasswords[index]
                                                        .generatedPassword);
                                                  },
                                                  child: SvgPicture.asset(
                                                      AppIcons.copyIcon),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 20.h),
                                          Row(
                                            children: [
                                              Expanded(
                                                flex: 3,
                                                child: Text(passwordData.date),
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: Text(passwordData.time),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }

  void copyToClipboard(String generatedPassword) {
    PasswordGeneratorUtils.copyToClipboard(generatedPassword);
  }
}
