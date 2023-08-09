import 'package:rei_da_bola/app/modules/shared/user/models/user_model.dart';

class RegisterUserSucessModel {
  String? msg;
  UserModel? user;

  RegisterUserSucessModel({this.msg, this.user});

  RegisterUserSucessModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    user = json['user'] != null ? UserModel.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}
