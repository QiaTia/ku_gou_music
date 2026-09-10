# 网络层与签名机制

本文档描述 `lib/api/` 的请求封装、酷狗网关签名机制、接口模块清单与相关配置常量。

## 请求封装（lib/api/request/request.dart）

网络层基于 dio，核心为 top-level 单例 `dio` 与 `createRequest<T>()` 函数。所有业务接口（`lib/api/**`）统一通过 `createRequest` 发起请求。

### RequestOptions

`createRequest` 的入参，关键字段：

| 字段                   | 说明                                                         |
| -------------------- | ---------------------------------------------------------- |
| `url` / `baseURL`    | 接口路径与网关地址（默认 `SERVER_API_URL = https://gateway.kugou.com`） |
| `method`             | GET（默认）/ POST / PUT / DELETE / PATCH                       |
| `params` / `data`    | 查询参数 / 请求体（Map 会 jsonEncode）                               |
| `encryptType`        | 签名方式：`'android'`（默认）/ `'web'` / `'register'`               |
| `cookie`             | 自定义 dfid / token / userid（默认取 `userInstance`）              |
| `encryptKey`         | 为 true 时额外计算 `key` 参数（signKey）                             |
| `clearDefaultParams` | 为 true 时不注入默认参数                                            |
| `notSignature`       | 为 true 时跳过签名                                               |
| `realIP` / `ip`      | 伪造 X-Real-IP / X-Forwarded-For（默认 `127.0.0.1`）             |
| `responseType`       | 如 `ResponseType.bytes`（下载音频文件时）                            |

### createRequest 处理流程

1. **组装请求头**：User-Agent（Android 客户端伪装）、`dfid`、`clienttime`、`mid`、`kg-rc` / `kg-thash` / `kg-rec` / `kg-rf` 等固定头，以及 `X-Real-IP` / `X-Forwarded-For`
2. **注入默认参数**：`dfid` / `mid` / `uuid` / `appid` / `clientver` / `clienttime`；已登录时附加 `token` / `userid`
3. **int → String**：所有 int 类型参数转为字符串（Uri 库限制）
4. **签名**：`encryptKey` 为 true 时计算 `key`；未显式传 `signature` 且未设 `notSignature` 时，按 `encryptType` 计算 `signature`
5. **发起请求**：`dio.request()`，返回统一封装的 `ResponseOptions<T>`

### ResponseOptions

统一响应封装：`status`（接口 `code` 或 HTTP 状态码）、`body`（JSON 反序列化结果）、`cookie`（`set-cookie` 解析后列表，经 `parseCookieString` 清理 Domain / path / expires / HttpOnly）、`headers`。请求异常时抛出 `ResponseOptions(status: 502)`。

## 签名机制（lib/api/request/helper.dart）

三种 `signature` 算法均为 MD5，差异在于盐值与拼接方式：

### android（默认）

```
salt = isLite ? 'LnT6xpN3khm36zse0QzvmgTZ3waWdRSA' : 'OIlwieks28dk2k092lksi2UIkp'
md5( salt + 按 key 排序的「k=v」拼接 + 请求体 + salt )
```

### web

```
salt = 'NVPh5oo715z5DIWAeQlhMDsWXXQV4hwt'
md5( salt + 按 key 排序的「k=v」拼接 + salt )
```

### register

设备注册专用：

```
md5( '1014' + 按 value 排序的值拼接 + '1014' )
```

### 其他签名函数

| 函数                                              | 用途                                           |
| ----------------------------------------------- | -------------------------------------------- |
| `signKey`                                       | 计算 `key` 参数（hash + 盐 + appid + mid + userid） |
| `signParams` / `signParamsKey` / `signCloudKey` | 其他业务签名（云盘等）                                  |
| `cryptoMd5`                                     | 通用 MD5（也用于 `mid` 生成）                         |

> ⚠️ 盐值与 `appid` / `clientver` 等均为酷狗客户端常量，已硬编码在源码中，仅供学习调试使用。

## RSA NoPadding 加密（lib/config/encrypt\_ext.dart）

登录密码等敏感数据使用 RSA 公钥 **NoPadding** 加密（`encryptRSANoPadding`）：手动零填充至模数长度后做 `modPow`，输出 base64。底层依赖 `pointycastle`，公钥解析使用 `basic_utils`（PEM）。

## 接口模块清单

### login（lib/api/login/）

| 函数                                   | 接口 | 说明                 |
| ------------------------------------ | -- | ------------------ |
| `login`（login.dart）                  | —  | 账号密码登录（RSA 加密密码）   |
| `checkQrStatus`（qr.dart）             | —  | 二维码登录状态轮询          |
| `registerDevice`（register\_dev.dart） | —  | 设备注册，首次启动获取 `dfid` |

### search（lib/api/search/search.dart）

| 函数              | 接口                                      | 说明                    |
| --------------- | --------------------------------------- | --------------------- |
| `search`        | `/v3/search/song` 或 `/v1/search/{type}` | 单类型搜索（song 走 v3）      |
| `searchComplex` | `/v6/search/complex`                    | 综合搜索（单曲/歌单/专辑/MV/歌手等） |

### song（lib/api/song/song.dart）

| 函数                                | 接口             | 说明             |
| --------------------------------- | -------------- | -------------- |
| `getMusicUrls`                    | `/v5/url`      | 获取播放地址（支持音质选择） |
| —                                 | `/v6/priv_url` | 付费/版权曲目地址      |
| `searchLyrics` / `getMusicLyrics` | —              | 歌词搜索与获取        |

### playlist（lib/api/playlist/）

| 函数                               | 接口                                        | 说明         |
| -------------------------------- | ----------------------------------------- | ---------- |
| `getPlaylist`                    | `/pubsongs/v2/get_other_list_file_nofilt` | 歌单详情       |
| `getPlaylistTrackAll`            | `/pubsongs/v2/get_other_list_file_nofilt` | 歌单曲目列表（分页） |
| `getPlaylistTag`                 | `/pubsongs/v1/get_tags_by_type`           | 歌单标签       |
| `addToPlaylist`（track.dart）      | `/cloudlist.service/v6/add_song`          | 添加歌曲到歌单    |
| `removeFromPlaylist`（track.dart） | `/v4/delete_songs`                        | 从歌单删除歌曲    |
| `getPlaylistSongs`（track.dart）   | `/pubsongs/v2/get_other_list_file_nofilt` | 指定歌单曲目     |

### top（lib/api/top/top.dart）

| 函数               | 接口                                                | 说明         |
| ---------------- | ------------------------------------------------- | ---------- |
| `getTopCart`     | `/singlecardrec.service/v1/single_card_recommend` | 推荐卡片       |
| `getTopPlaylist` | `/v2/special_recommend`                           | 排行榜 / 推荐歌单 |

### user（lib/api/user/user.dart）

| 函数                | 接口                  | 说明     |
| ----------------- | ------------------- | ------ |
| `getUserPlaylist` | `/v7/get_all_list`  | 用户全部歌单 |
| `getUserDetail`   | `/v3/get_my_info`   | 用户信息   |
| `getUserVipInfo`  | `/v1/get_union_vip` | VIP 信息 |

> 除设备注册外，上述接口均使用 `encryptType: 'android'` 签名。

## 配置常量（lib/config/config.dart）

| 常量                                           | 说明                                                                       |
| -------------------------------------------- | ------------------------------------------------------------------------ |
| `isLite`                                     | 是否极速版（当前为 `true`，影响 appid / clientver 与签名盐值）                             |
| `appid` = 1005 / `clientver` = 20489         | 正式版客户端标识                                                                 |
| `liteAppid` = 3116 / `liteClientver` = 11440 | 极速版客户端标识                                                                 |
| `srcappid` = 2919                            | 来源 appid                                                                 |
| `mid`                                        | 设备标识，启动时 `calculateMid(cryptoMd5(getGuid()))` 生成（`lib/config/util.dart`） |
| `wx_appid` / `wx_secret` 等                   | 微信登录相关（预留）                                                               |

## 用户态与请求的关系

`lib/store/user.dart` 的 `userInstance` 单例持有 `token` / `dfid` / `userid`，`createRequest` 每次请求自动读取注入默认参数；登录 / 登出 / 设备注册成功后由 `User` 写回 GetStorage 持久化。

## Mock 与测试

- 单元 / 集成测试可替换 `dio.httpClientAdapter`（top-level `dio`），按 URL 返回 fixture JSON

- 现有集成测试的 `MockSearchAdapter`（`integration_test/mock/search_mock_adapter.dart`）匹配 `complexsearch.kugou.com/v6/search/complex` 与 `/v3/search/song`，未匹配 URL 一律返回 `{status:1, data:{}}` 保证其他页面安全渲染

