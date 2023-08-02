import 'package:fast_pw_manager/password_gen/bloc/save_generated_data_bloc.dart';
import 'package:fast_pw_manager/saved_password_view/split_widget/password_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PasswordListViewWidget extends StatelessWidget {
  const PasswordListViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SaveGeneratedDataBloc, SaveGeneratedDataState>(
      builder: (context, state) {
        return SizedBox(
          height: 570,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: state.savedPasswords.length,
            itemBuilder: (context, index) {
              final passwordData = state.savedPasswords[index];
              return  PasswordCardWidget(passwordData: passwordData);
            },
          ),
        );
      },
    );
  }
}
