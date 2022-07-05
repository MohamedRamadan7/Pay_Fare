class ClientRidesHistoryModel {
  int? id;
  String? carPlateNum;
  String? driverPhone;
  double? amountPay;
  String? date;
  String? from;
  String? to;

  ClientRidesHistoryModel(
      {this.id, this.carPlateNum, this.driverPhone, this.amountPay, this.date});

  ClientRidesHistoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    carPlateNum = json['carPlateNum'];
    driverPhone = json['driverPhone'];
    amountPay = json['amountPay'];
    date = json['date'];
    from = json['from'];
    to = json['to'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['carPlateNum'] = this.carPlateNum;
    data['driverPhone'] = this.driverPhone;
    data['amountPay'] = this.amountPay;
    data['date'] = this.date;
    data['from'] = this.from;
    data['to'] = this.to;
    return data;
  }
}