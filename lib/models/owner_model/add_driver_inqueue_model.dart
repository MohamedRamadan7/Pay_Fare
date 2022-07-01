class AddDriverInQueueModel {
  int? id;
  String? driverCode;
  int? queueNum;
  String? driverName;
  String? carPlateNum;

  AddDriverInQueueModel({this.id, this.driverCode, this.queueNum});

  AddDriverInQueueModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    driverCode = json['driverCode'];
    driverName = json['driverName'];
    carPlateNum = json['carPlateNum'];
    queueNum = json['queueNum'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['driverCode'] = this.driverCode;
    data['driverName'] = this.driverName;
    data['carPlateNum'] = this.carPlateNum;
    data['queueNum'] = this.queueNum;
    return data;
  }
}
