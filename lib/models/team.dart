class TeamDetails {
  List<TeamCategory> category;

  TeamDetails({this.category});

  factory TeamDetails.fromJson(List<dynamic> parsedJson) {

    List<TeamCategory> category =  List<TeamCategory>();
    category = parsedJson.map((i)=>TeamCategory.fromJson(i)).toList();

    return  TeamDetails(
       category: category,
    );
  }
}

class TeamCategory {
  int id;
  String name;
  List<Heads> heads;
  List<Members> members;

  TeamCategory({this.id, this.name, this.heads, this.members});

  TeamCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['heads'] != null) {
      heads =  List<Heads>();
      json['heads'].forEach((v) {
        heads.add(Heads.fromJson(v));
      });
    }
    if (json['members'] != null) {
      members = new List<Members>();
      json['members'].forEach((v) {
        members.add(new Members.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.heads != null) {
      data['heads'] = this.heads.map((v) => v.toJson()).toList();
    }
    if (this.members != null) {
      data['members'] = this.members.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Heads {
  int id;
  String name;
  String role;
  String email;
  String githubUrl;
  String linkedinUrl;
  String twitterUrl;
  String mediumUrl;
  String devUrl;
  String image;

  Heads(
      {this.id,
      this.name,
      this.role,
      this.email,
      this.githubUrl,
      this.linkedinUrl,
      this.twitterUrl,
      this.mediumUrl,
      this.devUrl,
      this.image});

  Heads.fromJson(Map<String, dynamic> json) {
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

class Members {
  int id;
  String name;
  String role;
  String email;
  String githubUrl;
  String linkedinUrl;
  String twitterUrl;
  String mediumUrl;
  String devUrl;
  String image;

  Members(
      {this.id,
      this.name,
      this.role,
      this.email,
      this.githubUrl,
      this.linkedinUrl,
      this.twitterUrl,
      this.mediumUrl,
      this.devUrl,
      this.image});

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
