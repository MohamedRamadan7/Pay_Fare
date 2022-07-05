class DriversRoleModel {
  int? role;


  DriversRoleModel({this.role,});

  DriversRoleModel.fromJson(int json) {
    role = json;
  }
}