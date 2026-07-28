import 'package:flutter/material.dart';
import '../viewModel/notes_ViewModel.dart';
import './addNote_Page.dart';

class homePage extends StatelessWidget {
  const homePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const TextField(
          decoration: InputDecoration(
            hintText: 'Search a note...',
            suffixIcon: Icon(Icons.search)
          ),
        ),
      ),

      body: ListView.builder(
        itemCount: notes.length,
        itemBuilder: (context, index){
          final note = notes[index];

          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: ListTile(
              title: Text(note.title),
              subtitle: Text(note.content),
              trailing: Text('hello'),
            ),
          );
        }
  
        ),
        floatingActionButton: FloatingActionButton(onPressed: (){
          Navigator.push(context, 
          MaterialPageRoute(builder: (context) => AddnotePage())
          );
        }, child: Icon(Icons.add), ),
    );
  }
}