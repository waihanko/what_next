import 'package:flutter/material.dart';
import 'package:higher_lower/app/core/base/base_controller.dart';
import 'package:higher_lower/app/core/utils/app_utils.dart';
import 'package:get/get.dart';
import 'dart:math' as math;

class GamePlayController extends BaseController {

  RxList<int?> guessedNumberList = List<int?>.filled(10, null).obs;
  Rx<int> currentGuessedIndex = 0.obs;
  Rx<bool> isPlayerHasChance = true.obs;
  Rx<bool> isVisible = true.obs;
  Rx<String> gameStateAnim = 'assets/images/correct.json'.obs;
  late final AnimationController animController;

  @override
  void onInit() {
    super.onInit();
    animController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    setInitialNumber();
  }

  @override
  dispose() {
    animController.dispose(); // you need this
    super.dispose();
  }

  void guessNumber(bool isLower) async {
    if (currentGuessedIndex.value == 9) return;
    currentGuessedIndex.value += 1;
    guessedNumberList[currentGuessedIndex.value] =
        math.Random().nextInt(79) + 1;

    if (guessedNumberList[currentGuessedIndex.value - 1]! ==
            guessedNumberList[currentGuessedIndex.value]! ||
        isLower &&
            (guessedNumberList[currentGuessedIndex.value - 1]! >
                guessedNumberList[currentGuessedIndex.value]!) ||
        !isLower &&
            (guessedNumberList[currentGuessedIndex.value - 1]! <
                guessedNumberList[currentGuessedIndex.value]!)) {
      isPlayerHasChance.value = true;
      gameStateAnim.value = 'assets/images/correct.json';

      if (currentGuessedIndex.value == 9) {
        Future.delayed(
            const Duration(seconds: 1), () => AppUtils.showSuccessDialog(this));
      }
    } else {
      isPlayerHasChance.value = false;
      gameStateAnim.value = 'assets/images/wrong.json';

      Future.delayed(
          const Duration(seconds: 2),
          () => {
                guessedNumberList[currentGuessedIndex.value] = null,
                currentGuessedIndex.value -= 1,
              });
    }
    isVisible.value = true;
    animController.forward();
    await Future.delayed(
      const Duration(seconds: 2),
      () => animController.reverse(),
    );
  }

  void clickWatchVideo() async {
    await Future.delayed(const Duration(milliseconds: 1000),
        () => isPlayerHasChance.value = true);
  }

  void setInitialNumber() {
    isPlayerHasChance.value = true;
    currentGuessedIndex.value = 0;
    guessedNumberList = List<int?>.filled(10, null).obs;
    guessedNumberList[0] = math.Random().nextInt(79) + 1;
    guessedNumberList.refresh();
  }
}
