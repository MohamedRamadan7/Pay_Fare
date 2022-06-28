class QrModel {
  int? carId;
  double? price;
  String? driverPhone;

  QrModel({this.carId, this.price, this.driverPhone});

  QrModel.fromJson(Map<String, dynamic> json) {
    carId = json['carId'];
    price = json['price'];
    driverPhone = json['driverPhone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['carId'] = this.carId;
    data['price'] = this.price;
    data['driverPhone'] = this.driverPhone;
    return data;
  }
}