// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:equatable/equatable.dart';

// // ignore: must_be_immutable
// class SaveGeneratedPasswordModel extends Equatable {
//   final String id;
//   final String generatedPassword;
//   final String dateTime;

//   const SaveGeneratedPasswordModel({
//     required this.id,
//     required this.generatedPassword,
//     required this.dateTime,
//   });
//   SaveGeneratedPasswordModel copyWith({
//     String? id,
//     String? generatedPassword,
//     String? dateTime,
//   }) {
//     return SaveGeneratedPasswordModel(
//       id: id ?? this.id,
//       generatedPassword: generatedPassword ?? this.generatedPassword,
//       dateTime: dateTime ?? this.dateTime,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return {
//       'id': id,
//       'generatedPassword': generatedPassword,
//       'dateTime': dateTime,
//     };
//   }

//   factory SaveGeneratedPasswordModel.fromMap(Map<String, dynamic> map) {
//     return SaveGeneratedPasswordModel(
//       id: map['id'] ?? '',
//       generatedPassword: map['generatedPassword'] ?? '',
//       dateTime: map['dateTime'] ?? '',
//     );
//   }

//   @override
//   List<Object?> get props => [id, generatedPassword, dateTime];
// }
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class SaveGeneratedPasswordModel extends Equatable {
  final String id;
  final String generatedPassword;
  final String date;
  final String time;

  const SaveGeneratedPasswordModel({
    required this.id,
    required this.generatedPassword,
    required this.date,
    required this.time
  });
  SaveGeneratedPasswordModel copyWith({
    String? id,
   String? generatedPassword,
  String? date,
  String? time
  }) {
    return SaveGeneratedPasswordModel(
      id: id ?? this.id,
      generatedPassword: generatedPassword?? this.generatedPassword,
      date: date?? this.date,
      time: time?? this.time
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
    'generatedPassword':generatedPassword,
    'date':date,
    'time': time
    };
  }

  factory SaveGeneratedPasswordModel.fromMap(Map<String, dynamic> map) {
    return SaveGeneratedPasswordModel(
      id: map['id'] ?? '',
     generatedPassword: map['generatedPassword']?? '',
     date: map['date']?? '',
     time: map['time']?? ''
    );
  }

  @override
  List<Object?> get props => [
        id,
        generatedPassword,
        date,
        time
      ];
}
