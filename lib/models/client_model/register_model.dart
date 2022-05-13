// class ClientRegisterModel
// {
//   int? id;
//   double? wallet;
//   UserData? data;
//
//   ClientRegisterModel.fromJson(Map<String , dynamic> json)
//   {
//     id= json['id'];
//     wallet= json['wallet'];
//     data= json['data'] !=null ? UserData.fromJson(json['data']) : null;
//
//   }
// }
//
// class UserData {
//   int? id;
//   String? name;
//   String? username;
//   String? password;
//   String? phone;
//   String? image;
//
//
//   // UserData({
//   //    this.id,
//   //    this.name,
//   //    this.email,
//   //    this.phone,
//   //    this.image,
//   //    this.points,
//   //    this.credit,
//   //    this.token,
//   // });
//
//   UserData.fromJson(Map<String, dynamic> json)
//   {
//     id = json['id'];
//     name = json['name'];
//     username = json['username'];
//     password = json['password'];
//     phone = json['phone'];
//     image = json['image'];
//
//   }
// }
//

class ClientRegisterModel {
  int? id;
  UserData? user;
  int? wallet;

  ClientRegisterModel({this.id, this.user, this.wallet});

  ClientRegisterModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'] != null ? new UserData.fromJson(json['user']) : null;
    wallet = json['wallet'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['wallet'] = this.wallet;
    return data;
  }
}

class UserData {
  int? id;
  String? name;
  String? userName;
  String? phone;
  Type? type;

  UserData({this.id, this.name, this.userName, this.phone, this.type});

  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    userName = json['userName'];
    phone = json['phone'];
    type = json['type'] != null ? new Type.fromJson(json['type']) : null;
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

class Type {
  int? id;
  String? name;

  Type({this.id, this.name});

  Type.fromJson(Map<String, dynamic> json) {
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
