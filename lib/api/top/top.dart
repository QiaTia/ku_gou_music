import 'dart:convert';

import 'package:ku_gou_music/utils/utils.dart';
import '../../config/util.dart';
import '../request/request.dart';
import 'package:ku_gou_music/store/user.dart';

/// 热门好歌精选
// song_module_1 card_id_1: 精选好歌随心听 || 私人专属好歌
// song_module_2 card_id_2: 经典怀旧金曲
// song_module_3 card_id_3:  热门好歌精选
// song_module_4 card_id_4: 小众宝藏佳作
// song_module_6 card_id_6: vip专属推荐
// const { appid, clientver, cryptoMd5, signParamsKey } = require('../util');

Future<ResponseOptions<Map<String, dynamic>>> getTopCart([int id = 1]) {
  // const dfid = params?.dfid || params?.cookie?.dfid || '-';
  const dfid = '-';
  const fakem = '60f7ebf1f812edbac3c63a7310001701760f';
  // const mid = params?.cookie?.KUGOU_API_MID;
  final dateTime = DateTime.now().millisecondsSinceEpoch;

  Map<String, dynamic> dataMap = {
    'appid': appid,
    'clientver': clientver,
    "platform": 'android',
    'clienttime': dateTime,
    'userid': 0, //params?.userid || params?.cookie?.userid || 0,
    'key': signParamsKey(dateTime.toString()),
    'fakem': fakem,
    "area_code": 1,
    "mid": '', // mid,
    'uuid': '-',
    'client_playlist': [],
    'u_info': 'a0c35cd40af564444b5584c2754dedec',
  };

  return createRequest(RequestOptions(
    url: '/singlecardrec.service/v1/single_card_recommend',
    encryptType: 'android',
    method: 'POST',
    data: dataMap,
    params: { 'card_id': 1, 'fakem': fakem, 'area_code': 1, 'platform': 'ios' },
  ));
}

Future<List<PlaylistModel>> getTopPlaylist([
  int categoryid = 0,
  int withsong = 1,
  int withtag = 1,
  int sort = 1,
  int page = 1,
  int pagesize = 30,
  int moduleId = 1,
]) async {
  final userId = userInstance.userid;
  final mid = userInstance.mid;
  final dateTime = DateTime.now().millisecondsSinceEpoch ~/ 1000;
  // 构建 specialRecommend 对象
  final specialRecommend = {
    'withtag': withtag,
    'withsong': withsong,
    'sort': sort,
    'ugc': 1,
    'is_selected': 0,
    'withrecommend': 1,
    'area_code': 1,
    'categoryid': categoryid,
  };
   // 构建 dataMap 对象
  final dataMap = {
    'appid': appid, // 替换为实际值
    'mid': mid,
    'clientver': clientver, // 替换为实际值
    'platform': 'android',
    'clienttime': dateTime,
    'userid': userId,
    'module_id': moduleId,
    'page': page,
    'pagesize': pagesize,
    'key': signParamsKey(dateTime.toString()),
    'special_recommend': specialRecommend,
    'req_multi': 1,
    'retrun_min': 5,
    'return_special_falg': 1,
  };

  var response = (await createRequest<Map<String, dynamic>>(RequestOptions(
    url: '/v2/special_recommend',
    encryptType: 'android',
    method: 'POST',
    data: dataMap,
    cookie: {},
    headers: { 'x-router': 'specialrec.service.kugou.com' },
  ))).body?['data'];
  if (response is! Map) {
    throw response;
  }
  var responseList = response['special_list'];
  List<PlaylistModel> playlistModelList = [];
  if (responseList is List) {
    playlistModelList = responseList.map((e) => PlaylistModel.fromJson(e)).toList();
  }
  return playlistModelList;
}


/// 歌单列表详情
class PlaylistModel {
  /// 同步标识
  final int? sync;
  /// 歌单特殊 ID
  final int? specialid;
  /// 弹性封面图 URL
  final String? flexibleCover;
  /// 版权状态标识
  final int? bzStatus;
  /// 歌手名称
  final String? singername;
  /// 每页数量
  final int? percount;
  /// 算法路径
  final String? algPath;
  /// 来源标识
  final int? from;
  /// 标签列表
  final List<Tag>? tags;
  /// UGC 人才评论标识
  final int? ugcTalentReview;
  /// SLID (可能是播放列表 ID)
  final int? slid;
  /// 类型
  final int? type;
  /// 昵称
  final String? nickname;
  /// 显示标识
  final String? show;
  /// 收藏类型
  final int? collectType;
  /// 收藏数量
  final int? collectcount;
  /// 报告信息
  final String? reportInfo;
  /// 歌单名称
  final String? specialname;
  /// 图片 URL
  final String? imgurl;
  /// 播放次数
  final int? playCount;
  /// 图片路径
  final String? pic;
  /// 来源 Hash 值
  final String? fromHash;
  /// 来源标签标识
  final int? fromTag;
  /// 发布时间
  final String? publishtime;
  /// 全局收藏 ID
  final String? globalCollectionId;
  /// 介绍/描述
  final String? intro;
  /// SUID (可能是用户 ID)
  final int? suid;

  PlaylistModel({
    this.sync,
    this.specialid,
    this.flexibleCover,
    this.bzStatus,
    this.singername,
    this.percount,
    this.algPath,
    this.from,
    this.tags,
    this.ugcTalentReview,
    this.slid,
    this.type,
    this.nickname,
    this.show,
    this.collectType,
    this.collectcount,
    this.reportInfo,
    this.specialname,
    this.imgurl,
    this.playCount,
    this.pic,
    this.fromHash,
    this.fromTag,
    this.publishtime,
    this.globalCollectionId,
    this.intro,
    this.suid,
  });

  factory PlaylistModel.fromJson(Map<String, dynamic> json) {
    dynamic tagsValue = json['tags'];
    List<Tag>? tags = tagsValue is List ?
      tagsValue.map((e) => Tag.fromJson(e as Map<String, dynamic>)).toList()
      : tagsValue is String ? tagsValue.split(',').map((name) => Tag(tagName: name)).toList() : null;
    return PlaylistModel(
      sync: json['sync'] as int?,
      specialid: json['specialid'] as int?,
      flexibleCover: json['flexible_cover'] is String ? getImageUri(json['flexible_cover']) : null,
      bzStatus: json['bz_status'] as int?,
      singername: json['singername'] as String?,
      percount: json['percount'] as int?,
      algPath: json['algPath'] as String?,
      from: json['from'] as int?,
      tags: tags,
      ugcTalentReview: json['ugc_talent_review'] as int?,
      slid: json['slid'] as int?,
      type: json['type'] as int?,
      nickname: (json['nickname'] ?? json['list_create_username'])as String? ,
      show: json['show'] as String?,
      collectType: json['collectType'] as int?,
      collectcount: json['collectcount'] as int?,
      reportInfo: json['reportInfo'] as String?,
      specialname: (json['specialname'] ?? json['name']) as String?,
      imgurl: json['imgurl'] as String?,
      playCount: json['play_count'] as int?,
      pic: json['pic'] is String ? getImageUri(json['pic']) : null,
      fromHash: json['from_hash'] as String?,
      fromTag: json['from_tag'] as int?,
      publishtime: json['publishtime'] as String?,
      globalCollectionId: json['global_collection_id'] as String?,
      intro: json['intro'] as String?,
      suid: json['suid'] as int?,
    );
  }
}
/// 标签
class Tag {
  final String? tagName;
  final int? tagId;

  Tag({
    this.tagName,
    this.tagId,
  });

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      tagName: json['tag_name'] as String?,
      tagId: json['tag_id'] as int?,
    );
  }
}
