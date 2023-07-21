part of 'save_generated_data_bloc.dart';

// abstract class SaveGeneratedDataState extends Equatable {
//   const SaveGeneratedDataState();
  
//   @override
//   List<Object> get props => [];
// }

// class SaveGeneratedDataInitial extends SaveGeneratedDataState {}
class SaveGeneratedDataState extends Equatable {
  const SaveGeneratedDataState(
      {this.savedPasswords = const <SaveGeneratedPasswordModel>[],
      this.status = PasswordSavedActionStatus.initial});
  final List<SaveGeneratedPasswordModel> savedPasswords;
  final PasswordSavedActionStatus status;

  @override
  List<Object> get props => [savedPasswords,status];
  Map<String, dynamic> toMap() {
    return {'savedPasswordEvent': savedPasswords.map((e) => e.toMap()).toList()};
  }

  factory SaveGeneratedDataState.fromMap(Map<String, dynamic> map) {
    return SaveGeneratedDataState(
        savedPasswords: List<SaveGeneratedPasswordModel>.from(
            map['savedPasswordEvent']
                ?.map((e) => SaveGeneratedPasswordModel.fromMap(e))));
  }

  SaveGeneratedDataState copywith({
    List<SaveGeneratedPasswordModel>? savedPasswords,
    PasswordSavedActionStatus? status,
  }) {
    return SaveGeneratedDataState(
        savedPasswords: savedPasswords ?? this.savedPasswords, status: status ?? this.status);
  }
}
