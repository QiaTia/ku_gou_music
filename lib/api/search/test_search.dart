import 'dart:convert';
import 'dart:io';
import 'package:ku_gou_music/api/search/search.dart';

void main() async {

  print('\n=== 单曲搜索: "周杰伦" ===');
  try {
    final songRes = await search('稻香', 'song');
    print('单曲搜索成功');
    print(songRes);
  } catch (e) {
    print('单曲搜索失败: $e');
  }

  print('\n=== 歌单搜索: "周杰伦" ===');
  try {
    final specialRes = await search('周杰伦', 'special');
    print('歌单搜索成功');
    print(specialRes);
  } catch (e) {
    print('歌单搜索失败: $e');
  }

  exit(0);
}
