import 'package:flutter/material.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/providers/notes_provider.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class AddNewNotePage extends StatefulWidget {
  final bool isUpdate;
  final Note? note;
  const AddNewNotePage({super.key, required this.isUpdate, this.note});

  @override
  State<AddNewNotePage> createState() => _AddNewNotePageState();
}

class _AddNewNotePageState extends State<AddNewNotePage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  FocusNode noteFocus = FocusNode();

  void addNewNote(){
    Note note = Note(
      id: Uuid().v1(),
      userId: "piyush72717272@gmail.com",
      title: titleController.text,
      content: contentController.text,
      dateAdded: DateTime.now()
    );
    Provider.of<NotesProvider>(context,listen: false).addNote(note);
    Navigator.pop(context);
  }

  void updateNote(){
    widget.note!.title = titleController.text;
    widget.note!.content = titleController.text;
    widget.note!.dateAdded = DateTime.now();
    Provider.of<NotesProvider>(context, listen: false).updateNote(widget.note!);
    Navigator.pop(context);
  }

  @override
  void initState() {
    super.initState();
    if(widget.isUpdate) {
      titleController.text = widget.note!.title!;
      contentController.text = widget.note!.content!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notes App",style: TextStyle(color: Colors.black),),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: IconButton(onPressed: (){
              widget.isUpdate? updateNote() :addNewNote();
            }, icon: Icon(Icons.done)),
          )
        ],
      ),
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 20),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              autofocus: widget.isUpdate? false: true,
              onSubmitted: (val){
                if(val != ""){
                  noteFocus.requestFocus();
                }
              },
              style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                hintText: "Title",
                  border: InputBorder.none
                // contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 5)
              ),

            ),
            Expanded(
              child: TextField(
                controller: contentController,
                focusNode: noteFocus,
                maxLines: null,
                style: TextStyle(fontSize: 18),
                decoration: InputDecoration(
                    hintText: "Note",border: InputBorder.none
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
