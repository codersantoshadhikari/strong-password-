// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:math';
import 'package:fast_pw_manager/password_gen/bloc/save_generated_data_bloc.dart';
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

  static void copyToClipboard(String generatedPassword) {
    Clipboard.setData(ClipboardData(text: generatedPassword));
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
          chosenIndex:choosedImageIndex);
      bloc.add(
        SaveNewGeneratedPassword(modelListofSavedPassword: savedData),
      );
    }
  }
}
