class Story {
  final String title;
  final String url;
  List<int> commentIds = <int>[];

  Story({required this.title, required this.url, required this.commentIds});

  factory Story.fromJSON(Map<String, dynamic> json) {
    return Story(
        title: json["title"],
        url: json["url"],
        commentIds: json["kids"] == null ? <int>[] : json["kids"].cast<int>());
  }
}
