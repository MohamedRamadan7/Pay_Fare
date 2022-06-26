class OwnerModel {
  int? id;
  String? phone;
  String? username;
  String? fullName;

  OwnerModel({this.id, this.phone, this.username, this.fullName});

  OwnerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    phone = json['phone'];
    username = json['username'];
    fullName = json['fullName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['phone'] = this.phone;
    data['username'] = this.username;
    data['fullName'] = this.fullName;
    return data;
  }
}