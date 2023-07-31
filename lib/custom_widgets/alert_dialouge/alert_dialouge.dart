import 'package:flutter/material.dart';

import '../../password_gen/save_password_component/save_password_component_alert_dialougebox.dart';

Future<dynamic> showDialogBoxShowingCompenentToSavePassword(
    BuildContext context,
    String generatedPassword,
    bool isLowerCase,
    bool isUpperCase,
    bool isnumbers,
    bool isSpecialCharacters) {
  return showDialog(
    context: context,
    builder: (context) {
      return SavePasswordComponentAlert(
        generatedPassword: generatedPassword,
        isLowerCase: isLowerCase,
        isSpecialCharacters: isSpecialCharacters,
        isUpperCase: isUpperCase,
        isnumbers: isnumbers,
      );
    },
  );
}
