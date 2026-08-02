//view model is the conessiuer: talking to the view and the model

import 'package:flutter/material.dart';

import '../model/note_Model.dart';


class listModel extends ChangeNotifier {
  
List <Note> notes = [
  Note(id: 1, title: 'myage', content: 'content')
];

//add a note
void addNote(String title, String content){
  notes.add(
      Note(
    id: notes.length + 1,
    title: title,
    content: content
    ),
    );
    notifyListeners();
}

void HonkHonk(){
  print(notes);
}



void deleteNote(int id){
  final notesLength = notes.length;
  notes.removeWhere((note) => note.id == id );

  if (notes.length == notesLength){
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
}


