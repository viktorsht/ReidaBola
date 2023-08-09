import 'package:rei_da_bola/app/modules/shared/user/models/user_model.dart';

class TeamGameModel {
  int? id;
  String? name;
  String? abb;
  int? userId;
  String? createdAt;
  String? updatedAt;
  UserModel? user;

  TeamGameModel(
      {this.id,
      this.name,
      this.abb,
      this.userId,
      this.createdAt,
      this.updatedAt,
      this.user});

  TeamGameModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    abb = json['abb'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    user = json['user'] != null ? UserModel.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['abb'] = abb;
    data['user_id'] = userId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}
