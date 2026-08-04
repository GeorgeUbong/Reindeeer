//view model is the conessiuer: talking to the view and the model

import 'package:flutter/material.dart';

import '../model/note_Model.dart';

class listModel extends ChangeNotifier {
  List<Note> notes = [
    //Note(id: 1, title: 'myage', content: 'content', createdAt: )
  ];

  //add a note
  void addNote(String title, String content) {
    notes.add(
      Note(
        id: notes.length + 1,
        title: title,
        content: content,
        // updatedAt: DateTIme.
        createdAt: DateTime.now(),
      ),
    );
    notifyListeners();
  }

  void honkHonk() {
    print(notes);
  }

  void deleteNote(int id) {
    final notesLength = notes.length;
    notes.removeWhere((note) => note.id == id);

    if (notes.length == notesLength) {
      print('not found');
    } else {
      print('note deleted');
    }
    /**if(id < 0 || id >= notes.length){
    print('note not found');
    return ;
  } else {
    notes.removeAt(id);
    return print('note deleted');
  } */
    notifyListeners();
  }

  //update a note
  void updateNote({
    required int id,
    required String title,
    required String content,
    required DateTime createdAt,
  }) {
    final newNote = notes.indexWhere((notes) => notes.id == id);

    if (id != -1) {
      notes[newNote] = Note(
        id: notes[newNote].id,
        title: title,
        content: content,
        createdAt: createdAt,
      );
    }
    notifyListeners();
    return print('note updated');
  }
}
