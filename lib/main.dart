import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:get_post/View/note_List.dart';
import 'package:get_post/services/note_service.dart';

void setupLocator() {
  GetIt.I.registerLazySingleton(() => NoteServices());
  GetIt.I<NoteServices>();
}

//"apiKey": "d6cd8f7d-7070-4758-96e2-935c83a194cc"
void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.blue),
      home: NoteList(),
    );
  }
}
