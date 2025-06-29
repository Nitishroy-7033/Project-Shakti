
class UserModel {
  String? id;
  String? phoneNumber;
  String? email;
  String? profilePhoto;

  UserModel({this.id, this.phoneNumber, this.email, this.profilePhoto});

  UserModel.fromJson(Map<String, dynamic> json) {
    if(json["id"] is String) {
      id = json["id"];
    }
    if(json["phoneNumber"] is String) {
      phoneNumber = json["phoneNumber"];
    }
    if(json["email"] is String) {
      email = json["email"];
    }
    if(json["profilePhoto"] is String) {
      profilePhoto = json["profilePhoto"];
    }
  }

  static List<UserModel> fromList(List<Map<String, dynamic>> list) {
    return list.map(UserModel.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["phoneNumber"] = phoneNumber;
    _data["email"] = email;
    _data["profilePhoto"] = profilePhoto;
    return _data;
  }
}