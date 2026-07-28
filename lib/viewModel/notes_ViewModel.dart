//view model is the conessiuer: talking to the view and the model

import '../model/note_Model.dart';

List <Note> notes = [
 // Note(id: 1, title: 'myage', content: 'content')
];

//add a note
void addNote(String title, String content){
  final note = Note(
    id: notes.length + 1,
    title: title,
    content: content
    );
}