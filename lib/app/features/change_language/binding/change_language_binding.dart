import 'package:higher_lower/app/features/change_language/controller/change_language_controller.dart';
import 'package:get/get.dart';

class ChangeLanguageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChangeLanguageController());
  }
}
