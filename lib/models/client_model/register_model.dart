class ClientRegisterModel
{
  int? id;
  double? wallet;
  UserData? data;

  ClientRegisterModel.fromJson(Map<String , dynamic> json)
  {
    id= json['id'];
    wallet= json['wallet'];
    data= json['data'] !=null ? UserData.fromJson(json['data']) : null;

  }
}

class UserData {
  int? id;
  String? name;
  String? username;
  String? password;
  String? phone;
  String? image;


  // UserData({
  //    this.id,
  //    this.name,
  //    this.email,
  //    this.phone,
  //    this.image,
  //    this.points,
  //    this.credit,
  //    this.token,
  // });

  UserData.fromJson(Map<String, dynamic> json)
  {
    id = json['id'];
    name = json['name'];
    username = json['username'];
    password = json['password'];
    phone = json['phone'];
    image = json['image'];

  }
}

