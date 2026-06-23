import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reindeer/controller/note_controller.dart';
import 'package:reindeer/views/addNoteScreen.dart';
import '../Models/note_model.dart';
import '../views/noteView.dart';



/*class NoteDetails{
  final String title;
  final String content;
//constructor
  NoteDetails({
    required this.title,
    required this.content,
  })
}
*/
class HomeScreen extends StatelessWidget {
const HomeScreen({super.key});

@override
Widget build(BuildContext context) {
return Scaffold (
  body: Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10 ),
    child: SafeArea(
      child: Column(
        children: [
          //Search bar here
          Padding(padding: const EdgeInsets.all(0),
          child: TextField(
            decoration: InputDecoration(
              hintText: "Search for a note",
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(999),
              )
            ),
          ),
         ),

         //Title
         SizedBox(
          height: 14,
         ),
         Row(
          children: [
            Text("Notes", style: TextStyle(fontSize: 30,fontWeight: FontWeight(700) ),),
          ],
         ),
      
        //Notes List
        Expanded(
          child: Consumer<NotesViewModel>(
          builder: (context, notesVM, child){
            if(notesVM.notes.isEmpty){
              return const EmptyState();
            }
          return ListView.builder(
            itemCount: notesVM.notes.length,
      
            itemBuilder: (context, index){
              final note = notesVM.notes[index];
      
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: InkWell( //wrap card to make it clickable
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Noteview(note: note),
                         ) );
                  },
                  child: Card(
                    margin: const EdgeInsets.all(
                     0.0
                    ),
                   elevation: 0,
                   color: const Color.fromARGB(49, 250, 225, 224),
                    child: ListTile(
                      title: Text(note.title),
                      subtitle: Text(
                        note.content,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                      ),
                      trailing: Text(
                        note.createdAt.toString().substring(10, 19),
                      ),
                    ),
                   
                  ),
                ),
              );
            },
          );
          },
          ),
          )
        ],
      ),
    ),
  ),
  floatingActionButton: FloatingActionButton(
    backgroundColor: Colors.green,
    foregroundColor: Colors.white,
   // elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadiusGeometry.circular(999)
    ),
    child: Icon(Icons.add, size: 30,),
    onPressed: (){
      Navigator.push(context,
      MaterialPageRoute(builder: (context) => add_Note()));
    }
  ),

);
}
}


//Empty State
class EmptyState extends StatelessWidget {
  const EmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.search_off, size: 60, color: Colors.grey,),
          Text(
            'No Notes Yet, Press the FAB to create a note',
            style: TextStyle(fontSize: 18, color: Colors.grey),
          )
        ],
      ),
    );
  }
}