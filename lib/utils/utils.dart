
/// 格式化展示毫秒
String formatMilliseconds(int milliseconds) {
  Duration duration = Duration(milliseconds: milliseconds);
  return duration.toString().split('.').first.padLeft(8, "0");
}

String getImageUri(String url, {int size = 480, Pattern reg = '{size}'}) {
  return url.replaceAll(reg, size.toString());
}

/// 去除搜索接口返回的 HTML 高亮标记（如 <em>关键词</em>）
String stripHtmlTags(String input) {
  return input.replaceAll(RegExp(r'<[^>]*>'), '');
}

/// 格式化秒数为 mm:ss
String formatDuration(int seconds) {
  final m = seconds ~/ 60;
  final s = (seconds % 60).toString().padLeft(2, '0');
  return '$m:$s';
}
