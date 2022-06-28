class RemoveFromQueueModel {
  String? Successful_Delete_And_Create_NewTrip;


  RemoveFromQueueModel({this.Successful_Delete_And_Create_NewTrip,});

  RemoveFromQueueModel.fromJson(String json) {
    Successful_Delete_And_Create_NewTrip = json;
  }

}