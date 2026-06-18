import 'package:get_storage/get_storage.dart';
import 'package:ku_gou_music/config/config.dart' as config;

class UserStruct {
  String token;
  String dfid;
  int userid;
  String? mid;
  String? nickname;
  String? pic;
  UserStruct({required this.token, required this.dfid, required this.userid});
  UserStruct.fromJson(Map<String, dynamic> json)
    : token = json['token'] ?? '',
      dfid = json['dfid'] ?? '',
      mid = json['mid'] ?? config.mid,
      nickname = json['nickname'] ?? '',
      pic = json['pic'] ?? '',
      userid = json['userid'] ?? 0;
      
  Map<String, dynamic> toJson() => {
    'token': token,
    'dfid': dfid,
    'userid': userid,
    'nickname': nickname,
    'pic': pic,
  };
}

class User {
  static final User _singleton = User._internal();
  factory User() => _singleton;
  User._internal();
  final storage = GetStorage();
  final _userStorageKey = 'user';
  UserStruct _user = UserStruct.fromJson({});
  String get token => _user.token;
  String get dfid => _user.dfid;
  int get userid => _user.userid;
  String? get mid => _user.mid;
  String? get nickname => _user.nickname;

  /// 登录成功
  void setNewUser(Map<String, dynamic> json) {
    final user = UserStruct.fromJson(json);
    _user = user;
    storage.write(_userStorageKey, user.toJson());
  }

  void setDfid(String dfid) {
    _user.dfid = dfid;
    storage.write(_userStorageKey, _user.toJson());
  }

  /// 设置Token
  void onLogin(Map<String, dynamic> json) {
    _user.token = json['token'] ?? '';
    _user.userid = json['userid'] ?? 0;
    _user.pic = json['pic'] ?? '';
    _user.nickname = json['nickname'] ?? '';
    storage.write(_userStorageKey, _user.toJson());
  }

  /// 登出
  void clearUser() {
    _user = UserStruct(token: '', dfid: '', userid: 0);
    storage.remove(_userStorageKey);
  }

  void init() {
    final user = storage.read<Map<String, dynamic>>(_userStorageKey);
    if (user != null) {
      _user = UserStruct.fromJson(user);
    } else {
      _user = UserStruct(
        token: '',
        dfid: '',
        userid: 0,
      );
      storage.write(_userStorageKey, _user.toJson());
    }
  }
}

final userInstance = User();
