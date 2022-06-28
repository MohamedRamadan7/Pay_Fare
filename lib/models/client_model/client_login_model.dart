
class ClientLoginModel {
  int? id;
  UserData? user;
  double? amount;

  ClientLoginModel({this.id, this.user, this.amount});

  ClientLoginModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'] != null ? new UserData.fromJson(json['user']) : null;
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['amount'] = this.amount;
    return data;
  }
}

class UserData {
  int? id;
  String? name;
  String? userName;
  String? phone;
  TypeData? type;

  UserData({this.id, this.name, this.userName, this.phone, this.type});

  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    userName = json['userName'];
    phone = json['phone'];
    type = json['type'] != null ? new TypeData.fromJson(json['type']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['userName'] = this.userName;
    data['phone'] = this.phone;
    if (this.type != null) {
      data['type'] = this.type!.toJson();
    }
    return data;
  }
}

class TypeData {
  int? id;
  String? name;

  TypeData({this.id, this.name});

  TypeData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}



