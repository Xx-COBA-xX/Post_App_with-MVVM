class PostModel {
  int? id, userId;
  String? title, body;

  PostModel({this.body, this.title, this.id, this.userId});

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      body: json["body"],
      id: json["id"],
      userId: json["userId"],
      title: json["title"],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> list;
    return list = {"body": body, "title": title, "id": id, "userId": userId};
  }
}
