class StadiumFootball {
  int? id;
  String? name;
  int? cityId;
  String? createdAt;
  String? updatedAt;

  StadiumFootball(
      {this.id, this.name, this.cityId, this.createdAt, this.updatedAt});

  StadiumFootball.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    cityId = json['city_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['city_id'] = cityId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}