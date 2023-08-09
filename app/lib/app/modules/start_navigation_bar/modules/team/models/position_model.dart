class Position {
    int? id;
    String? name;
    String? abb;
    String? createdat;
    String? updatedat;

    Position({this.id, this.name, this.abb, this.createdat, this.updatedat}); 

    Position.fromJson(Map<String, dynamic> json) {
        id = json['id'];
        name = json['name'];
        abb = json['abb'];
        createdat = json['created_at'];
        updatedat = json['updated_at'];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = <String, dynamic>{};
        data['id'] = id;
        data['name'] = name;
        data['abb'] = abb;
        data['created_at'] = createdat;
        data['updated_at'] = updatedat;
        return data;
    }
}