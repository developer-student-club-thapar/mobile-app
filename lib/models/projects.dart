class Projects {
  List<ProjectDetail> detailedEvent;
  Projects({this.detailedEvent});
  factory Projects.fromJson(List<dynamic> parsedJson) {
    List<ProjectDetail> detailedEvent = List<ProjectDetail>();
    detailedEvent = parsedJson.map((i) => ProjectDetail.fromJson(i)).toList();

    return Projects(
      detailedEvent: detailedEvent,
    );
  }
}

class ProjectDetail {
  int id;
  String name;
  String description;
  String link;
  String funding;
  String faculty;
  String extra;

  ProjectDetail(
      {this.id,
      this.name,
      this.description,
      this.link,
      this.funding,
      this.faculty,
      this.extra});

  ProjectDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];

    name = json['name'];
    description = json['description'];

    link = json['github_link'];
    funding = json['funding'];
    faculty = json['faculty'];
    extra = json['extra'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;

    data['name'] = this.name;
    data['description'] = this.description;

    data['github_link'] = this.link;
    data['funding'] = this.funding;
    data['faculty'] = this.faculty;
    data['extra'] = this.extra;

    return data;
  }
}
