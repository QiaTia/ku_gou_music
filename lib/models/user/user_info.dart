// models/user_info.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import '../converters/int_from_string_converter.dart';
import 'medal_info.dart';
import 'knock_info.dart';
part 'user_info.freezed.dart';
part 'user_info.g.dart';

@freezed
abstract class UserInfo with _$UserInfo {
  const UserInfo._();

  const factory UserInfo({
    // ── 基础信息 ──
    @Default('') String nickname,
    @Default('') String kNickname,
    @Default('') String fxNickname,
    @IntFromStringConverter() @Default(0) int kqTalent,
    @Default('') String pic,
    @Default('') String kPic,
    @Default('') String fxPic,
    @IntFromStringConverter() @Default(0) int gender,
    @IntFromStringConverter() @Default(0) int vipType,
    @IntFromStringConverter() @Default(0) int mType,
    @IntFromStringConverter() @Default(0) int yType,
    @Default('') String descri,
    @IntFromStringConverter() @Default(0) int constellation,
    @Default('') String birthday,
    @Default('') String city,
    @Default('') String province,
    @Default('') String occupation,
    @Default('') String bgPic,
    @Default('') String loc,
    @Default('') String hobby,
    @Default('') String remark,
    @Default('') String userLikeid,

    // ── 社交数据 ──
    @IntFromStringConverter() @Default(0) int follows,
    @IntFromStringConverter() @Default(0) int fans,
    @IntFromStringConverter() @Default(0) int friendTotal,
    @IntFromStringConverter() @Default(0) int visitors,
    @IntFromStringConverter() @Default(0) int friends,
    @IntFromStringConverter() @Default(0) int hvisitors,
    @IntFromStringConverter() @Default(0) int nvisitors,

    // ── 认证 / 身份状态 ──
    @IntFromStringConverter() @Default(0) int relation,
    @Default('') String authInfo,
    @Default('') String authInfoSinger,
    @Default('') String authInfoTalent,
    @IntFromStringConverter() @Default(0) int starStatus,
    @IntFromStringConverter() @Default(0) int starId,
    @IntFromStringConverter() @Default(0) int tmeStarStatus,
    @IntFromStringConverter() @Default(0) int bizStatus,
    @IntFromStringConverter() @Default(0) int pGrade,
    @IntFromStringConverter() @Default(0) int faceAuth,
    @IntFromStringConverter() @Default(0) int avatarReview,
    @IntFromStringConverter() @Default(0) int iden,
    @IntFromStringConverter() @Default(0) int isStar,
    @IntFromStringConverter() @Default(0) int realAuth,
    @IntFromStringConverter() @Default(0) int riskSymbol,
    @IntFromStringConverter() @Default(0) int actorStatus,
    @IntFromStringConverter() @Default(0) int singerStatus,
    @IntFromStringConverter() @Default(0) int userType,
    @IntFromStringConverter() @Default(0) int userYType,
    @IntFromStringConverter() @Default(0) int kStar,

    // ── 互动 ──
    @IntFromStringConverter() @Default(0) int userLike,
    @IntFromStringConverter() @Default(0) int userIsLike,
    @IntFromStringConverter() @Default(0) int topNumber,
    @Default('') String topVersion,
    @IntFromStringConverter() @Default(0) int knockCnt,
    @Default([]) List<KnockInfo> knock,

    // ── 勋章 ──
    @Default(MedalInfo()) MedalInfo medal,

    // ── VIP / SVIP ──
    @IntFromStringConverter() @Default(0) int svipLevel,
    @IntFromStringConverter() @Default(0) int svipScore,
    @IntFromStringConverter() @Default(0) int bookvipValid,
    @IntFromStringConverter() @Default(0) int singvipValid,
    @Default('') String suVipBeginTime,
    @Default('') String suVipEndTime,
    @Default('') String suVipClearday,
    @Default('') String suVipYEndtime,

    // ── 时间戳 ──
    @IntFromStringConverter() @Default(0) int servertime,
    @IntFromStringConverter() @Default(0) int logintime,
    @IntFromStringConverter() @Default(0) int rtime,
    @IntFromStringConverter() @Default(0) int duration,

    // ── 案例编号 ──
    @Default('') String mainShortCase,
    @Default('') String mainLongCase,
    @Default('') String guestShortCase,
    @Default('') String bcCode,
    @Default('') String arttoyAvatar,

    // ── 可见性配置(40+ 字段,统一 int 0/1)──
    @IntFromStringConverter() @Default(1) int visitorVisible,
    @IntFromStringConverter() @Default(0) int configVal,
    @IntFromStringConverter() @Default(0) int configVal1,
    @IntFromStringConverter() @Default(1) int kuqunVisible,
    @IntFromStringConverter() @Default(1) int commentVisible,
    @IntFromStringConverter() @Default(1) int studentVisible,
    @IntFromStringConverter() @Default(0) int followlistVisible,
    @IntFromStringConverter() @Default(1) int fanslistVisible,
    @IntFromStringConverter() @Default(0) int infoVisible,
    @IntFromStringConverter() @Default(1) int followVisible,
    @IntFromStringConverter() @Default(0) int listenVisible,
    @IntFromStringConverter() @Default(1) int albumVisible,
    @IntFromStringConverter() @Default(1) int pictorialVisible,
    @IntFromStringConverter() @Default(1) int radioVisible,
    @IntFromStringConverter() @Default(1) int soundVisible,
    @IntFromStringConverter() @Default(1) int appletVisible,
    @IntFromStringConverter() @Default(1) int selflistVisible,
    @IntFromStringConverter() @Default(1) int collectlistVisible,
    @IntFromStringConverter() @Default(1) int lvideoVisible,
    @IntFromStringConverter() @Default(1) int svideoVisible,
    @IntFromStringConverter() @Default(1) int mvVisible,
    @IntFromStringConverter() @Default(1) int ksongVisible,
    @IntFromStringConverter() @Default(1) int boxVisible,
    @IntFromStringConverter() @Default(1) int nftVisible,
    @IntFromStringConverter() @Default(1) int musicalVisible,
    @IntFromStringConverter() @Default(0) int liveVisible,
    @IntFromStringConverter() @Default(1) int timbreVisible,
    @IntFromStringConverter() @Default(1) int assetsVisible,
    @IntFromStringConverter() @Default(1) int onlineVisible,
    @IntFromStringConverter() @Default(1) int ltingVisible,
    @IntFromStringConverter() @Default(0) int listenmusicVisible,
    @IntFromStringConverter() @Default(0) int likemusicVisible,
    @IntFromStringConverter() @Default(1) int kuelfVisible,
    @IntFromStringConverter() @Default(1) int shareVisible,
    @IntFromStringConverter() @Default(1) int musicstationVisible,
    @IntFromStringConverter() @Default(1) int yaicreationVisible,
    @IntFromStringConverter() @Default(1) int ylikestoryVisible,
    @IntFromStringConverter() @Default(1) int ychannelVisible,
    @IntFromStringConverter() @Default(1) int ypublishstoryVisible,
    @IntFromStringConverter() @Default(0) int myplayerVisible,
    @IntFromStringConverter() @Default(1) int usermedalVisible,
    @IntFromStringConverter() @Default(1) int singletrackVisible,
    @IntFromStringConverter() @Default(1) int faxingkaVisible,
    @IntFromStringConverter() @Default(1) int aiSongVisible,
    @IntFromStringConverter() @Default(1) int mcardVisible,
    @IntFromStringConverter() @Default(1) int visible,
  }) = _UserInfo;

  factory UserInfo.fromJson(Map<String, dynamic> json) =>
      _$UserInfoFromJson(json);

  // ════════════════════════════════════════
  //  业务便捷 getter
  // ════════════════════════════════════════

  /// 是否为 VIP
  bool get isVip => vipType > 0;

  /// 性别文案
  String get genderLabel {
    switch (gender) {
      case 1:
        return '男';
      case 2:
        return '女';
      default:
        return '未知';
    }
  }

  /// 年龄(根据 birthday "1997-06-20" 计算)
  int? get age {
    if (birthday.isEmpty) return null;
    final birth = DateTime.tryParse(birthday);
    if (birth == null) return null;
    final now = DateTime.now();
    var age = now.year - birth.year;
    if (now.month < birth.month ||
        (now.month == birth.month && now.day < birth.day)) {
      age--;
    }
    return age;
  }

  /// 星座名称
  String get constellationName {
    const names = [
      '',
      '白羊座',
      '金牛座',
      '双子座',
      '巨蟹座',
      '狮子座',
      '处女座',
      '天秤座',
      '天蝎座',
      '射手座',
      '摩羯座',
      '水瓶座',
      '双鱼座',
    ];
    return constellation >= 1 && constellation <= 12
        ? names[constellation]
        : '未知';
  }

  /// 是否已实名认证
  bool get isRealNameAuthed => realAuth == 1;

  /// 是否已人脸认证
  bool get isFaceAuthed => faceAuth == 1;

  /// 所在地(省份 + 城市)
  String get location {
    if (province.isEmpty && city.isEmpty) return '';
    if (province == city) return city;
    return '$province $city';
  }

  /// 服务器时间转 DateTime
  DateTime? get serverDateTime => servertime > 0
      ? DateTime.fromMillisecondsSinceEpoch(servertime * 1000)
      : null;

  /// 最近登录时间
  DateTime? get loginDateTime => logintime > 0
      ? DateTime.fromMillisecondsSinceEpoch(logintime * 1000)
      : null;

  /// 注册时间(rtime)
  DateTime? get registerDateTime =>
      rtime > 0 ? DateTime.fromMillisecondsSinceEpoch(rtime * 1000) : null;

  /// KTV 勋章等级(取 type2,如 "B0" → "B")
  String get ktvMedalLevel =>
      medal.ktv.type2.isNotEmpty ? medal.ktv.type2 : medal.ktv.type1;

  /// 是否有大咖敲门记录
  bool get hasKnock => knockCnt > 0 && knock.isNotEmpty;

  // ── 可见性统一查询 ──

  /// 通过模块名查询可见性,返回 bool
  /// 用法: userInfo.isModuleVisible('album') → albumVisible == 1
  bool isModuleVisible(String module) {
    final map = {
      'visitor': _visitorVisible,
      'comment': _commentVisible,
      'student': _studentVisible,
      'followlist': _followlistVisible,
      'fanslist': _fanslistVisible,
      'info': _infoVisible,
      'follow': _followVisible,
      'listen': _listenVisible,
      'album': _albumVisible,
      'pictorial': _pictorialVisible,
      'radio': _radioVisible,
      'sound': _soundVisible,
      'applet': _appletVisible,
      'selflist': _selflistVisible,
      'collectlist': _collectlistVisible,
      'lvideo': _lvideoVisible,
      'svideo': _svideoVisible,
      'mv': _mvVisible,
      'ksong': _ksongVisible,
      'box': _boxVisible,
      'nft': _nftVisible,
      'musical': _musicalVisible,
      'live': _liveVisible,
      'timbre': _timbreVisible,
      'assets': _assetsVisible,
      'online': _onlineVisible,
      'lting': _ltingVisible,
      'listenmusic': _listenmusicVisible,
      'likemusic': _likemusicVisible,
      'kuelf': _kuelfVisible,
      'share': _shareVisible,
      'musicstation': _musicstationVisible,
      'yaicreation': _yaicreationVisible,
      'ylikestory': _ylikestoryVisible,
      'ychannel': _ychannelVisible,
      'ypublishstory': _ypublishstoryVisible,
      'myplayer': _myplayerVisible,
      'usermedal': _usermedalVisible,
      'singletrack': _singletrackVisible,
      'faxingka': _faxingkaVisible,
      'ai_song': _aiSongVisible,
      'mcard': _mcardVisible,
    };
    return (map[module] ?? 0) == 1;
  }

  // 私有访问器,供 isModuleVisible 使用
  int get _visitorVisible => visitorVisible;
  int get _commentVisible => commentVisible;
  int get _studentVisible => studentVisible;
  int get _followlistVisible => followlistVisible;
  int get _fanslistVisible => fanslistVisible;
  int get _infoVisible => infoVisible;
  int get _followVisible => followVisible;
  int get _listenVisible => listenVisible;
  int get _albumVisible => albumVisible;
  int get _pictorialVisible => pictorialVisible;
  int get _radioVisible => radioVisible;
  int get _soundVisible => soundVisible;
  int get _appletVisible => appletVisible;
  int get _selflistVisible => selflistVisible;
  int get _collectlistVisible => collectlistVisible;
  int get _lvideoVisible => lvideoVisible;
  int get _svideoVisible => svideoVisible;
  int get _mvVisible => mvVisible;
  int get _ksongVisible => ksongVisible;
  int get _boxVisible => boxVisible;
  int get _nftVisible => nftVisible;
  int get _musicalVisible => musicalVisible;
  int get _liveVisible => liveVisible;
  int get _timbreVisible => timbreVisible;
  int get _assetsVisible => assetsVisible;
  int get _onlineVisible => onlineVisible;
  int get _ltingVisible => ltingVisible;
  int get _listenmusicVisible => listenmusicVisible;
  int get _likemusicVisible => likemusicVisible;
  int get _kuelfVisible => kuelfVisible;
  int get _shareVisible => shareVisible;
  int get _musicstationVisible => musicstationVisible;
  int get _yaicreationVisible => yaicreationVisible;
  int get _ylikestoryVisible => ylikestoryVisible;
  int get _ychannelVisible => ychannelVisible;
  int get _ypublishstoryVisible => ypublishstoryVisible;
  int get _myplayerVisible => myplayerVisible;
  int get _usermedalVisible => usermedalVisible;
  int get _singletrackVisible => singletrackVisible;
  int get _faxingkaVisible => faxingkaVisible;
  int get _aiSongVisible => aiSongVisible;
  int get _mcardVisible => mcardVisible;
}
