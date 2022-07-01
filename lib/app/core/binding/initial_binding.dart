import 'package:higher_lower/app/core/base/view_controller_binding.dart';
import 'package:higher_lower/app/core/binding/cached_manager_binding.dart';
import 'package:higher_lower/app/core/binding/repository_binding.dart';
import 'package:get/get.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    CachedManagerBinding().dependencies();
    RepositoryBinding().dependencies();
    ViewControllerBinding().dependencies();
  }
}
