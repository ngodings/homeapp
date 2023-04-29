class BlogModel {
  int? id;
  String? title;
  String? subTitle;
  String? photo;
  String? content;
  String? author;
  int? createAt;
  String? tag;

  BlogModel(
      {this.id,
      this.title,
      this.subTitle,
      this.photo,
      this.content,
      this.author,
      this.createAt,
      this.tag});

  BlogModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    subTitle = json['subTitle'];
    photo = json['photo'];
    content = json['content'];
    author = json['author'];
    createAt = json['create_at'];
    tag = json['tag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['subTitle'] = subTitle;
    data['photo'] = photo;
    data['content'] = content;
    data['author'] = author;
    data['create_at'] = createAt;
    data['tag'] = tag;
    return data;
  }
}
