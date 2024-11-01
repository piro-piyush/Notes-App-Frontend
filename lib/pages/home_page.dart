import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/pages/add_new_note_page.dart';
import 'package:notes_app/providers/notes_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key,});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {

    NotesProvider notesProvider = Provider.of<NotesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Notes App",style: TextStyle(color: Colors.black),),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: notesProvider.isLoading == false? SafeArea(child:(notesProvider.notes.isEmpty)? Center(
          child: Text("No notes yet")): GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemCount: notesProvider.notes.length,
          itemBuilder: (context, index){
            Note currentNote = notesProvider.notes[index];
            return GestureDetector(
              onTap: (){
                Navigator.push(context, CupertinoPageRoute(
                    fullscreenDialog: true,
                    builder: (context) => AddNewNotePage(isUpdate: true,note: currentNote,)),
                );
              },
              onLongPress: (){
                notesProvider.deleteNote(currentNote);
              },
              child: Container(
                margin:EdgeInsets.all(5),
                decoration: BoxDecoration(
                  // color:  Color(0xFF9FC8FB),
                      borderRadius: BorderRadius.circular(14),border: Border.all(
                  color: Colors.grey,
                  width: 1,
                )),
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(currentNote.title!,style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),maxLines: 1,overflow: TextOverflow.ellipsis,),
                      SizedBox(height: 7,),
                      Text(currentNote.content!,style: TextStyle(fontSize: 18,color: Colors.grey[700]),maxLines: 4,overflow: TextOverflow.ellipsis,),
                  ]),
                ),
              ),
            );
          })):Center(child: CircularProgressIndicator()),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, CupertinoPageRoute(
            fullscreenDialog: true,
            builder: (context) => AddNewNotePage(isUpdate: false,)),
        );
      },backgroundColor: Color(0xFF9FC8FB), child: Icon(Icons.add,),),
    );
  }
}
