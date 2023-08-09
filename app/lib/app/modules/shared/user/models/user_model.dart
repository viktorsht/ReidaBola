class UserModel {
  int? id;
  String? email;
  void emailVerifiedAt;
  String? firstName;
  String? lastName;
  String? nick;
  int? accessLevelId;
  String? createdAt;
  String? updatedAt;

  UserModel(
      {this.id,
      this.email,
      this.emailVerifiedAt,
      this.firstName,
      this.lastName,
      this.nick,
      this.accessLevelId,
      this.createdAt,
      this.updatedAt});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    //emailVerifiedAt = json['email_verified_at'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    nick = json['nick'];
    accessLevelId = json['accessLevelId'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    //data['email_verified_at'] = emailVerifiedAt;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['nick'] = nick;
    data['accessLevelId'] = accessLevelId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
