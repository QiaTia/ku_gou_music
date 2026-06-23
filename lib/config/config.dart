import 'package:flutter/widgets.dart';
import './util.dart';

const isLite = true;
const wx_appid = "wx79f2c4418704b4f8";
const wx_lite_appid = "wx72b795aca60ad321";
const wx_secret = "4efcab88b700769e376e3f6087b8abc9";
const wx_lite_secret = "33e486041e5e25729a4e3d2da7502f9a";
const srcappid =2919;
const appid = 1005;
const apiver = 20;
const clientver = 20489;
const liteAppid = 3116;
const liteClientver = 11440;
final mid = calculateMid(cryptoMd5(getGuid()));

// const mid = '334689572176563962868706300678062568191';
// 通常放在顶层或路由配置文件中

final RouteObserver<ModalRoute<void>> routeObserver =    RouteObserver<ModalRoute<void>>();