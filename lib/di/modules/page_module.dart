
import 'package:flutter/material.dart';
import 'package:todo_app/common/constants/constants.dart';
import 'package:todo_app/pages/pages.dart';
import 'package:todo_app/pages/task_page/complete_task_page.dart';

import '../injection.dart';

class PageModule extends DIModule {
  @override
  Future<void> provides() async {
    injector.registerFactory<Widget>(() => LaunchPage(),
        instanceName: RouteConstants.launch);
    injector.registerFactory<Widget>(() => HomePage(),
        instanceName: RouteConstants.home);
    injector.registerFactory<Widget>(() => FavoritesPage(),
        instanceName: RouteConstants.compeleteTask);
  }

}
