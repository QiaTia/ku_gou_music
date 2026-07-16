/// 音频质量等级
/// 按码率从低到高排列，用于排序和比较
enum AudioQuality {
  /// 标准音质 128kbps
  standard(128, '128', '标准', 'mp3'),
  /// 高品质 320kbps
  high(320, '320', '高品质', 'mp3'),
  /// 无损 FLAC
  flac(1000, 'flac', '无损', 'flac'),
  /// Hi-Res
  hires(2000, 'high', 'Hi-Res', 'flac');

  const AudioQuality(this.bitrate, this.apiValue, this.label, this.extName);

  /// 标称码率，用于排序比较（128 < 320 < 1000 < 2000）
  final int bitrate;

  /// 传给 getMusicUrls() 的 quality 参数值
  final String apiValue;

  /// UI 显示名称
  final String label;

  /// 文件扩展名
  final String extName;

  /// 从 API 返回的 quality 字符串反解
  static AudioQuality? fromApiValue(String value) {
    for (final q in AudioQuality.values) {
      if (q.apiValue == value) return q;
    }
    return null;
  }

  /// 从码率值推断（API 有时返回 bitrate 数字）
  static AudioQuality? fromBitrate(int bitrate) {
    if (bitrate >= 800) return AudioQuality.flac;
    if (bitrate >= 250) return AudioQuality.high;
    if (bitrate >= 100) return AudioQuality.standard;
    return null;
  }

  /// 判断当前用户是否可用此音质（根据 SongItemStruct 的 privilege/is_sq/is_hq）
  bool isAvailableFor({
    required int privilege,
    required bool isSq,
    required bool isHq,
  }) {
    switch (this) {
      case AudioQuality.standard:
        return true; // 128kbps 对所有用户可用
      case AudioQuality.high:
        return isHq || privilege >= 1;
      case AudioQuality.flac:
        return isSq || privilege >= 2;
      case AudioQuality.hires:
        return privilege >= 4; // Hi-Res 需要更高特权
    }
  }
}

/// 魔法音效类型（独立于音质等级，是音效处理）
enum MagicEffect {
  piano('piano', '钢琴'),
  acappella('acappella', '人声分离'),
  subwoofer('subwoofer', '乐器'),
  ancient('ancient', '尤克里里'),
  dj('dj', 'DJ'),
  surnay('surnay', '唢呐');

  const MagicEffect(this.apiValue, this.label);

  final String apiValue;
  final String label;

  /// 传给 getMusicUrls 的 quality 值（加 magic_ 前缀）
  String get magicApiValue => 'magic_$apiValue';

  static MagicEffect? fromApiValue(String value) {
    for (final e in MagicEffect.values) {
      if (e.apiValue == value) return e;
    }
    return null;
  }
}
