class PayfareModel {
  String? Successfully;


  PayfareModel({this.Successfully,});

  PayfareModel.fromJson(String json) {
    Successfully = json;
  }

}