import 'lesson.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Pupils {
  // 1
  String firstName;
  String? lasttName;
  String? instructorName;
  String? instructorId;
  int? credit;
  String? schoolId;
  List<Lesson>? lessons;
  String? referenceId;

  Pupils(this.firstName,
      {this.lasttName,
      required this.instructorName,
      this.referenceId,
      required this.lessons});

  factory Pupils.fromSnapshot(DocumentSnapshot snapshot) {
    final newPupil = Pupils.fromJson(snapshot.data() as Map<String, dynamic>);
    newPupil.referenceId = snapshot.reference.id;
    return newPupil;
  }

  factory Pupils.fromJson(Map<String, dynamic> json) => _pupilFromJson(json);

  Map<String, dynamic> toJson() => _pupilToJson(this);

  @override
  String toString() => 'Pupil<$firstName>';
}


Pupils _pupilFromJson(Map<String, dynamic> json) {
  return Pupils(json['first_name'] as String,
      lasttName: json['last_name'] as String?,
      instructorName: json['instructor_name'] as String,
      lessons: _convertLessons(json['lesson'] as List<dynamic>));
}


List<Lesson> _convertLessons(List<dynamic> lessonMap) {
  final lessons = <Lesson>[];

  for (final lesson in lessonMap) {
    lessons.add(Lesson.fromJson(lesson as Map<String, dynamic>));
  }
  return lessons;
}

// 3
Map<String, dynamic> _pupilToJson(Pupils instance) => <String, dynamic>{
      'first_name': instance.firstName,
      'last_name': instance.lasttName,
      'instructor_name': instance.instructorName,
      'lesson': _lessonList(instance.lessons),
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
