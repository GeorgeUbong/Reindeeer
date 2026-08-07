//api service

import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/note_Model.dart';

class ApiService {
  final String baseUrl = 'https://reindeerbackend.onrender.com';

  //get function
  Future<List<Note>> getNotes() async {
    final response = await http.get(Uri.parse("$baseUrl/notes"));

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      return data.map((json) => Note.fromJson(json)).toList();
    } else {
      throw Exception("Failed to load: retry");
    }
  }

  //addNote
  Future<void> addNote(String title, String content) async {
    final response = await http.post(
      Uri.parse("$baseUrl/add"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"title": title, "content": content}),
    );
    if (response.statusCode != 200) {
      throw Exception("Failed to create Note");
    }
  }

  //update Note
  Future<void> updateNote(int id, String title, String content) async {
    final response = await http.put(
      Uri.parse("$baseUrl/$id"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"title": title, "content": content}),
    );
    if (response.statusCode != 200) {
      throw Exception("failed to update");
    }
  }

  //delete Note
  Future<void> deleteNote(int id) async {
    final response = await http.delete(Uri.parse("$baseUrl/$id"));
    if (response.statusCode != 200) {
      throw Exception("failed to update");
    }
  }
}
