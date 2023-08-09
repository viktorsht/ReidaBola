class RegisterTeamVirtualSucessModel {
  String? name;
  String? abb;
  int? userId;
  String? updatedAt;
  String? createdAt;
  int? id;

  RegisterTeamVirtualSucessModel(
      {this.name,
      this.abb,
      this.userId,
      this.updatedAt,
      this.createdAt,
      this.id});

  RegisterTeamVirtualSucessModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    abb = json['abb'];
    userId = json['user_id'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['abb'] = abb;
    data['user_id'] = userId;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    data['id'] = id;
    return data;
  }
}
