import 'dart:convert';

class UserModel {
  final String _name;
  final String? _photoURL;

  String get name => _name;
  String? get photoURL => _photoURL;

  UserModel(this._name, this._photoURL);

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(map['name'], map['photoURL']);
  }

  factory UserModel.fromJson(String json) {
    return UserModel.fromMap(jsonDecode(json));
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = _name;
    data['photoURL'] = _photoURL;
    return data;
  }

  String toJson() => jsonEncode(toMap());
}
