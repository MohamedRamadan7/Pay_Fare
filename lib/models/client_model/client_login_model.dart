// class ClientLoginModel
// {
//     int? id;
//     double? wallet;
//     UserData? data;
//
//     ClientLoginModel.fromJson(Map<String , dynamic> json)
//     {
//        id= json['id'];
//        wallet= json['wallet'];
//        data= json['data'] !=null ? UserData.fromJson(json['data']) : null;
//
//     }
// }
//
// class UserData {
//    int? id;
//    String? name;
//    String? username;
//    String? phone;
//    String? image;
//    List<TypeData>? data=[];
//
//    // UserData({
//    //    this.id,
//    //    this.name,
//    //    this.email,
//    //    this.phone,
//    //    this.image,
//    //    this.points,
//    //    this.credit,
//    //    this.token,
//    // });
//
//    UserData.fromJson(Map<String, dynamic> json)
//    {
//       id = json['id'];
//       name = json['name'];
//       username = json['username'];
//       phone = json['phone'];
//       image = json['image'];
//       json['data'].forEach((element)
//       {
//         data!.add(TypeData.fromJson(element));
//       });
//    }
// }
// class TypeData
// {
//   int? id ;
//   String? name ;
//   TypeData.fromJson(Map<String , dynamic>json)
//   {
//     id =json['id'];
//     name =json['name'];
//   }
// }


class ClientLoginModel {
  int? id;
  UserData? user;
  double? wallet;

  ClientLoginModel({this.id, this.user, this.wallet});

  ClientLoginModel.fromJson(Map<String, dynamic> json) {
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



