class Project {
  List<ProjectDetail> detailedProject;
  Project({required this.detailedProject});
  factory Project.fromJson(List<dynamic> parsedJson) {
    List<ProjectDetail> detailedProject = <ProjectDetail>[];
    detailedProject = parsedJson.map((i) => ProjectDetail.fromJson(i)).toList();

    return Project(
      detailedProject: detailedProject,
    );
  }
}

class ProjectDetail {
  int? id;
  String? name;
  ProjectLead? projectLead;
  String? image;
  String? description;
  List<Members> members = [];
  String? githubLink;
  String? funding;
  String? faculty;
  String? extra;

  ProjectDetail(
      {required this.id,
      required this.name,
      required this.projectLead,
      required this.image,
      required this.description,
      required this.members,
      required this.githubLink,
      required this.funding,
      required this.faculty,
      required this.extra});

  ProjectDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    projectLead = json['project_lead'] != null
        ? new ProjectLead.fromJson(json['project_lead'])
        : null;
    image = json['image'];
    description = json['description'];
    if (json['members'] != null) {
      members = <Members>[];
      json['members'].forEach((v) {
        members.add(new Members.fromJson(v));
      });
    }
    githubLink = json['github_link'];
    funding = json['funding'];
    faculty = json['faculty'];
    extra = json['extra'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.projectLead != null) {
      data['project_lead'] = this.projectLead!.toJson();
    }
    data['image'] = this.image;
    data['description'] = this.description;
    if (this.members.isNotEmpty) {
      data['members'] = this.members.map((v) => v.toJson()).toList();
    }
    data['github_link'] = this.githubLink;
    data['funding'] = this.funding;
    data['faculty'] = this.faculty;
    data['extra'] = this.extra;
    return data;
  }
}

class ProjectLead {
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

  ProjectLead(
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

  ProjectLead.fromJson(Map<String, dynamic> json) {
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
