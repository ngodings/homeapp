class UserExperienceModel {
  int? id;
  String? status;
  String? jobTitle;
  String? companyName;
  String? industry;

  UserExperienceModel(
      {this.id, this.status, this.jobTitle, this.companyName, this.industry});

  UserExperienceModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    jobTitle = json['job_title'];
    companyName = json['company_name'];
    industry = json['industry'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['status'] = status;
    data['job_title'] = jobTitle;
    data['company_name'] = companyName;
    data['industry'] = industry;
    return data;
  }
}
