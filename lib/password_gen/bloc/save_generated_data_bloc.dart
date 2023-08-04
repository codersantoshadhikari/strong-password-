import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:flash_pw_manager/enum/password_saved_status.dart';
import 'package:flash_pw_manager/model/save_password_model.dart';

part 'save_generated_data_event.dart';
part 'save_generated_data_state.dart';

class SaveGeneratedDataBloc
    extends HydratedBloc<SaveGeneratedDataEvent, SaveGeneratedDataState> {
  SaveGeneratedDataBloc()
      : super(const SaveGeneratedDataState(
            status: PasswordSavedActionStatus.initial)) {
    on<SaveNewGeneratedPassword>(_onAddEvent);
    on<DeleteOldPassword>(_onDeleteEvent);
  }

  void _onAddEvent(
      SaveNewGeneratedPassword event, Emitter<SaveGeneratedDataState> emit) {
    emit(state.copywith(
        status: PasswordSavedActionStatus.isSaved,
        savedPasswords: List.from(state.savedPasswords)
          ..add(event.modelListofSavedPassword)));
  }

  void _onDeleteEvent(
      DeleteOldPassword event, Emitter<SaveGeneratedDataState> emit) {
    emit(state.copywith(
        status: PasswordSavedActionStatus.isDeleted,
        savedPasswords: List.from(state.savedPasswords)
          ..remove(event.modelListofSavedPassword)));
  }

  @override
  SaveGeneratedDataState? fromJson(Map<String, dynamic> json) {
    return SaveGeneratedDataState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(SaveGeneratedDataState state) {
    return state.toMap();
  }
}
