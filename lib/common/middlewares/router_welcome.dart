/*
 * @Description: 你的代码我的心
 * @Author: GGB
 * @Date: 2021-10-30 09:03:17
 * @LastEditors: GGB
 * @LastEditTime: 2021-10-30 17:10:03
 */
import 'package:flutter/material.dart';
import 'package:flutter_ducafecat_news_getx/common/routes/routes.dart';
import 'package:flutter_ducafecat_news_getx/common/store/store.dart';

import 'package:get/get.dart';

/// 第一次欢迎页面
class RouteWelcomeMiddleware extends GetMiddleware {
  // priority 数字小优先级高
  @override
  int? priority = 0;

  RouteWelcomeMiddleware({required this.priority});

  @override
  RouteSettings? redirect(String? route) {
    if (ConfigStore.to.isFirstOpen == false) {
      return null;
    } else if (UserStore.to.isLogin == true) {
      return RouteSettings(name: AppRoutes.Application);
    } else {
      return RouteSettings(name: AppRoutes.SIGN_IN);
    }
  }
}
