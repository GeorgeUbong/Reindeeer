import 'package:flutter/material.dart';
import '../Models/note_model.dart';

class NotesViewModel extends ChangeNotifier {
  final List<Note> _notes = [];
  List<Note> get notes => List.unmodifiable(_notes);

  //Add note logic
  void addNote(String title, String content) {
    if (title.isEmpty && content.isEmpty) return;

    final newNote = Note(
      id: DateTime.now().toString(),
      title: title,
      content: content,
      createdAt: DateTime.now(),
    );

    _notes.insert(0, newNote);
    notifyListeners();
  }

  void deleteNote(String id){
    _notes.removeWhere((note) => note.id == id);
    notifyListeners();
  }
  
}