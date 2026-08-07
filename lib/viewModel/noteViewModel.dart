import '../model/note_Model.dart';
import '../service/apiService.dart';

import 'package:flutter/material.dart';

class NoteList extends ChangeNotifier {
  final ApiService _api = ApiService();

  List<Note> notes = [];
  bool isLoading = false;

  //get function

  Future<void> getNotes() async {
    isLoading = true;
    notifyListeners();
    try {
      notes = await _api.getNotes();
    } catch (e) {
      print(e);
    }
    isLoading = false;
    notifyListeners();
  }

  Future<void> addNote(String title, String content) async {
    await _api.addNote(title, content);
    await getNotes();
    notifyListeners();
  }

  //update note
  Future<void> updateNote(int id, String title, String content) async {
    await _api.updateNote(id, title, content);
    await getNotes();
    notifyListeners();
  }

  //Delete nore
  Future<void> deleteNote(int id) async {
    await _api.deleteNote(id);
    await getNotes();
    notifyListeners();
  }
}
