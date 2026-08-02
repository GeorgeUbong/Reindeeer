import 'package:flutter/material.dart';
import 'package:reindeer/pages/noteView_page.dart';
import '../viewModel/notes_ViewModel.dart';
import './addNote_Page.dart';
import './noteView_page.dart';


class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();

}

class _homePageState extends State<homePage> {
  //create notifier variable
  final listModel notifier = listModel();
  

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

      body: ListenableBuilder(
        listenable: notifier,
        builder: (BuildContext, Widget ? child) {
        return ListView.builder(
          itemCount: notifier.notes.length,
          itemBuilder: (context, index){
            final note = notifier.notes[index];
        
             return GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                   MaterialPageRoute(builder: (context) => NoteviewPage(note: note))
                   );
              },
               child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: ListTile(
                  title: Text(note.title),
                  subtitle: Text(note.content),
                  trailing: Text('hello'),
                ),
                           ),
             );
          }
          
          
        );
        }
      ),
        floatingActionButton: FloatingActionButton(onPressed: (){
          Navigator.push(context, 
          MaterialPageRoute(builder: (_) => AddnotePage(notifier: notifier))
          );
        }, child: Icon(Icons.add), ),
    );
  }
}