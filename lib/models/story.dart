
class Story {
  
  final String title; 
  final String url; 
  List<int> commentIds = List<int>(); 

  Story({this.title,this.url,this.commentIds});

  factory Story.fromJSON(Map<String,dynamic> json) {
    return Story(
      title: json["title"], 
      url: json["url"], 
      commentIds: json["kids"] == null ? List<int>() : json["kids"].cast<int>()
    );
  }

}
