import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/pages/add_new_note_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key,});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notes App",style: TextStyle(color: Colors.black),),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SafeArea(child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemCount: 5,
          itemBuilder: (context, index){
            return Container(
              margin:EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.blue
              ),
            );
          })),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, CupertinoPageRoute(
            fullscreenDialog: true,
            builder: (context) => AddNewNotePage()),
        );
      },backgroundColor: Colors.blue, child: Icon(Icons.add,),),
    );
  }
}
