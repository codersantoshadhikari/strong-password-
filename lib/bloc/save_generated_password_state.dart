// // ignore_for_file: public_member_api_docs, sort_constructors_first
// part of 'save_generated_password_bloc.dart';

// class SaveGeneratedPasswordState extends Equatable {
//   const SaveGeneratedPasswordState(
//       {this.savedPasswords = const <SaveGeneratedPasswordModel>[],
//       this.savedActionStatus = PasswordSavedActionStatus.initial});
//   final List<SaveGeneratedPasswordModel> savedPasswords;
//   final PasswordSavedActionStatus savedActionStatus;

//   @override
//   List<Object> get props => [savedPasswords, savedActionStatus];
//   Map<String, dynamic> toMap() {
//     return {'savedPasswords': savedPasswords.map((e) => e.toMap().toString())};
//   }
//   factory SaveGeneratedPasswordState.fromMap(Map<String, dynamic> map) {
//     return SaveGeneratedPasswordState(
//         savedPasswords: List<SaveGeneratedPasswordModel>.from(
//             map['savedPasswords']
//                 ?.map((e) => SaveGeneratedPasswordModel.fromMap(e))));
//   }

//   SaveGeneratedPasswordState copywith({
//     List<SaveGeneratedPasswordModel>? savedPasswords,
//     PasswordSavedActionStatus? savedActionStatus
//   }) {
//     return SaveGeneratedPasswordState(
//      savedPasswords: savedPasswords ?? this.savedPasswords,
//      savedActionStatus: savedActionStatus?? this.savedActionStatus
//     );
//   }
// }
