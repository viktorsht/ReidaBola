import 'position_model.dart';

class PlayerModel {
    int? id;
    String? firstname;
    String? lastname;
    int? number;
    int? positionid;
    int? cityid;
    String? createdat;
    String? updatedat;
    Position? position;

    PlayerModel({this.id, this.firstname, this.lastname, this.number, this.positionid, this.cityid, this.createdat, this.updatedat, this.position}); 

    PlayerModel.fromJson(Map<String, dynamic> json) {
        id = json['id'];
        firstname = json['first_name'];
        lastname = json['last_name'];
        number = json['number'];
        positionid = json['position_id'];
        cityid = json['city_id'];
        createdat = json['created_at'];
        updatedat = json['updated_at'];
        position = json['position'] != null ? Position?.fromJson(json['position']) : null;
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = <String, dynamic>{};
        data['id'] = id;
        data['first_name'] = firstname;
        data['last_name'] = lastname;
        data['number'] = number;
        data['position_id'] = positionid;
        data['city_id'] = cityid;
        data['created_at'] = createdat;
        data['updated_at'] = updatedat;
        data['position'] = position!.toJson();
        return data;
    }
}