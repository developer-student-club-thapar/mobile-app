class MembersList {
  List<Members> members;

  MembersList({required this.members});

  factory MembersList.fromJson(List<dynamic> parsedJson) {
    List<Members> members = <Members>[];
    members = parsedJson.map((i) => Members.fromJson(i)).toList();

    return MembersList(
      members: members,
    );
  }
}

class LeadList {
  List<Members> members;

  LeadList({required this.members});

  factory LeadList.fromJson(List<dynamic> parsedJson) {
    List<Members> members = <Members>[];
    members = parsedJson.map((i) => Members.fromJson(i)).toList();

    return LeadList(
      members: members,
    );
  }
}

class CoLeadList {
  List<Members> members;

  CoLeadList({required this.members});

  factory CoLeadList.fromJson(List<dynamic> parsedJson) {
    List<Members> members = <Members>[];
    members = parsedJson.map((i) => Members.fromJson(i)).toList();

    return CoLeadList(
      members: members,
    );
  }
}

class Members {
  int? id;
  String? name;
  String? role;
  String? email;
  String? githubUrl;
  String? linkedinUrl;
  String? twitterUrl;
  String? mediumUrl;
  String? devUrl;
  String? image;

  Members(
      {required this.id,
      required this.name,
      required this.role,
      required this.email,
      required this.githubUrl,
      required this.linkedinUrl,
      required this.twitterUrl,
      required this.mediumUrl,
      required this.devUrl,
      required this.image});

  Members.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    role = json['role'];
    email = json['email'];
    githubUrl = json['github_url'];
    linkedinUrl = json['linkedin_url'];
    twitterUrl = json['twitter_url'];
    mediumUrl = json['medium_url'];
    devUrl = json['dev_url'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['role'] = this.role;
    data['email'] = this.email;
    data['github_url'] = this.githubUrl;
    data['linkedin_url'] = this.linkedinUrl;
    data['twitter_url'] = this.twitterUrl;
    data['medium_url'] = this.mediumUrl;
    data['dev_url'] = this.devUrl;
    data['image'] = this.image;
    return data;
  }
}
