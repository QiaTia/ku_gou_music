// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserInfo _$UserInfoFromJson(Map<String, dynamic> json) => _UserInfo(
  nickname: json['nickname'] as String? ?? '',
  kNickname: json['kNickname'] as String? ?? '',
  fxNickname: json['fxNickname'] as String? ?? '',
  kqTalent: json['kqTalent'] == null
      ? 0
      : const IntFromStringConverter().fromJson(json['kqTalent']),
  pic: json['pic'] as String? ?? '',
  kPic: json['kPic'] as String? ?? '',
  fxPic: json['fxPic'] as String? ?? '',
  gender: json['gender'] == null
      ? 0
      : const IntFromStringConverter().fromJson(json['gender']),
  vipType: json['vipType'] == null
      ? 0
      : const IntFromStringConverter().fromJson(json['vipType']),
  mType: json['mType'] == null
      ? 0
      : const IntFromStringConverter().fromJson(json['mType']),
  yType: json['yType'] == null
      ? 0
      : const IntFromStringConverter().fromJson(json['yType']),
  descri: json['descri'] as String? ?? '',
  constellation: json['constellation'] == null
      ? 0
      : const IntFromStringConverter().fromJson(json['constellation']),
  birthday: json['birthday'] as String? ?? '',
  city: json['city'] as String? ?? '',
  province: json['province'] as String? ?? '',
  occupation: json['occupation'] as String? ?? '',
  bgPic: json['bgPic'] as String? ?? '',
  loc: json['loc'] as String? ?? '',
  hobby: json['hobby'] as String? ?? '',
  remark: json['remark'] as String? ?? '',
  userLikeid: json['userLikeid'] as String? ?? '',
  follows: json['follows'] == null
      ? 0
      : const IntFromStringConverter().fromJson(json['follows']),
  fans: json['fans'] == null
      ? 0
      : const IntFromStringConverter().fromJson(json['fans']),
  friendTotal: json['friendTotal'] == null
      ? 0
      : const IntFromStringConverter().fromJson(json['friendTotal']),
  visitors: json['visitors'] == null
      ? 0
      : const IntFromStringConverter().fromJson(json['visitors']),
  friends: json['friends'] == null
      ? 0
      : const IntFromStringConverter().fromJson(json['friends']),
  hvisitors: json['hvisitors'] == null
      ? 0
      : const IntFromStringConverter().fromJson(json['hvisitors']),
  nvisitors: json['nvisitors'] == null
      ? 0
      : const IntFromStringConverter().fromJson(json['nvisitors']),
  relation: json['relation'] == null
      ? 0
      : const IntFromStringConverter().fromJson(json['relation']),
  authInfo: json['authInfo'] as String? ?? '',
  authInfoSinger: json['authInfoSinger'] as String? ?? '',
  authInfoTalent: json['authInfoTalent'] as String? ?? '',
  starStatus: json['starStatus'] == null
      ? 0
      : const IntFromStringConverter().fromJson(json['starStatus']),
  starId: json['starId'] == null
      ? 0
      : const IntFromStringConverter().fromJson(json['starId']),
  tmeStarStatus: json['tmeStarStatus'] == null
      ? 0
      : const IntFromStringConverter().fromJson(json['tmeStarStatus']),
  bizStatus: json['bizStatus'] == null
      ? 0
      : const IntFromStringConverter().fromJson(json['bizStatus']),
  pGrade: json['pGrade'] == null
      ? 0
      : const IntFromStringConverter().fromJson(json['pGrade']),
  faceAuth: json['faceAuth'] == null
      ? 0
      : const IntFromStringConverter().fromJson(json['faceAuth']),
  avatarReview: json['avatarReview'] == null
      ? 0
      : const IntFromStringConverter().fromJson(json['avatarReview']),
  iden: json['iden'] == null
      ? 0
      : const IntFromStringConverter().fromJson(json['iden']),
  isStar: json['isStar'] == null
      ? 0
      : const IntFromStringConverter().fromJson(json['isStar']),
  realAuth: json['realAuth'] == null
      ? 0
      : const IntFromStringConverter().fromJson(json['realAuth']),
  riskSymbol: json['riskSymbol'] == null
      ? 0
      : const IntFromStringConverter().fromJson(json['riskSymbol']),
  actorStatus: json['actorStatus'] == null
      ? 0
      : const IntFromStringConverter().fromJson(json['actorStatus']),
  singerStatus: json['singerStatus'] == null
      ? 0
      : const IntFromStringConverter().fromJson(json['singerStatus']),
  userType: json['userType'] == null
      ? 0
      : const IntFromStringConverter().fromJson(json['userType']),
  userYType: json['userYType'] == null
      ? 0
      : const IntFromStringConverter().fromJson(json['userYType']),
  kStar: json['kStar'] == null
      ? 0
      : const IntFromStringConverter().fromJson(json['kStar']),
  userLike: json['userLike'] == null
      ? 0
      : const IntFromStringConverter().fromJson(json['userLike']),
  userIsLike: json['userIsLike'] == null
      ? 0
      : const IntFromStringConverter().fromJson(json['userIsLike']),
  topNumber: json['topNumber'] == null
      ? 0
      : const IntFromStringConverter().fromJson(json['topNumber']),
  topVersion: json['topVersion'] as String? ?? '',
  knockCnt: json['knockCnt'] == null
      ? 0
      : const IntFromStringConverter().fromJson(json['knockCnt']),
  knock:
      (json['knock'] as List<dynamic>?)
          ?.map((e) => KnockInfo.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  medal: json['medal'] == null
      ? const MedalInfo()
      : MedalInfo.fromJson(json['medal'] as Map<String, dynamic>),
  svipLevel: json['svipLevel'] == null
      ? 0
      : const IntFromStringConverter().fromJson(json['svipLevel']),
  svipScore: json['svipScore'] == null
      ? 0
      : const IntFromStringConverter().fromJson(json['svipScore']),
  bookvipValid: json['bookvipValid'] == null
      ? 0
      : const IntFromStringConverter().fromJson(json['bookvipValid']),
  singvipValid: json['singvipValid'] == null
      ? 0
      : const IntFromStringConverter().fromJson(json['singvipValid']),
  suVipBeginTime: json['suVipBeginTime'] as String? ?? '',
  suVipEndTime: json['suVipEndTime'] as String? ?? '',
  suVipClearday: json['suVipClearday'] as String? ?? '',
  suVipYEndtime: json['suVipYEndtime'] as String? ?? '',
  servertime: json['servertime'] == null
      ? 0
      : const IntFromStringConverter().fromJson(json['servertime']),
  logintime: json['logintime'] == null
      ? 0
      : const IntFromStringConverter().fromJson(json['logintime']),
  rtime: json['rtime'] == null
      ? 0
      : const IntFromStringConverter().fromJson(json['rtime']),
  duration: json['duration'] == null
      ? 0
      : const IntFromStringConverter().fromJson(json['duration']),
  mainShortCase: json['mainShortCase'] as String? ?? '',
  mainLongCase: json['mainLongCase'] as String? ?? '',
  guestShortCase: json['guestShortCase'] as String? ?? '',
  bcCode: json['bcCode'] as String? ?? '',
  arttoyAvatar: json['arttoyAvatar'] as String? ?? '',
  visitorVisible: json['visitorVisible'] == null
      ? 1
      : const IntFromStringConverter().fromJson(json['visitorVisible']),
  configVal: json['configVal'] == null
      ? 0
      : const IntFromStringConverter().fromJson(json['configVal']),
  configVal1: json['configVal1'] == null
      ? 0
      : const IntFromStringConverter().fromJson(json['configVal1']),
  kuqunVisible: json['kuqunVisible'] == null
      ? 1
      : const IntFromStringConverter().fromJson(json['kuqunVisible']),
  commentVisible: json['commentVisible'] == null
      ? 1
      : const IntFromStringConverter().fromJson(json['commentVisible']),
  studentVisible: json['studentVisible'] == null
      ? 1
      : const IntFromStringConverter().fromJson(json['studentVisible']),
  followlistVisible: json['followlistVisible'] == null
      ? 0
      : const IntFromStringConverter().fromJson(json['followlistVisible']),
  fanslistVisible: json['fanslistVisible'] == null
      ? 1
      : const IntFromStringConverter().fromJson(json['fanslistVisible']),
  infoVisible: json['infoVisible'] == null
      ? 0
      : const IntFromStringConverter().fromJson(json['infoVisible']),
  followVisible: json['followVisible'] == null
      ? 1
      : const IntFromStringConverter().fromJson(json['followVisible']),
  listenVisible: json['listenVisible'] == null
      ? 0
      : const IntFromStringConverter().fromJson(json['listenVisible']),
  albumVisible: json['albumVisible'] == null
      ? 1
      : const IntFromStringConverter().fromJson(json['albumVisible']),
  pictorialVisible: json['pictorialVisible'] == null
      ? 1
      : const IntFromStringConverter().fromJson(json['pictorialVisible']),
  radioVisible: json['radioVisible'] == null
      ? 1
      : const IntFromStringConverter().fromJson(json['radioVisible']),
  soundVisible: json['soundVisible'] == null
      ? 1
      : const IntFromStringConverter().fromJson(json['soundVisible']),
  appletVisible: json['appletVisible'] == null
      ? 1
      : const IntFromStringConverter().fromJson(json['appletVisible']),
  selflistVisible: json['selflistVisible'] == null
      ? 1
      : const IntFromStringConverter().fromJson(json['selflistVisible']),
  collectlistVisible: json['collectlistVisible'] == null
      ? 1
      : const IntFromStringConverter().fromJson(json['collectlistVisible']),
  lvideoVisible: json['lvideoVisible'] == null
      ? 1
      : const IntFromStringConverter().fromJson(json['lvideoVisible']),
  svideoVisible: json['svideoVisible'] == null
      ? 1
      : const IntFromStringConverter().fromJson(json['svideoVisible']),
  mvVisible: json['mvVisible'] == null
      ? 1
      : const IntFromStringConverter().fromJson(json['mvVisible']),
  ksongVisible: json['ksongVisible'] == null
      ? 1
      : const IntFromStringConverter().fromJson(json['ksongVisible']),
  boxVisible: json['boxVisible'] == null
      ? 1
      : const IntFromStringConverter().fromJson(json['boxVisible']),
  nftVisible: json['nftVisible'] == null
      ? 1
      : const IntFromStringConverter().fromJson(json['nftVisible']),
  musicalVisible: json['musicalVisible'] == null
      ? 1
      : const IntFromStringConverter().fromJson(json['musicalVisible']),
  liveVisible: json['liveVisible'] == null
      ? 0
      : const IntFromStringConverter().fromJson(json['liveVisible']),
  timbreVisible: json['timbreVisible'] == null
      ? 1
      : const IntFromStringConverter().fromJson(json['timbreVisible']),
  assetsVisible: json['assetsVisible'] == null
      ? 1
      : const IntFromStringConverter().fromJson(json['assetsVisible']),
  onlineVisible: json['onlineVisible'] == null
      ? 1
      : const IntFromStringConverter().fromJson(json['onlineVisible']),
  ltingVisible: json['ltingVisible'] == null
      ? 1
      : const IntFromStringConverter().fromJson(json['ltingVisible']),
  listenmusicVisible: json['listenmusicVisible'] == null
      ? 0
      : const IntFromStringConverter().fromJson(json['listenmusicVisible']),
  likemusicVisible: json['likemusicVisible'] == null
      ? 0
      : const IntFromStringConverter().fromJson(json['likemusicVisible']),
  kuelfVisible: json['kuelfVisible'] == null
      ? 1
      : const IntFromStringConverter().fromJson(json['kuelfVisible']),
  shareVisible: json['shareVisible'] == null
      ? 1
      : const IntFromStringConverter().fromJson(json['shareVisible']),
  musicstationVisible: json['musicstationVisible'] == null
      ? 1
      : const IntFromStringConverter().fromJson(json['musicstationVisible']),
  yaicreationVisible: json['yaicreationVisible'] == null
      ? 1
      : const IntFromStringConverter().fromJson(json['yaicreationVisible']),
  ylikestoryVisible: json['ylikestoryVisible'] == null
      ? 1
      : const IntFromStringConverter().fromJson(json['ylikestoryVisible']),
  ychannelVisible: json['ychannelVisible'] == null
      ? 1
      : const IntFromStringConverter().fromJson(json['ychannelVisible']),
  ypublishstoryVisible: json['ypublishstoryVisible'] == null
      ? 1
      : const IntFromStringConverter().fromJson(json['ypublishstoryVisible']),
  myplayerVisible: json['myplayerVisible'] == null
      ? 0
      : const IntFromStringConverter().fromJson(json['myplayerVisible']),
  usermedalVisible: json['usermedalVisible'] == null
      ? 1
      : const IntFromStringConverter().fromJson(json['usermedalVisible']),
  singletrackVisible: json['singletrackVisible'] == null
      ? 1
      : const IntFromStringConverter().fromJson(json['singletrackVisible']),
  faxingkaVisible: json['faxingkaVisible'] == null
      ? 1
      : const IntFromStringConverter().fromJson(json['faxingkaVisible']),
  aiSongVisible: json['aiSongVisible'] == null
      ? 1
      : const IntFromStringConverter().fromJson(json['aiSongVisible']),
  mcardVisible: json['mcardVisible'] == null
      ? 1
      : const IntFromStringConverter().fromJson(json['mcardVisible']),
  visible: json['visible'] == null
      ? 1
      : const IntFromStringConverter().fromJson(json['visible']),
);

Map<String, dynamic> _$UserInfoToJson(_UserInfo instance) => <String, dynamic>{
  'nickname': instance.nickname,
  'kNickname': instance.kNickname,
  'fxNickname': instance.fxNickname,
  'kqTalent': const IntFromStringConverter().toJson(instance.kqTalent),
  'pic': instance.pic,
  'kPic': instance.kPic,
  'fxPic': instance.fxPic,
  'gender': const IntFromStringConverter().toJson(instance.gender),
  'vipType': const IntFromStringConverter().toJson(instance.vipType),
  'mType': const IntFromStringConverter().toJson(instance.mType),
  'yType': const IntFromStringConverter().toJson(instance.yType),
  'descri': instance.descri,
  'constellation': const IntFromStringConverter().toJson(
    instance.constellation,
  ),
  'birthday': instance.birthday,
  'city': instance.city,
  'province': instance.province,
  'occupation': instance.occupation,
  'bgPic': instance.bgPic,
  'loc': instance.loc,
  'hobby': instance.hobby,
  'remark': instance.remark,
  'userLikeid': instance.userLikeid,
  'follows': const IntFromStringConverter().toJson(instance.follows),
  'fans': const IntFromStringConverter().toJson(instance.fans),
  'friendTotal': const IntFromStringConverter().toJson(instance.friendTotal),
  'visitors': const IntFromStringConverter().toJson(instance.visitors),
  'friends': const IntFromStringConverter().toJson(instance.friends),
  'hvisitors': const IntFromStringConverter().toJson(instance.hvisitors),
  'nvisitors': const IntFromStringConverter().toJson(instance.nvisitors),
  'relation': const IntFromStringConverter().toJson(instance.relation),
  'authInfo': instance.authInfo,
  'authInfoSinger': instance.authInfoSinger,
  'authInfoTalent': instance.authInfoTalent,
  'starStatus': const IntFromStringConverter().toJson(instance.starStatus),
  'starId': const IntFromStringConverter().toJson(instance.starId),
  'tmeStarStatus': const IntFromStringConverter().toJson(
    instance.tmeStarStatus,
  ),
  'bizStatus': const IntFromStringConverter().toJson(instance.bizStatus),
  'pGrade': const IntFromStringConverter().toJson(instance.pGrade),
  'faceAuth': const IntFromStringConverter().toJson(instance.faceAuth),
  'avatarReview': const IntFromStringConverter().toJson(instance.avatarReview),
  'iden': const IntFromStringConverter().toJson(instance.iden),
  'isStar': const IntFromStringConverter().toJson(instance.isStar),
  'realAuth': const IntFromStringConverter().toJson(instance.realAuth),
  'riskSymbol': const IntFromStringConverter().toJson(instance.riskSymbol),
  'actorStatus': const IntFromStringConverter().toJson(instance.actorStatus),
  'singerStatus': const IntFromStringConverter().toJson(instance.singerStatus),
  'userType': const IntFromStringConverter().toJson(instance.userType),
  'userYType': const IntFromStringConverter().toJson(instance.userYType),
  'kStar': const IntFromStringConverter().toJson(instance.kStar),
  'userLike': const IntFromStringConverter().toJson(instance.userLike),
  'userIsLike': const IntFromStringConverter().toJson(instance.userIsLike),
  'topNumber': const IntFromStringConverter().toJson(instance.topNumber),
  'topVersion': instance.topVersion,
  'knockCnt': const IntFromStringConverter().toJson(instance.knockCnt),
  'knock': instance.knock,
  'medal': instance.medal,
  'svipLevel': const IntFromStringConverter().toJson(instance.svipLevel),
  'svipScore': const IntFromStringConverter().toJson(instance.svipScore),
  'bookvipValid': const IntFromStringConverter().toJson(instance.bookvipValid),
  'singvipValid': const IntFromStringConverter().toJson(instance.singvipValid),
  'suVipBeginTime': instance.suVipBeginTime,
  'suVipEndTime': instance.suVipEndTime,
  'suVipClearday': instance.suVipClearday,
  'suVipYEndtime': instance.suVipYEndtime,
  'servertime': const IntFromStringConverter().toJson(instance.servertime),
  'logintime': const IntFromStringConverter().toJson(instance.logintime),
  'rtime': const IntFromStringConverter().toJson(instance.rtime),
  'duration': const IntFromStringConverter().toJson(instance.duration),
  'mainShortCase': instance.mainShortCase,
  'mainLongCase': instance.mainLongCase,
  'guestShortCase': instance.guestShortCase,
  'bcCode': instance.bcCode,
  'arttoyAvatar': instance.arttoyAvatar,
  'visitorVisible': const IntFromStringConverter().toJson(
    instance.visitorVisible,
  ),
  'configVal': const IntFromStringConverter().toJson(instance.configVal),
  'configVal1': const IntFromStringConverter().toJson(instance.configVal1),
  'kuqunVisible': const IntFromStringConverter().toJson(instance.kuqunVisible),
  'commentVisible': const IntFromStringConverter().toJson(
    instance.commentVisible,
  ),
  'studentVisible': const IntFromStringConverter().toJson(
    instance.studentVisible,
  ),
  'followlistVisible': const IntFromStringConverter().toJson(
    instance.followlistVisible,
  ),
  'fanslistVisible': const IntFromStringConverter().toJson(
    instance.fanslistVisible,
  ),
  'infoVisible': const IntFromStringConverter().toJson(instance.infoVisible),
  'followVisible': const IntFromStringConverter().toJson(
    instance.followVisible,
  ),
  'listenVisible': const IntFromStringConverter().toJson(
    instance.listenVisible,
  ),
  'albumVisible': const IntFromStringConverter().toJson(instance.albumVisible),
  'pictorialVisible': const IntFromStringConverter().toJson(
    instance.pictorialVisible,
  ),
  'radioVisible': const IntFromStringConverter().toJson(instance.radioVisible),
  'soundVisible': const IntFromStringConverter().toJson(instance.soundVisible),
  'appletVisible': const IntFromStringConverter().toJson(
    instance.appletVisible,
  ),
  'selflistVisible': const IntFromStringConverter().toJson(
    instance.selflistVisible,
  ),
  'collectlistVisible': const IntFromStringConverter().toJson(
    instance.collectlistVisible,
  ),
  'lvideoVisible': const IntFromStringConverter().toJson(
    instance.lvideoVisible,
  ),
  'svideoVisible': const IntFromStringConverter().toJson(
    instance.svideoVisible,
  ),
  'mvVisible': const IntFromStringConverter().toJson(instance.mvVisible),
  'ksongVisible': const IntFromStringConverter().toJson(instance.ksongVisible),
  'boxVisible': const IntFromStringConverter().toJson(instance.boxVisible),
  'nftVisible': const IntFromStringConverter().toJson(instance.nftVisible),
  'musicalVisible': const IntFromStringConverter().toJson(
    instance.musicalVisible,
  ),
  'liveVisible': const IntFromStringConverter().toJson(instance.liveVisible),
  'timbreVisible': const IntFromStringConverter().toJson(
    instance.timbreVisible,
  ),
  'assetsVisible': const IntFromStringConverter().toJson(
    instance.assetsVisible,
  ),
  'onlineVisible': const IntFromStringConverter().toJson(
    instance.onlineVisible,
  ),
  'ltingVisible': const IntFromStringConverter().toJson(instance.ltingVisible),
  'listenmusicVisible': const IntFromStringConverter().toJson(
    instance.listenmusicVisible,
  ),
  'likemusicVisible': const IntFromStringConverter().toJson(
    instance.likemusicVisible,
  ),
  'kuelfVisible': const IntFromStringConverter().toJson(instance.kuelfVisible),
  'shareVisible': const IntFromStringConverter().toJson(instance.shareVisible),
  'musicstationVisible': const IntFromStringConverter().toJson(
    instance.musicstationVisible,
  ),
  'yaicreationVisible': const IntFromStringConverter().toJson(
    instance.yaicreationVisible,
  ),
  'ylikestoryVisible': const IntFromStringConverter().toJson(
    instance.ylikestoryVisible,
  ),
  'ychannelVisible': const IntFromStringConverter().toJson(
    instance.ychannelVisible,
  ),
  'ypublishstoryVisible': const IntFromStringConverter().toJson(
    instance.ypublishstoryVisible,
  ),
  'myplayerVisible': const IntFromStringConverter().toJson(
    instance.myplayerVisible,
  ),
  'usermedalVisible': const IntFromStringConverter().toJson(
    instance.usermedalVisible,
  ),
  'singletrackVisible': const IntFromStringConverter().toJson(
    instance.singletrackVisible,
  ),
  'faxingkaVisible': const IntFromStringConverter().toJson(
    instance.faxingkaVisible,
  ),
  'aiSongVisible': const IntFromStringConverter().toJson(
    instance.aiSongVisible,
  ),
  'mcardVisible': const IntFromStringConverter().toJson(instance.mcardVisible),
  'visible': const IntFromStringConverter().toJson(instance.visible),
};
