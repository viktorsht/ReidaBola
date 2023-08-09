class ChampionshipEdition {
  int? id;
  String? start;
  String? end;
  int? championshipId;
  String? createdAt;
  String? updatedAt;

  ChampionshipEdition(
      {this.id,
      this.start,
      this.end,
      this.championshipId,
      this.createdAt,
      this.updatedAt});

  ChampionshipEdition.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    start = json['start'];
    end = json['end'];
    championshipId = json['championship_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['start'] = start;
    data['end'] = end;
    data['championship_id'] = championshipId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}