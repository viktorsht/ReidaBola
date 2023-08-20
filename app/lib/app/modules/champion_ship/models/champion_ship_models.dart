class ChampionShipEditionModel {
  int? id;
  String? start;
  String? end;
  int? championshipId;
  String? createdAt;
  String? updatedAt;
  Championship? championship;

  ChampionShipEditionModel(
      {this.id,
      this.start,
      this.end,
      this.championshipId,
      this.createdAt,
      this.updatedAt,
      this.championship});

  ChampionShipEditionModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    start = json['start'];
    end = json['end'];
    championshipId = json['championship_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    championship = json['championship'] != null
        ? Championship.fromJson(json['championship'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['start'] = start;
    data['end'] = end;
    data['championship_id'] = championshipId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (championship != null) {
      data['championship'] = championship!.toJson();
    }
    return data;
  }
}

class Championship {
  int? id;
  String? name;
  int? cityId;
  String? createdAt;
  String? updatedAt;
  City? city;

  Championship(
      {this.id,
      this.name,
      this.cityId,
      this.createdAt,
      this.updatedAt,
      this.city});

  Championship.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    cityId = json['city_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    city = json['city'] != null ? City.fromJson(json['city']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['city_id'] = cityId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (city != null) {
      data['city'] = city!.toJson();
    }
    return data;
  }
}

class City {
  int? id;
  String? name;
  String? abb;
  int? stateId;
  String? createdAt;
  String? updatedAt;

  City(
      {this.id,
      this.name,
      this.abb,
      this.stateId,
      this.createdAt,
      this.updatedAt});

  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    abb = json['abb'];
    stateId = json['state_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['abb'] = abb;
    data['state_id'] = stateId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
