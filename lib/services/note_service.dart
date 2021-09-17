import 'dart:convert';

import 'package:get_post/Model/api_response.dart';
import 'package:get_post/Model/note.dart';
import 'package:get_post/Model/note_for_listing.dart';
import 'package:http/http.dart' as http;

class NoteServices {
  static const API = 'https://tq-notes-api-jkrgrdggbq-el.a.run.app';
  static const headers = {"apiKey": "1151932c-1d1e-456d-b0e8-47d57a4f6fe1"};
  // List<NoteForListing> getNotesList()
  // return [
  //   NoteForListing(
  //     noteID: "1",
  //     nodeTitle: "Guddi",
  //     createDateTime: DateTime.now(),
  //     lastEditedDateTime: DateTime.now(),
  //   ),
  //   NoteForListing(
  //     noteID: "2",
  //     nodeTitle: "Guddi1",
  //     createDateTime: DateTime.now(),
  //     lastEditedDateTime: DateTime.now(),
  //   ),
  //   NoteForListing(
  //     noteID: "3",
  //     nodeTitle: "Guddi2",
  //     createDateTime: DateTime.now(),
  //     lastEditedDateTime: DateTime.now(),
  //   ),
  //   NoteForListing(
  //     noteID: "4",
  //     nodeTitle: "Guddi3",
  //     createDateTime: DateTime.now(),
  //     lastEditedDateTime: DateTime.now(),
  //   ),
  // ];

  Future<APIResponse<List<NoteForListing>>> getNotesList() {
    return http.get(API + '/notes', headers: headers).then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);

        final notes = <NoteForListing>[];
        for (var item in jsonData) {
          notes.add(NoteForListing.fromJson(item));
        }
        return APIResponse<List<NoteForListing>>(data: notes);
      }
      return APIResponse<List<NoteForListing>>(
          error: true, errormessege: 'An error occured');
    }).catchError((Object error) => APIResponse<List<NoteForListing>>(
        error: true, errormessege: 'An error occured'));
  }

  Future<APIResponse<Note>> getNote(String noteID) {
    return http.get(API + '/notes/' + noteID, headers: headers).then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        print("Guddi Response ${jsonData}");
        return APIResponse<Note>(data: Note.fromJson(jsonData));
      }
      return APIResponse<Note>(error: true, errormessege: 'AN error occured');
    }).catchError((error) =>
        APIResponse<Note>(error: true, errormessege: 'An error occured'));
  }
}
