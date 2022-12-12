class Kota {
  String? sId;
  String? name;
  String? province;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Kota(
      {this.sId,
      this.name,
      this.province,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Kota.fromJson(Map<String, dynamic>? json) {
    sId = json?['_id'];
    name = json?['name'];
    province = json?['province'];
    createdAt = json?['createdAt'];
    updatedAt = json?['updatedAt'];
    iV = json?['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['province'] = province;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}
