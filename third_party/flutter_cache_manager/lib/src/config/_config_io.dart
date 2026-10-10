import 'dart:io';

import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_cache_manager/src/config/config.dart' as def;

class Config implements def.Config {
  Config(
    this.cacheKey, {
    Duration? stalePeriod,
    int? maxNrOfCacheObjects,
    CacheInfoRepository? repo,
    FileSystem? fileSystem,
    FileService? fileService,
  }) : stalePeriod = stalePeriod ?? const Duration(days: 30),
       maxNrOfCacheObjects = maxNrOfCacheObjects ?? 200,
       repo = repo ?? _createRepo(cacheKey),
       fileSystem = fileSystem ?? IOFileSystem(cacheKey),
       fileService = fileService ?? HttpFileService();

  @override
  final CacheInfoRepository repo;

  @override
  final FileSystem fileSystem;

  @override
  final String cacheKey;

  @override
  final Duration stalePeriod;

  @override
  final int maxNrOfCacheObjects;

  @override
  final FileService fileService;

  static CacheInfoRepository _createRepo(String key) {
    // Windows: JSON 元数据索引文件每次重写都会被杀毒软件/系统索引服务
    // 短暂加锁，导致写入报 errno 5 (拒绝访问) 且重试也难命中空窗。
    // 改用非持久化索引：图片文件仍正常落盘缓存，仅索引重启后重建。
    if (Platform.isWindows) {
      return NonStoringObjectProvider();
    }
    if (Platform.isAndroid || Platform.isIOS || Platform.isMacOS) {
      return CacheObjectProvider(databaseName: key);
    }
    return JsonCacheInfoRepository(databaseName: key);
  }
}
