//methods
import 'package:hive_flutter/hive_flutter.dart';
import '../model/note_Model.dart';

class Hiveservice {
  final Box<Note> _box = Hive.box<Note>("notes");

  List<Note> getNotes() {
    return _box.values.toList();
  }

  Future<void> addNote({
    required String title,
    required String content,
  }) async {
    final nextId = _box.values.isEmpty
        ? 1
        : _box.values
              .map((n) => n.id)
              .reduce((a, b) => a > b ? a : b) +
          1;

    final note = Note(
      id: nextId,
      title: title,
      content: content,
      createdAt: DateTime.now(),
    );

    await _box.add(note);
  }


  Future<void> updateNote(int index, Note note) async {
    await _box.putAt(index, note);
  }

  Future<void> deleteNote(int index) async {
    await _box.deleteAt(index);
  }
}
