import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_ducafecat_news_getx/common/langs/translation_service.dart';
import 'package:flutter_ducafecat_news_getx/common/routes/pages.dart';
import 'package:flutter_ducafecat_news_getx/common/store/store.dart';
import 'package:flutter_ducafecat_news_getx/common/style/style.dart';
import 'package:flutter_ducafecat_news_getx/common/utils/utils.dart';
import 'package:flutter_ducafecat_news_getx/global.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

// 创建 SentryClient 用于将异常日志上报给 sentry 平台
// 是否开发环境

// 上报异常
Future<void> reportError(dynamic exception, dynamic stackTrace) async {
  final SentryId response = await Sentry.captureException(
    exception,
    stackTrace: stackTrace,
  );
  if (response.toString().isNotEmpty) {
    print('Success! Event ID: ${response.toString()}');
  } else {
    print('Failed to report to Sentry.io: ${response.toString()}');
  }
}

Future<void> main() async {
  await Global.init();
  await SentryFlutter.init(
    (options) => options.dsn =
        'https://b509526ec8cc4816ac4895f96ab93dce@o1055747.ingest.sentry.io/6041888',
    appRunner: () => runApp(MyApp()),
  );

  // runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: (BuildContext context, Widget? child) => RefreshConfiguration(
        headerBuilder: () => ClassicHeader(),
        footerBuilder: () => ClassicFooter(),
        hideFooterWhenNotFull: true,
        headerTriggerDistance: 80,
        footerTriggerDistance: 150,
        child: GetMaterialApp(
          title: "News",
          theme: AppTheme.light,
          debugShowCheckedModeBanner: false,
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
          builder: EasyLoading.init(),
          translations: TranslationService(),
          navigatorObservers: [AppPages.observer],
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: ConfigStore.to.languages,
          locale: ConfigStore.to.locale,
          fallbackLocale: Locale('en', 'US'),
          enableLog: true,
          logWriterCallback: Logger.write,
        ),
      ),
    );
    //return ScreenUtilInit(
    //  designSize: Size(375, 812),
    //  builder: () =>
    //);
  }
}

// Future<void> main() async {
//   // 第一步初始化项目---用户信息 版本信息
//   await Global.init();
//   // 在运行app 下面的内容先不管
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // 屏幕适配工作 参考 https://www.jianshu.com/p/d45cf49f2245
//     return ScreenUtilInit(
//       designSize: Size(375, 812),
//       builder: () => RefreshConfiguration(
//         headerBuilder: () => ClassicHeader(),
//         footerBuilder: () => ClassicFooter(),
//         hideFooterWhenNotFull: true,
//         headerTriggerDistance: 80,
//         maxOverScrollExtent: 100,
//         footerTriggerDistance: 150,
//         child: GetMaterialApp(
//           title: 'News',
//           theme: AppTheme.light,
//           debugShowCheckedModeBanner: false,
//           initialRoute: AppPages.INITIAL,
//           getPages: AppPages.routes,
//           builder: EasyLoading.init(), // 初始化加载动画--loading动画
//           translations: TranslationService(),
//           navigatorObservers: [AppPages.observer],
//           localizationsDelegates: [
//             GlobalMaterialLocalizations.delegate,
//             GlobalWidgetsLocalizations.delegate,
//             GlobalCupertinoLocalizations.delegate,
//           ],
//           supportedLocales: ConfigStore.to.languages,
//           locale: ConfigStore.to.locale,
//           fallbackLocale: Locale('en', 'US'),
//           enableLog: true,
//           logWriterCallback: Logger.write,
//         ),
//       ),
//     );
//   }
// }

// 创建 SentryClient 用于将异常日志上报给 sentry 平台
// final SentryClient _sentry = new SentryClient(
//   dsn:
//       'https://8c0adcc4ba9341b9b555cfb455e7074d@o402094.ingest.sentry.io/5262754',
// );

// 上报异常的函数
// Future<void> _reportError(dynamic error, dynamic stackTrace) async {
//   print('Caught error: $error');
//   if (isInDebugMode) {
//     print(stackTrace);
//   } else {
//     final SentryResponse response = await _sentry.captureException(
//       exception: error,
//       stackTrace: stackTrace,
//     );

//     if (response.isSuccessful) {
//       print('Success! Event ID: ${response.eventId}');
//     } else {
//       print('Failed to report to Sentry.io: ${response.error}');
//     }
//   }
// }

// Future<Null> main() async {
//   // 捕获并上报 Flutter 异常
//   FlutterError.onError = (FlutterErrorDetails details) async {
//     if (isInDebugMode == true) {
//       FlutterError.dumpErrorToConsole(details);
//     } else {
//       Zone.current.handleUncaughtError(details.exception, details.stack);
//     }
//   };

//   // 捕获并上报 Dart 异常
//   runZonedGuarded(() async {
//     await Global.init();
//     runApp(
//       MultiProvider(
//         providers: [
//           ChangeNotifierProvider<AppState>.value(
//             value: Global.appState,
//           ),
//         ],
//         child: Consumer<AppState>(builder: (context, appState, _) {
//           if (appState.isGrayFilter) {
//             return ColorFiltered(
//               colorFilter: ColorFilter.mode(Colors.white, BlendMode.color),
//               child: NewsApp(),
//             );
//           } else {
//             return NewsApp();
//           }
//         }),
//       ),
//     );
//   }, (Object error, StackTrace stack) {
//     _reportError(error, stack);
//   });
// }

// class NewsApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'ducafecat.tech',
//       debugShowCheckedModeBanner: false,
//       builder: ExtendedNavigator<AppRouter>(
//         initialRoute: Routes.indexPageRoute,
//         router: AppRouter(),
//         guards: [AuthGuard()],
//       ),
//     );
//   }
// }
