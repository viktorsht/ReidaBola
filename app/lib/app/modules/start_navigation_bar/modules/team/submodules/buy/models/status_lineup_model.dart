
class StatusLineup {
  int? id;
  String? name;
  int? status;
  String? createdAt;
  String? updatedAt;

  StatusLineup(
      {this.id, this.name, this.status, this.createdAt, this.updatedAt});

  StatusLineup.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}