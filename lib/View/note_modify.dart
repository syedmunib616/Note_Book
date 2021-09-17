import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:get_post/Model/note.dart';
import 'package:get_post/services/note_service.dart';

class NoteModify extends StatefulWidget {
  final String noteID;
  NoteModify({this.noteID});

  @override
  _NoteModifyState createState() => _NoteModifyState();
}

class _NoteModifyState extends State<NoteModify> {
  bool get isEditing => widget.noteID != null;

  NoteServices get noteService => GetIt.I<NoteServices>();
  String errorMessege;

  Note note = Note();

  TextEditingController _title = TextEditingController();

  TextEditingController _content = TextEditingController();
  bool load = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      load = true;
    });

    noteService.getNote(widget.noteID).then((response) {
      setState(() {
        load = false;
      });
      log("babo : $response");
      if (response.error) {
        errorMessege = response.errormessege ?? 'an error occured';
      }

      note = response.data;
      _title.text = note.noteTitle;
      _content.text = note.notecontent;
    });
  }

  @override
  Widget build(BuildContext context) {
    print("pasha ${_title.text.toString()}  ${_content.text.toString()}");

    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing == null ? "Create note" : "Edit Note"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: load
            ? Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  TextField(
                    controller: _title,
                    decoration: InputDecoration(hintText: "No Text"),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  TextField(
                    controller: _content,
                    decoration: InputDecoration(hintText: "No content"),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: RaisedButton(
                      child: Text(
                        'Submit',
                        style: TextStyle(color: Colors.white),
                      ),
                      color: Theme.of(context).primaryColor,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
