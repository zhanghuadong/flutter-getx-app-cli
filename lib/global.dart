import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ducafecat_news_getx/common/services/services.dart';
// import 'package:flutter_ducafecat_news_getx/common/store/store.dart';
import 'package:flutter_ducafecat_news_getx/common/utils/utils.dart';
import 'package:get/get.dart';

import 'common/store/store.dart';

// /// 全局静态数据
// class Global {
//   /// 初始化
//   static Future init() async {
//     // binding初始化(ensureInitialized) ensureInitialized 通过7个 mixin 类 按顺序完成相关初始化工作  参考 https://www.jianshu.com/p/6994f65be6f9
//     WidgetsFlutterBinding.ensureInitialized();
//     //
//     await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

//     setSystemUi();
//     Loading();

//     await Get.putAsync<StorageService>(() => StorageService().init());
//     // 初始化全局配置
//     Get.put<ConfigStore>(ConfigStore());
//     // 初始化用户信息
//     Get.put<UserStore>(UserStore());
//   }

// //  处理系统UI
//   static void setSystemUi() {
//     if (GetPlatform.isAndroid) {
//       // 覆盖系统ui
//       SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
//         statusBarColor: Colors.transparent, // 顶部状态栏隐藏
//         statusBarBrightness: Brightness.light, // 颜色为浅色
//         statusBarIconBrightness: Brightness.dark,
//         systemNavigationBarDividerColor: Colors.transparent,
//         systemNavigationBarColor: Colors.white,
//         systemNavigationBarIconBrightness: Brightness.dark,
//       );
//       SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
//     }
//   }
// }
class Global {
  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    setSystemUi();
    Loading();
    // 注册一个异步实例
    await Get.putAsync<StorageService>(() => StorageService().init());
    Get.put<ConfigStore>(ConfigStore());
    Get.put<UserStore>(UserStore());
  }

  static void setSystemUi() {
    if (GetPlatform.isAndroid) {
      SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: Colors.white,
          systemNavigationBarIconBrightness: Brightness.dark,
          systemNavigationBarDividerColor: Colors.transparent);
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    }
  }
}
