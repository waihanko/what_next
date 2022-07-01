import 'package:get/get.dart';
import 'package:higher_lower/app/features/sample_feature/controller/game_play_controller.dart';

class GamePlayBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GamePlayController());
  }
}
