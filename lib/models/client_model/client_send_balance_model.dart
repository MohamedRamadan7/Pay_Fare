class ClientSendBalanceModel {
  String? Successfully;


  ClientSendBalanceModel({this.Successfully,});

  ClientSendBalanceModel.fromJson(String json) {
    Successfully = json;
  }

}