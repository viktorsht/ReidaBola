class Team {
  int? id;
  String? name;
  String? abb;
  int? championshipId;
  String? createdAt;
  String? updatedAt;

  Team(
      {this.id,
      this.name,
      this.abb,
      this.championshipId,
      this.createdAt,
      this.updatedAt});

  Team.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    abb = json['abb'];
    championshipId = json['championship_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['abb'] = abb;
    data['championship_id'] = championshipId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}