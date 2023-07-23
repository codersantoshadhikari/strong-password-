import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class SaveGeneratedPasswordModel extends Equatable {
  final String id;
  final String generatedPassword;
  final String date;
  final String time;
  final List<String>? category;


  const SaveGeneratedPasswordModel({
    required this.id,
    required this.generatedPassword,
    required this.date,
    required this.time, this.category,
  });
  SaveGeneratedPasswordModel copyWith({
    String? id,
   String? generatedPassword,
  String? date,
  String? time,
  List<String>? category
  }) {
    return SaveGeneratedPasswordModel(
      id: id ?? this.id,
      generatedPassword: generatedPassword?? this.generatedPassword,
      date: date?? this.date,
      time: time?? this.time,
      category: category?? this.category
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
    'generatedPassword':generatedPassword,
    'date':date,
    'time': time,
    'category':category
    };
  }

  factory SaveGeneratedPasswordModel.fromMap(Map<String, dynamic> map) {
    return SaveGeneratedPasswordModel(
      id: map['id'] ?? '',
     generatedPassword: map['generatedPassword']?? '',
     date: map['date']?? '',
     time: map['time']?? '',
      category: map['category'] != null
          ? List<String>.from(map['category'])
          : null,
    );
  }

  @override
  List<Object?> get props => [
        id,
        generatedPassword,
        date,
        time,
        category
      ];
}
