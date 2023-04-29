class CandidateModel {
  int? id;
  String? name;
  String? gender;
  String? photo;
  int? birthday;
  int? expired;

  CandidateModel(
      {this.id,
      this.name,
      this.gender,
      this.photo,
      this.birthday,
      this.expired});

  CandidateModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    gender = json['gender'];
    photo = json['photo'];
    birthday = json['birthday'];
    expired = json['expired'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['gender'] = gender;
    data['photo'] = photo;
    data['birthday'] = birthday;
    data['expired'] = expired;
    return data;
  }
}
