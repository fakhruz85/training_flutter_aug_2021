class User {
  late int _userId;
  late String _username;
  late String _token;

  User({required int userId, required String username, required String token}){
    this._userId = userId;
    this._username = username;
    this._token = token;
  }

  // Properties
  int get userId => _userId;
  set userId(int userId) => _userId = userId;
  String get username => _username;
  set username(String username) => _username = username;
  String get token => _token;
  set token(String token) => _token = token;

  // create the user object from json input
  User.fromJson(Map<String, dynamic> json){
    _userId = json['userId'];
    _username = json['username'];
    _token = json['token'];
  }

  //export to json
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this._userId;
    data['username'] = this._username;
    data['token'] = this._token;

    return data;
  }
}