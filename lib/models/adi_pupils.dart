import 'vaccination.dart';
import 'lesson.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Pupils {
  // 1
  String? firstName;
  String? lasttName;
  String? instructorName;
  String? instructorId;
  int?credit;
  String?schoolId;  
  // 2
  List<Lesson>? lessons;
  // 3
  String? referenceId;
  // 4
  Pupils(this.firstName,
      {this.lasttName,
      required this.instructorName,
      this.referenceId,
      required this.lessons});
  // 5
  factory Pupils.fromSnapshot(DocumentSnapshot snapshot) {
    final newPupil = Pupils.fromJson(snapshot.data() as Map<String, dynamic>);
    newPupil.referenceId = snapshot.reference.id;
    return newPupil;
  }
  // 6
  factory Pupils.fromJson(Map<String, dynamic> json) => _pupilFromJson(json);
  // 7
  Map<String, dynamic> toJson() => _pupilToJson(this);

  @override
  String toString() => 'Pupil<$firstName>';
}

// 1
Pupils _pupilFromJson(Map<String, dynamic> json) { 
  return Pupils(json['first_name'] as String,
      lasttName: json['last_name'] as String?,
      instructorName: json['instructor_name'] as String,
      lessons:
          _convertLessons(json['lessons'] as List<dynamic>));
}

// 2
List<Lesson> _convertLessons(List<dynamic> lessonMap) {
  final lessons = <Lesson>[];

  for (final lesson in lessonMap) {
    lessons.add(Lesson.fromJson(lesson as Map<String,dynamic>));
  }
  return lessons;
}

// 3
Map<String, dynamic> _pupilToJson(Lesson instance) => <String, dynamic>{
      'lesson_date': instance.lessonDate,
      'duration': instance.duration,
      'lesson_type': instance.lessonType,
      'lessons': _lessonList(instance.lessons),
    };
// 4
List<Map<String, dynamic>>? _lessonList(List<Lesson>? lessons) {
  if (lessons == null) {
    return null;
  }
  final lessonMap = <Map<String, dynamic>>[];
  lessons.forEach((lesson) {
    lessonMap.add(lesson.toJson());
  });
  return lessonMap;
}
