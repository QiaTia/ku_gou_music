import 'package:get_storage/get_storage.dart';
import 'package:ku_gou_music/config/config.dart' as config;

class UserStruct {
  String token;
  String dfid;
  int userid;
  String? mid;
  UserStruct({
    required this.token,
    required this.dfid,
    required this.userid,
  });
  UserStruct.fromJson(Map<String, dynamic> json)
    : token = json['token'] ?? '',
      dfid = json['dfid'] ?? '',
      mid = json['mid'] ?? config.mid,
      userid = json['userid'] ?? 0;
  Map<String, dynamic> toJson() => {
    'token': token,
    'dfid': dfid,
    'userid': userid,
    'mid': mid ?? config.mid,
  };
}

class User {
  static final User _singleton = User._internal();
  factory User() => _singleton;
  User._internal();
  final storage = GetStorage();
  final _userStorageKey = 'user';
  UserStruct _user = UserStruct.fromJson({});
  get token => _user.token;
  get dfid => _user.dfid;
  get userid => _user.userid;
  get mid => _user.mid;

  /// 登录成功
  void setNewUser(Map<String, dynamic> json) {
    final user = UserStruct.fromJson(json);
    _user = user;
    storage.write(_userStorageKey, user.toJson());
  }
  /// 登出
  void clearUser() {
    _user = UserStruct(
      token: '',
      dfid: '',
      userid: 0,
    );
    storage.remove(_userStorageKey);
  }

  void init() {
    final user = storage.read<Map<String, dynamic>>(_userStorageKey);
    if (user != null) {
      _user = UserStruct.fromJson(user);
    } else {
      _user = UserStruct(
        token: '3f26d402d64d4276dc8ad8cdd50814fdd54b0e8e209ba0a155b6bdc6f88d71ae',
        dfid: '08U3ic1DdgYU3EsoVb0Ee3GB',
        userid: 487837317,
      );
      storage.write(_userStorageKey, _user.toJson());
    }
  }
}


final userInstance = User();
