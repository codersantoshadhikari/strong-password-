// import 'package:equatable/equatable.dart';
// import 'package:hydrated_bloc/hydrated_bloc.dart';
// import 'package:strong_password_generator/enum/password_saved_status.dart';
// import 'package:strong_password_generator/model/save_password_model.dart';

// part 'save_generated_password_event.dart';
// part 'save_generated_password_state.dart';

// // class SaveGeneratedPasswordBloc extends HydratedBloc<SaveGeneratedPasswordEvent,
// //     SaveGeneratedPasswordState> {
// //   SaveGeneratedPasswordBloc()
// //       : super(SaveGeneratedPasswordState(
// //             savedActionStatus: PasswordSavedActionStatus.initial)) {
// //     on<SaveNewPassword>(_onSaveNewPassword);
// //     on<DeleteOldPassword>(_onDeleteOldPassword);
// //   }
// //   void _onAddEvent(
// //       SaveNewPassword event, Emitter<SaveGeneratedPasswordState> emit) {
// //     emit(state.copywith(
// //         status: ReminderActionStatus.newReminderCreated,
// //         savedEvents: List.from(state.savedEvents)
// //           ..add(event.modelListofGeneralReminderTitleTime)));
// //   }

// //   @override
// //   SaveGeneratedPasswordState? fromJson(Map<String, dynamic> json) {
// //     // TODO: implement fromJson
// //     throw UnimplementedError();
// //   }

// //   @override
// //   Map<String, dynamic>? toJson(SaveGeneratedPasswordState state) {
// //     // TODO: implement toJson
// //     throw UnimplementedError();
// //   }
// // }
// class SaveGeneratedPasswordBloc
//     extends HydratedBloc<SaveGeneratedPasswordEvent, SaveGeneratedPasswordState> {
//   SaveGeneratedPasswordBloc()
//       : super(const SaveGeneratedPasswordState(
//             savedActionStatus: PasswordSavedActionStatus.initial )) {
//     on<SaveNewPassword>(_onAddEvent);
//     on<DeleteOldPassword>(_onDeleteEvent);
//   }

//   void _onAddEvent(
//       SaveNewPassword event, Emitter<SaveGeneratedPasswordState> emit) {
//     emit(state.copywith(
//         savedActionStatus: PasswordSavedActionStatus.isSaved,
//         savedPasswords: List.from(state.savedPasswords)
//           ..add(event.modelOfSavedPassword)));
//   }

//   void _onDeleteEvent(
//       DeleteOldPassword event, Emitter<SaveGeneratedPasswordState> emit) {
//     emit(state.copywith(
//         savedActionStatus: PasswordSavedActionStatus.isSaved,
//         savedPasswords: List.from(state.savedPasswords)
//           ..remove(event.modelOfSavedPassword)));
//   }

 

//   @override
//   SaveGeneratedPasswordState? fromJson(Map<String, dynamic> json) {
//     return SaveGeneratedPasswordState.fromMap(json);
//   }

//   @override
//   Map<String, dynamic>? toJson(SaveGeneratedPasswordState state) {
//     return state.toMap();
//   }
// }
