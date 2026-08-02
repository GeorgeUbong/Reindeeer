import 'package:flutter/material.dart';
import './home_Page.dart';
import '../model/note_Model.dart';
import '../viewModel/notes_ViewModel.dart';

class NoteviewPage extends StatelessWidget {
  final Note note;

  const NoteviewPage({
    super.key,
    required this.note,
  });

  @override

  //final note = notes.firstWhere((n) => n.id == noteId);

  Widget build(BuildContext context) {
    return 
    Scaffold(
    body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  child: IconButton(
                    tooltip: 'go back',
                    onPressed: (){
                    Navigator.pop(context);
                  }, 
                  icon: Icon(Icons.arrow_back))
                ),
            CircleAvatar(
              child: IconButton( tooltip: 'options', 
              onPressed:(){
                slideUp(context);
              }, icon: Icon(Icons.more_vert)),
              
            )
                
              ],
            
              
            ),
             SizedBox(height: 30,),
        
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(note.title, textAlign: TextAlign.right ,style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),),
                SizedBox(height: 30,),
                Text(note.content, style: TextStyle(fontSize: 20, color: const Color.fromARGB(136, 32, 31, 31)),)
              ],
            )
          ],
        ),
      ) ),
    );
  }
}



//bottomsheet
void slideUp(BuildContext context){
  showModalBottomSheet(context: context,
   builder: (BuildContext context) =>
   ElevatedButton(onPressed: (){
   // notifier.deleteNote(id)
   }, child: Text('Delete Note')) );
}