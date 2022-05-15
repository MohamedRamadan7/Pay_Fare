class GetChair {
  int? id;
  int? car;
  int? chairNumber;
  int? status;

  GetChair({this.id, this.car, this.chairNumber, this.status});

  GetChair.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    car = json['car'];
    chairNumber = json['chairNumber'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['car'] = this.car;
    data['chairNumber'] = this.chairNumber;
    data['status'] = this.status;
    return data;
  }
}