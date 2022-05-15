class StationModel {
  int? id;
  City? city;
  String? name;

  StationModel({this.name});

  StationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    city = json['city'] != null ? new City.fromJson(json['city']) : null;
    name = json['name'];
  }
}

class City {
  int? id;
  State? state;
  String? cityNameAr;
  String? cityNameEn;

  City({this.id, this.state, this.cityNameAr, this.cityNameEn});

  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    state = json['state'] != null ? new State.fromJson(json['state']) : null;
    cityNameAr = json['cityNameAr'];
    cityNameEn = json['cityNameEn'];
  }
}

class State {
  int? id;
  String? stateNameAr;
  String? stateNameEn;

  State({this.id, this.stateNameAr, this.stateNameEn});

  State.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    stateNameAr = json['stateNameAr'];
    stateNameEn = json['stateNameEn'];
  }
}
