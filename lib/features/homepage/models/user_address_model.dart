class UserAddressModel {
  int? id;
  String? address;
  String? city;
  String? state;
  int? zipCode;

  UserAddressModel(
      {this.id, this.address, this.city, this.state, this.zipCode});

  UserAddressModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    address = json['address'];
    city = json['city'];
    state = json['state'];
    zipCode = json['zip_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['address'] = address;
    data['city'] = city;
    data['state'] = state;
    data['zip_code'] = zipCode;
    return data;
  }
}
