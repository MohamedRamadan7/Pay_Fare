class AddDriverInQueueModel {
  int? id;
  String? driverCode;
  int? queueNum;

  AddDriverInQueueModel({this.id, this.driverCode, this.queueNum});

  AddDriverInQueueModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    driverCode = json['driverCode'];
    queueNum = json['queueNum'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['driverCode'] = this.driverCode;
    data['queueNum'] = this.queueNum;
    return data;
  }
}
