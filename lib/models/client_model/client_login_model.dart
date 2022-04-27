class ClientLoginModel
{
    int? id;
    double? wallet;
    UserData? data;

    ClientLoginModel.fromJson(Map<String , dynamic> json)
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
      phone = json['phone'];
      image = json['image'];

   }
}



