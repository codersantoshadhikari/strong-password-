import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class SaveGeneratedPasswordModel extends Equatable {
  final String id;
  final String generatedPassword;
  final String date;
  final String time;
  final String category;
  final String userName;
  final int chosenIndex;

  const SaveGeneratedPasswordModel({
    required this.id,
    required this.generatedPassword,
    required this.date,
    required this.time,
    required this.category,
    required this.chosenIndex,
    required this.userName, required choosedIndex,
  });

  SaveGeneratedPasswordModel copyWith({
    String? id,
    String? generatedPassword,
    String? date,
    String? time,
    String? category,
    int? chosenIndex,
    String? userName,
  }) {
    return SaveGeneratedPasswordModel(
      id: id ?? this.id,
      generatedPassword: generatedPassword ?? this.generatedPassword,
      date: date ?? this.date,
      time: time ?? this.time,
      category: category ?? this.category,
      chosenIndex: chosenIndex ?? this.chosenIndex,
      userName: userName ?? this.userName,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'generatedPassword': generatedPassword,
      'date': date,
      'time': time,
      'category': category,
      'userName': userName,
      'chosenIndex':chosenIndex
    };
  }

  factory SaveGeneratedPasswordModel.fromMap(Map<String, dynamic> map) {
    return SaveGeneratedPasswordModel(
      id: map['id'] ?? '',
      generatedPassword: map['generatedPassword'] ?? '',
      date: map['date'] ?? '',
      time: map['time'] ?? '',
      category: map['category'] ?? '',
      userName: map['userName'] ?? '',
      chosenIndex: map['chosenIndex'] ?? -1,
    );
  }

  @override
  List<Object?> get props => [id, generatedPassword, date, time, category,userName,chosenIndex];
}
