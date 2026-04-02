
/// 格式化展示毫秒
String formatMilliseconds(int milliseconds) {
  Duration duration = Duration(milliseconds: milliseconds);
  return duration.toString().split('.').first.padLeft(8, "0");
}

String getImageUri(String url, {int size = 480, Pattern reg = '{size}'}) {
  return url.replaceAll(reg, size.toString());
}
