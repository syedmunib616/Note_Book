class NoteForListing {
  String noteID;
  String nodeTitle;
  DateTime createDateTime;
  DateTime lastEditedDateTime;

  NoteForListing(
      {this.noteID,
      this.nodeTitle,
      this.createDateTime,
      this.lastEditedDateTime});

  factory NoteForListing.fromJson(Map<String, dynamic> item) {
    return NoteForListing(
        noteID: item['noteID'],
        nodeTitle: item['noteTitle'],
        createDateTime: DateTime.parse(item['createDateTime']),
        lastEditedDateTime: DateTime.parse(item['createDateTime']) != null
            ? DateTime.parse(item['createDateTime'])
            : null);
  }
}
