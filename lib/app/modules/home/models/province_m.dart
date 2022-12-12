class Province {
  String? sId;
  String? name;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Province({this.sId, this.name, this.createdAt, this.updatedAt, this.iV});

  Province.fromJson(Map<String, dynamic>? json) {
    sId = json?['_id'];
    name = json?['name'];
    createdAt = json?['createdAt'];
    updatedAt = json?['updatedAt'];
    iV = json?['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}
