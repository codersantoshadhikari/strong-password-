// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:math';
import 'package:fast_pw_manager/custom_widgets/snackbar/snackbar.dart';
import 'package:fast_pw_manager/password_gen/bloc/save_generated_data_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:fast_pw_manager/function/generate_unique_id.dart';
import 'package:fast_pw_manager/model/save_password_model.dart';

class PasswordGeneratorUtils {
  static String generatePassword({
    double currentPasswordLength = 8,
    bool isUpperCase = false,
    bool isLowerCase = true,
    bool isNumbers = false,
    bool isSpecialCharacters = false,

  }) {
    final random = Random();
    String charset = '';

    if (isUpperCase) {
      charset += 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    }
    if (isLowerCase) {
      charset += 'abcdefghijklmnopqrstuvwxyz';
    }
    if (isNumbers) {
      charset += '0123456789';
    }
    if (isSpecialCharacters) {
      charset += '!@#\$%^&*()';
    }

    String password = '';

    for (int i = 0; i < currentPasswordLength; i++) {
      password += charset[random.nextInt(charset.length)];
    }

    return password;
  }

  static void copyToClipboard(String generatedPassword,BuildContext context) {
    Clipboard.setData(ClipboardData(text: generatedPassword));
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          duration: Duration(seconds: 1),
          elevation: 0,
          backgroundColor: Colors.transparent,
          behavior: SnackBarBehavior.floating,
          content: CustomSnackBarMessage(
              headerText: "Done!",
              bodyText: "Sucessfully,Copied the Password",
              backgroundColor: Color(0xFFD9F9E1),
              bubbleColor: Color(0xFF5FA773),
textColor: Color(0xFF5FA773),
              iconToShowInbubble: Icon(
                Icons.check,
                color: Color(0xFFFFFFFF),
              )),
        ));
    // Show a snackbar or toast message here if needed.
  }

  static void savePassword(
    String generatedPassword,
    bool _upperCase,
    bool _lowerCase,
    bool _numbers,
    bool _specialCharacters,
    SaveGeneratedDataBloc bloc,
    int choosedImageIndex,
    String userName,
    String socialMediaNAme,
  ) {
    if (generatedPassword.isNotEmpty) {
      List<String> category = [];

      // Add the selected options to the list based on their values
      if (_upperCase) {
        category.add('UpperCase');
      }
      if (_lowerCase) {
        category.add('LowerCase');
      }
      if (_numbers) {
        category.add('Numbers');
      }
      if (_specialCharacters) {
        category.add('SpecialCharacters');
      }
      final savedData = SaveGeneratedPasswordModel(
          id: generateUniqueId('Pass-'),
          generatedPassword: generatedPassword,
          date: DateTime.now().toString().split(' ').first,
          time: DateFormat('hh:mm a').format(DateTime.now()),
          category: "null",
          userName: userName,
          chosenIndex:choosedImageIndex,
          socialMediaName: socialMediaNAme);
      bloc.add(
        SaveNewGeneratedPassword(modelListofSavedPassword: savedData),
      );
    }
  }
}
