/*
 * @Description: 你的代码我的心
 * @Author: GGB
 * @Date: 2021-10-30 09:03:17
 * @LastEditors: GGB
 * @LastEditTime: 2021-10-30 17:18:40
 */
import 'package:flutter/material.dart';
import 'package:flutter_ducafecat_news_getx/common/routes/routes.dart';
import 'package:flutter_ducafecat_news_getx/common/store/store.dart';

import 'package:get/get.dart';

/// 检查是否登录
class RouteAuthMiddleware extends GetMiddleware {
  // priority 数字小优先级高
  @override
  int? priority = 0;

  RouteAuthMiddleware({required this.priority});

  @override
  RouteSettings? redirect(String? route) {
    if (ConfigStore.to.isFirstOpen == true) {
      return null;
    } else if (UserStore.to.isLogin ||
        route == AppRoutes.SIGN_IN ||
        route == AppRoutes.SIGN_UP ||
        route == AppRoutes.INITIAL) {
      return null;
    } else {
      Future.delayed(
          Duration(seconds: 1), () => Get.snackbar("提示", "登录过期,请重新登录"));
      return RouteSettings(name: AppRoutes.SIGN_IN);
    }
  }
}
