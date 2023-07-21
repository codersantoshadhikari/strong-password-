import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:strong_password_generator/bloc/save_generated_data_bloc.dart';
import 'package:strong_password_generator/model/save_password_model.dart';

class SaveScreen extends StatefulWidget {
  // final String generatedPassword;
  // final List<String> savedPasswords;

  const SaveScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
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
        backgroundColor: Colors.indigo, // Dark blue app bar
        title: const Text('Saved Passwords',
            style: TextStyle(color: Colors.white)), // White title text
      ),
      backgroundColor: Colors.white,
      body: BlocBuilder<SaveGeneratedDataBloc, SaveGeneratedDataState>(
        builder: (context, state) {
          return ListView.builder(
              itemCount: state.savedPasswords.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    "Generated Password :${state.savedPasswords[index].generatedPassword}"),
                                Text(
                                    "Created date: ${state.savedPasswords[index].date}"),
                                Text(
                                    "Created time: ${state.savedPasswords[index].time}")
                              ]),
                        ),
                      ),
                      Expanded(
                          child: GestureDetector(
                              onTap: () {
                                var oldPassword = SaveGeneratedPasswordModel(
                                    id: state.savedPasswords[index].id,
                                    generatedPassword: state
                                        .savedPasswords[index]
                                        .generatedPassword,
                                    date: state.savedPasswords[index].date,
                                    time: state.savedPasswords[index].time);
                                BlocProvider.of<SaveGeneratedDataBloc>(context)
                                    .add(DeleteOldPassword(
                                        modelListofSavedPassword: oldPassword));
                              },
                              child: Icon(
                                Icons.delete,
                                size: 25.sp,
                                color: Colors.red,
                              )))
                    ],
                  ),
                );
              });
        },
      ),
    );
  }
}
