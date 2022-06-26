class PostCarModel {
  int? id;
  String? carCode;
  MainStation? mainStation;
  Traffic? traffic;
  Owner? owner;
  String? carPlateNum;
  int? carCapacity;
  String? qrCode;

  PostCarModel(
      {this.id,
        this.carCode,
        this.mainStation,
        this.traffic,
        this.owner,
        this.carPlateNum,
        this.carCapacity,
        this.qrCode});

  PostCarModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    carCode = json['carCode'];
    mainStation = json['mainStation'] != null
        ? new MainStation.fromJson(json['mainStation'])
        : null;
    traffic =
    json['traffic'] != null ? new Traffic.fromJson(json['traffic']) : null;
    owner = json['owner'] != null ? new Owner.fromJson(json['owner']) : null;
    carPlateNum = json['carPlateNum'];
    carCapacity = json['carCapacity'];
    qrCode = json['qrCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['carCode'] = this.carCode;
    if (this.mainStation != null) {
      data['mainStation'] = this.mainStation!.toJson();
    }
    if (this.traffic != null) {
      data['traffic'] = this.traffic!.toJson();
    }
    if (this.owner != null) {
      data['owner'] = this.owner!.toJson();
    }
    data['carPlateNum'] = this.carPlateNum;
    data['carCapacity'] = this.carCapacity;
    data['qrCode'] = this.qrCode;
    return data;
  }
}

class MainStation {
  int? id;
  City? city;
  String? name;

  MainStation({this.id, this.city, this.name});

  MainStation.fromJson(Map<String, dynamic> json) {
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

class Traffic {
  int? id;
  MainStation? station;
  int? price;
  String? from;
  String? to;

  Traffic({this.id, this.station, this.price, this.from, this.to});

  Traffic.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    station = json['station'] != null
        ? new MainStation.fromJson(json['station'])
        : null;
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

class Owner {
  int? id;
  String? phone;
  String? username;
  String? fullName;

  Owner({this.id, this.phone, this.username, this.fullName});

  Owner.fromJson(Map<String, dynamic> json) {
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