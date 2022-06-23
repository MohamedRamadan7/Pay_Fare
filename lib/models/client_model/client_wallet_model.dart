class ClientWalletModel {
  String? Successfully;


  ClientWalletModel({this.Successfully,});

  ClientWalletModel.fromJson(String json) {
    Successfully = json;
  }

}