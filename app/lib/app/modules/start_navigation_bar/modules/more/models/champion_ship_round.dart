class ChampionshipRound {
  int? id;
  String? name;
  int? round;
  String? createdAt;
  String? updatedAt;

  ChampionshipRound(
      {this.id, this.name, this.round, this.createdAt, this.updatedAt});

  ChampionshipRound.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    round = json['round'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['round'] = round;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}