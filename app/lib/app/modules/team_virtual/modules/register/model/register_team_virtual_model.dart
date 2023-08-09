class RegisterTeamVirtualModel {
  String? name;
  String? abb;
  int? userId;

  RegisterTeamVirtualModel({this.name, this.abb, this.userId});

  RegisterTeamVirtualModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    abb = json['abb'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['abb'] = abb;
    data['user_id'] = userId;
    return data;
  }
}
