import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:intl/intl.dart';
import 'package:nepali_fortify/bloc/save_generated_data_bloc.dart';
import 'package:nepali_fortify/custom_widgets/snackbar.dart';
// import 'package:nepali_fortify/constants/app_icons.dart';
// import 'package:nepali_fortify/function/generate_unique_id.dart';
// import 'package:nepali_fortify/model/save_password_model.dart';
import 'package:nepali_fortify/password_gen/split_widget/display_welcome_message_widget.dart';
import 'package:nepali_fortify/password_gen/split_widget/gen_password_widget.dart';
import 'package:nepali_fortify/password_gen/split_widget/generated_password_widget.dart';
import 'package:nepali_fortify/password_gen/split_widget/header_widget.dart';
import 'package:nepali_fortify/password_gen/split_widget/password_generator_utils/password_generator_utils.dart';
import 'package:nepali_fortify/password_gen/split_widget/password_option/password_option_widget.dart';
import 'package:nepali_fortify/routes/routes.dart';
// import '../../savescreen.dart';

class PasswordGeneratorScreen extends StatefulWidget {
  const PasswordGeneratorScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _PasswordGeneratorScreenState createState() =>
      _PasswordGeneratorScreenState();
}

class _PasswordGeneratorScreenState extends State<PasswordGeneratorScreen> {
  double _currentPasswordLength = 8;
  bool _isLowerCase = true;
  bool _isUpperCase = false;
  bool _isnumbers = false;
  bool _isSpecialCharacters = false;

  String generatedPassword = '';

  final TextEditingController _lengthController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _lengthController.text = _currentPasswordLength.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HeaderWidget(),
          Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.only(left: 25.w, right: 25.w, top: 10.h),
              child: Row(
                children: [
                  const Expanded(
                    flex: 4,
                    child: DisplayWelcomeWidget(),
                  ),
                  Expanded(
                    flex: 3,
                    child: GeneratePasswordWidget(
                      generatePassword: generatePassword,
                    ),
                  ),
                ],
              ),
            ),
          ),
          GeneratedPasswordStringWidget(
            ongeneratedPasswordChanged: (value) {
              setState(() {
                generatedPassword = value;
              });
            },
            generatedPassword: generatedPassword,
          ),
          Expanded(
            flex: 5,
            child: BlocBuilder<SaveGeneratedDataBloc, SaveGeneratedDataState>(
              builder: (context, state) {
                // Check if "Hero" exists in the list of state-generated passwords
                bool isPawordExist = state.savedPasswords.any((passwordData) =>
                    passwordData.generatedPassword.toLowerCase() ==
                    generatedPassword);

                return PasswordOptionChooseWidget(
                  copyToClipboard: copyToClipboard,
                  savePassword: () {
                    if (generatedPassword == '') {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        duration: Duration(seconds: 1),
                        elevation: 0,
                        backgroundColor: Colors.transparent,
                        behavior: SnackBarBehavior.floating,
                        content: CustomSnackBarMessage(
                            headerText: "Ooops!",
                            bodyText: "Forget to generate new password?",
                            backgroundColor: Color(0xCCDC4E59),
                            bubbleColor: Color(0xCCC73743),
                            iconToShowInbubble: Icon(
                              Icons.check,
                              color: Colors.white,
                            )),
                      ));
                    } else if (isPawordExist) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        duration: Duration(seconds: 1),
                        elevation: 0,
                        backgroundColor: Colors.transparent,
                        behavior: SnackBarBehavior.floating,
                        content: CustomSnackBarMessage(
                            headerText: "Sorry!",
                            bodyText:
                                "Password already exist,generate new one.",
                            backgroundColor: Color(0xCCDC4E59),
                            bubbleColor: Color(0xCCC73743),
                            iconToShowInbubble: Icon(
                              Icons.check,
                              color: Colors.white,
                            )),
                      ));
                    } else {
                      savePassword();
                    }
                  },
                  currentPasswordLength: _currentPasswordLength,
                  onPasswordLengthChanged: (value) {
                    setState(() {
                      _currentPasswordLength = value;
                    });
                  },
                  isLowerCase: _isLowerCase,
                  onLowerCaseChanged: (value) {
                    setState(() {
                      _isLowerCase = value;
                    });
                  },
                  isUpperCase: _isUpperCase,
                  onUpperCaseChanged: (value) {
                    setState(() {
                      _isUpperCase = value;
                    });
                  },
                  isNumbers: _isnumbers,
                  onNumbersChanged: (value) {
                    setState(() {
                      _isnumbers = value;
                    });
                  },
                  isSpecialCharacters: _isSpecialCharacters,
                  onSpecialCharactersChanged: (value) {
                    setState(() {
                      _isSpecialCharacters = value;
                    });
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void generatePassword() {
    setState(() {
      generatedPassword = PasswordGeneratorUtils.generatePassword(
        currentPasswordLength: _currentPasswordLength,
        isUpperCase: _isUpperCase,
        isLowerCase: _isLowerCase,
        isNumbers: _isnumbers,
        isSpecialCharacters: _isSpecialCharacters,
      );
    });
  }

  void copyToClipboard() {
    PasswordGeneratorUtils.copyToClipboard(generatedPassword);
  }

  void savePassword() {
    PasswordGeneratorUtils.savePassword(
      generatedPassword,
      _isUpperCase,
      _isLowerCase,
      _isnumbers,
      _isSpecialCharacters,
      BlocProvider.of<SaveGeneratedDataBloc>(context),
    );
    Navigator.pushNamed(context, Routes.saveGeneratedPassWordScreen);
  }
}