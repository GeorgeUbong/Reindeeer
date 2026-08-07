//add hice type adapter
import 'package:hive/hive.dart';
part 'note_Model.g.dart';

@HiveType(typeId: 0)
class Note {
  @HiveField(0)
  int id;

  @HiveField(1)
  String title;

  @HiveField(2)
  String content;

  @HiveField(3)
  DateTime createdAt;

  Note({
    required this.id,
    required this.title,
    required this.content,
    required this.createdAt,
  });

  factory Note.fromJson(Map<String, dynamic> json) {
    return Note(
      id: json['id'] as int,
      title: json['title'] as String,
      content: json['content'] as String,
      createdAt: json['createdAt'] as DateTime,
    );               
  }
}
