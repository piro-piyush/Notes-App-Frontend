import 'package:flutter/material.dart';
import 'package:notes_app/pages/home_page.dart';
import 'package:notes_app/providers/notes_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => NotesProvider())
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF9FC8FB)),
            useMaterial3: true,
          ),
          home: const HomePage(),
        ));
  }
}
