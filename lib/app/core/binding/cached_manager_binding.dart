import 'package:higher_lower/app/data/local/cache_manager.dart';
import 'package:get/get.dart';

class CachedManagerBinding implements Bindings {
  @override
  void dependencies() {

    Get.lazyPut<CacheManager>(
      () => CacheManager(),
      tag: (CacheManager).toString(),
    );

  }
}
