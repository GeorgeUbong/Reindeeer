import 'package:flutter/material.dart';
import 'package:reindeer/pages/noteView_page.dart';
import '../viewModel/notes_ViewModel.dart';
import './addNote_Page.dart';
//import './noteView_page.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: InputDecoration(
            filled: true,
            fillColor: Color(0xfffE8E8E8),
            hintText: 'Search a note...',
            suffixIcon: Icon(Icons.search),

            //not active
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(color: Colors.grey.shade400, width: 1),
            ),

            //active
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(color: Colors.green, width: 2),
            ),
          ),
        ),
      ),

      //body

      //write box
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => AddnotePage(notifier: notifier),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(color: Color(0xfff577904)),
                //  margin: EdgeInsets.symmetric(horizontal: 0, vertical: 5),
                padding: EdgeInsets.symmetric(horizontal: 140, vertical: 22),
                child: Text(
                  'Write something..',
                  style: TextStyle(color: Colors.white, fontSize: 13),
                ),
              ),
            ),
            SizedBox(height: 30),
            Expanded(
              child: ListenableBuilder(
                listenable: notifier,
                builder: (BuildContext, Widget? child) {
                  if (notifier.notes.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.hourglass_empty),
                          SizedBox(height: 10),
                          Text('You have not written anything yet!'),
                        ],
                      ),
                    );
                  }
                  return ListView.builder(
                    itemCount: notifier.notes.length,
                    itemBuilder: (context, index) {
                      final note = notifier.notes[index];

                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  NoteviewPage(note: note, notifier: notifier),
                            ),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(color: Colors.white),
                          child: ListTile(
                            title: Text(note.title),
                            subtitle: Text(
                              note.content.length > 70
                                  ? '${note.content.substring(0, 70)}...'
                                  : note.content,
                            ),
                            trailing: Text(
                              note.createdAt?.toString().substring(0, 19) ??
                                  'Unavailable',
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xfff577800),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(30),
        ),

        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => AddnotePage(notifier: notifier)),
          );
        },
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
