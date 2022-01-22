import 'package:get_it/get_it.dart';

import 'modules/module.dart';

final GetIt injector = GetIt.instance;

abstract class DIModule {
  void provides();
}

class Injection {
  static Future<void> inject() async {
    await PageModule().provides();
  }
}
