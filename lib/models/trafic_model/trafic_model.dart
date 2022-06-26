class TraficModel {
  int? id;
  Station? station;
  double? price;
  String? from;
  String? to;

  TraficModel({this.id, this.station, this.price, this.from, this.to});

  TraficModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    station =
    json['station'] != null ? new Station.fromJson(json['station']) : null;
    price = json['price'];
    from = json['from'];
    to = json['to'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.station != null) {
      data['station'] = this.station!.toJson();
    }
    data['price'] = this.price;
    data['from'] = this.from;
    data['to'] = this.to;
    return data;
  }
}

class Station {
  int? id;
  City? city;
  String? name;

  Station({this.id, this.city, this.name});

  Station.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    city = json['city'] != null ? new City.fromJson(json['city']) : null;
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.city != null) {
      data['city'] = this.city!.toJson();
    }
    data['name'] = this.name;
    return data;
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.state != null) {
      data['state'] = this.state!.toJson();
    }
    data['cityNameAr'] = this.cityNameAr;
    data['cityNameEn'] = this.cityNameEn;
    return data;
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['stateNameAr'] = this.stateNameAr;
    data['stateNameEn'] = this.stateNameEn;
    return data;
  }
}