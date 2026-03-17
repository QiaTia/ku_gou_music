import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ku_gou_music/api/login/login.dart';
import 'package:ku_gou_music/api/song/song.dart';
import 'package:ku_gou_music/api/user/user.dart';
import 'package:ku_gou_music/views/home/pc/layout.dart';
import 'bindings/music_binding.dart';
import 'package:layout/layout.dart';
import 'controllers/music_controller.dart';
import 'services/audio_service.dart';
import 'views/music/player_screen.dart';
import 'store/user.dart';

void main() async {
  await GetStorage.init();
  userInstance.init();

  // getUserPlaylist(pagesize: 99)
  //   .then((t) {
  //     print(t);
  //   }).catchError((e) {
  //     print(e);
  //   });
  // getMusicUrls(hash: 'B017A5C57FFF594987236DB3F1499436').then((t) {
  //     print(t);
  //   }).catchError((e) {
  //     print(e);
  //   });
  // searchLyrics(hash: 'F460C7B867DCC5F49A0FB9574954CFD7')
  //   .then((t) {
  //     print(t);
  //   }).catchError((e) {
  //     print(e);
  //   });
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Layout(
      child: GetMaterialApp(
        title: '音乐播放器',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: .fromSeed(seedColor: Colors.deepPurple),
        ),
        darkTheme: ThemeData.dark(),
        initialBinding: MusicBinding(),
        home: const HomePage(),
      ));
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'api/playlist/playlist.dart';
// import 'api/top/top.dart';
// import 'api/login/login.dart';
// import 'api/song/song.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     // getTopCart().then((t) {
//     //   print(t);
//     // }).catchError((e) {
//     //   print(e);
//     // });
//     // getMusicUrls(freePart: 1, hash: 'C620411F0FFE6B76D3D310EA2E2BA0EE').then((t) {
//     //   print(t);
//     // }).catchError((e) {
//     //   print(e);
//     // });
//     return GetMaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // TRY THIS: Try running your application with "flutter run". You'll see
//         // the application has a purple toolbar. Then, without quitting the app,
//         // try changing the seedColor in the colorScheme below to Colors.green
//         // and then invoke "hot reload" (save your changes or press the "hot
//         // reload" button in a Flutter-supported IDE, or press "r" if you used
//         // the command line to start the app).
//         //
//         // Notice that the counter didn't reset back to zero; the application
//         // state is not lost during the reload. To reset the state, use hot
//         // restart instead.
//         //
//         // This works for code too, not just values: Most code changes can be
//         // tested with just a hot reload.
//         colorScheme: .fromSeed(seedColor: Colors.deepPurple),
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }
