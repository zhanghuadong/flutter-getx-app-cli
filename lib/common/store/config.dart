/*
 * @Description: 你的代码我的心
 * @Author: GGB
 * @Date: 2021-10-30 09:03:17
 * @LastEditors: GGB
 * @LastEditTime: 2021-10-30 17:23:07
 */
import 'package:flutter/material.dart';
import 'package:flutter_ducafecat_news_getx/common/services/services.dart';
import 'package:flutter_ducafecat_news_getx/common/values/values.dart';
import 'package:get/get.dart';
import 'package:package_info/package_info.dart';

class ConfigStore extends GetxController {
  static ConfigStore get to => Get.find();
  bool isFirstOpen = false;
  PackageInfo? _platform;
  String get version => _platform?.version ?? "-";
  bool get isRelease => bool.fromEnvironment("dart.vm.product");
  Locale locale = Locale('en', 'US');
  List<Locale> languages = [Locale('en', 'US'), Locale('zh', 'CN')];

  @override
  void onInit() {
    super.onInit();
    isFirstOpen = StorageService.to.getBool(STORAGE_DEVICE_FIRST_OPEN_KEY);
    // TODO 初始化语言 后期加入的
    onInitLocale();
  }

  Future<void> getPlatForm() async {
    _platform = await PackageInfo.fromPlatform();
  }

  Future<bool> saveAlreadyOpen() {
    return StorageService.to.setBool(STORAGE_DEVICE_FIRST_OPEN_KEY, false);
  }

  void onInitLocale() {
    var langCode = StorageService.to.getString(STORAGE_LANGUAGE_CODE);
    if (langCode.isEmpty) return;
    var index =
        languages.indexWhere((element) => element.languageCode == langCode);
    if (index < 0) return;
    locale = languages[index];
  }

  void onLocaleUpdate(Locale value) {
    locale = value;
    Get.updateLocale(value);
    StorageService.to.setString(STORAGE_LANGUAGE_CODE, locale.languageCode);
  }
}


// class ConfigStore extends GetxController {
//   static ConfigStore get to => Get.find();

//   bool isFirstOpen = false;
//   PackageInfo? _platform;
//   String get version => _platform?.version ?? '-';
//   bool get isRelease => bool.fromEnvironment("dart.vm.product");
//   Locale locale = Locale('en', 'US');
//   List<Locale> languages = [
//     Locale('en', 'US'),
//     Locale('zh', 'CN'),
//   ];

//   @override
//   void onInit() {
//     super.onInit();
//     isFirstOpen = StorageService.to.getBool(STORAGE_DEVICE_FIRST_OPEN_KEY);
//   }

//   Future<void> getPlatform() async {
//     _platform = await PackageInfo.fromPlatform();
//   }

//   // 标记用户已打开APP 设置本地缓存
//   Future<bool> saveAlreadyOpen() {
//     return StorageService.to.setBool(STORAGE_DEVICE_FIRST_OPEN_KEY, false);
//   }

//   // 初始化语言系统
//   void onInitLocale() {
//     var langCode = StorageService.to.getString(STORAGE_LANGUAGE_CODE);
//     if (langCode.isEmpty) return;
//     var index = languages.indexWhere((element) {
//       return element.languageCode == langCode;
//     });
//     if (index < 0) return;
//     locale = languages[index];
//   }

//   void onLocaleUpdate(Locale value) {
//     locale = value;
//     Get.updateLocale(value);
//     StorageService.to.setString(STORAGE_LANGUAGE_CODE, value.languageCode);
//   }
// }
