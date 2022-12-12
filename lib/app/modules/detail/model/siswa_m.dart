class Siswa {
  String? sId;
  String? name;
  String? gender;
  String? birthDate;
  String? province;
  String? city;
  String? photo;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Siswa(
      {this.sId,
      this.name,
      this.gender,
      this.birthDate,
      this.province,
      this.city,
      this.photo,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Siswa.fromJson(Map<String, dynamic>? json) {
    sId = json?['_id'];
    name = json?['name'];
    gender = json?['gender'];
    birthDate = json?['birthDate'];
    province = json?['province'];
    city = json?['city'];
    photo = json?['photo'];
    createdAt = json?['createdAt'];
    updatedAt = json?['updatedAt'];
    iV = json?['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['gender'] = gender;
    data['birthDate'] = birthDate;
    data['province'] = province;
    data['city'] = city;
    data['photo'] = photo;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}
