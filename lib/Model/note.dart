class Note {
  String noteID;
  String noteTitle;
  String notecontent;
  DateTime createDateTime;
  DateTime lastEditedDateTime;

  Note(
      {this.noteID,
      this.noteTitle,
      this.notecontent,
      this.createDateTime,
      this.lastEditedDateTime});

  factory Note.fromJson(Map<String, dynamic> item) {
    return Note(
        noteID: item['noteID'],
        noteTitle: item['noteTitle'],
        notecontent: item['noteContent'],
        createDateTime: DateTime.parse(item['createDateTime']),
        lastEditedDateTime: DateTime.parse(item['latestEditDateTime']) != null
            ? DateTime.parse(item['latestEditDateTime'])
            : null);
  }
}
