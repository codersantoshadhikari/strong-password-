part of 'save_generated_data_bloc.dart';

abstract class SaveGeneratedDataEvent extends Equatable {
  const SaveGeneratedDataEvent();

  @override
  List<Object> get props => [];
}

class SaveNewGeneratedPassword extends SaveGeneratedDataEvent {
  final SaveGeneratedPasswordModel modelListofSavedPassword;
  const SaveNewGeneratedPassword({
    required this.modelListofSavedPassword,
  });
  @override
  List<Object> get props => [modelListofSavedPassword];
}

class DeleteOldPassword extends SaveGeneratedDataEvent {
  final SaveGeneratedPasswordModel modelListofSavedPassword;
  const DeleteOldPassword({
    required this.modelListofSavedPassword,
  });
  @override
  List<Object> get props => [];
}

