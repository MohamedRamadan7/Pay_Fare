class CarTripsModel {
  int? id;
  String? date;
  double? price;

  CarTripsModel({this.id, this.date, this.price});

  CarTripsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['date'] = this.date;
    data['price'] = this.price;
    return data;
  }
}