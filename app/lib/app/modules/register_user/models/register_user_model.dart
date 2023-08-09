class RegisterUserModel {
  String? email;
  String? password;
  String? nick;
  String? firstName;
  String? lastName;

  RegisterUserModel({
    this.email, 
    this.password, 
    this.nick, 
    this.firstName, 
    this.lastName
    });

  RegisterUserModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
    nick = json['nick'];
    firstName = json['first_name'];
    lastName = json['last_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['password'] = password;
    data['nick'] = nick;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    return data;
  }
}
