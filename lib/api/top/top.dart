import '../../config/util.dart';
import '../request/request.dart';

/// 热门好歌精选
// song_module_1 card_id_1: 精选好歌随心听 || 私人专属好歌
// song_module_2 card_id_2: 经典怀旧金曲
// song_module_3 card_id_3:  热门好歌精选
// song_module_4 card_id_4: 小众宝藏佳作
// song_module_6 card_id_6: vip专属推荐
// const { appid, clientver, cryptoMd5, signParamsKey } = require('../util');

Future getTopCart([int id = 1]) {
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
