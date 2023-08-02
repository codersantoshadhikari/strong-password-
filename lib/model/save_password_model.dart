import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class SaveGeneratedPasswordModel extends Equatable {
  final String id;
  final String generatedPassword;
  final String date;
  final String time;
  final String category;
  final String userName;
  final int choosedIndex;

  const SaveGeneratedPasswordModel({
    required this.id,
    required this.generatedPassword,
    required this.date,
    required this.time,
    required this.category,
    required this.choosedIndex,
    required this.userName
  });
  SaveGeneratedPasswordModel copyWith(
      {String? id,
      String? generatedPassword,
      String? date,
      String? time,
      String? category,
      int? choosedIndex,
      String? userName}) {
    return SaveGeneratedPasswordModel(
        id: id ?? this.id,
        generatedPassword: generatedPassword ?? this.generatedPassword,
        date: date ?? this.date,
        time: time ?? this.time,
        category: category ?? this.category,
        choosedIndex: choosedIndex?? this.choosedIndex,
        userName:userName??this.userName
        );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'generatedPassword': generatedPassword,
      'date': date,
      'time': time,
      'category': category,
      'userName':userName
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
      choosedIndex: map['choosedIndex']?? -1
    );
  }

  @override
  List<Object?> get props => [id, generatedPassword, date, time, category];
}
