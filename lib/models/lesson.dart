import 'package:cloud_firestore/cloud_firestore.dart';

class Lesson {
  // 1
  final String? lesson;
  int? drivingFault;
  final int? duration;
  bool? isPhysicalAction;
  String? lessonType;
  String? privateNote;
  String? result;
  int? serioufault;
  String? summary;
  String? testCentre;
  DateTime? testtime;
  String? vehicle;
  final DateTime lessonDate;

  // 2
  Lesson(this.lesson, {required this.lessonDate, this.duration});
  // 3
  factory Lesson.fromJson(Map<String, dynamic> json) => _lessonFromJson(json);
  // 4
  Map<String, dynamic> toJson() => _lessonToJson(this);

  @override
  String toString() => 'Lesson<$lesson>';
}

// 1
Lesson _lessonFromJson(Map<String, dynamic> json) {
  return Lesson(
    json['lesson_type'] as String,
    lessonDate: (json['lesson_date'] as DateTime),
    duration: json['duration'] as int,
  );
}

// 2
Map<String, dynamic> _lessonToJson(Lesson instance) => <String, dynamic>{
      'lesson_type': instance.lessonType,
      'lesson_date': instance.lessonDate,
      'durationon': instance.duration,
    };
