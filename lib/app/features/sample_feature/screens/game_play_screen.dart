import 'dart:math';

import 'package:countup/countup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/preferred_size.dart';
import 'package:get/get.dart';
import 'package:higher_lower/app/constant/resources/app_colors.dart';
import 'package:higher_lower/app/constant/resources/app_dimens.dart';
import 'package:higher_lower/app/constant/resources/app_images.dart';
import 'package:higher_lower/app/constant/resources/widget_helpers.dart';
import 'package:higher_lower/app/core/base/base_view.dart';
import 'package:higher_lower/app/core/utils/sliver_app_delegete.dart';
import 'package:higher_lower/app/features/sample_feature/controller/game_play_controller.dart';
import 'package:higher_lower/app/widget/rounded_icon_widget.dart';
import 'package:higher_lower/app/widget/custom_scroll_behavior_widget.dart';
import 'package:higher_lower/app/widget/gradient_button_widget.dart';
import 'package:higher_lower/app/widget/primary_button_widget.dart';
import 'package:higher_lower/app/widget/text_view_widget.dart';
import 'package:lottie/lottie.dart';

class GamePlayScreen extends BaseView<GamePlayController> {
  GamePlayScreen({Key? key}) : super(key: key);

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget body(BuildContext context) {
    return SafeArea(
      child: NestedScrollView(
        headerSliverBuilder: (context, value) {
          return [
            SliverPersistentHeader(
              delegate: SliverTabBarDelegate(
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 24),
                      child: RoundedIconWidget(
                        icon: const Icon(Icons.arrow_back_ios_rounded),
                        onClickIcon: () => Get.back(),
                      ),
                    ),
                    Expanded(
                      child: Stack(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(
                              AppDimens.MARGIN_CARD_MEDIUM,
                            ),
                            margin: const EdgeInsets.only(
                              left: AppDimens.MARGIN_MEDIUM,
                              right: AppDimens.MARGIN_MEDIUM,
                              top: AppDimens.MARGIN_MEDIUM + 24,
                              bottom: 0,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(AppDimens.MARGIN_MEDIUM_2),
                              ),
                              border: Border.all(
                                color: AppColors.primaryColor,
                                width: 0.5,
                              ),
                            ),
                            child: const TextViewWidget(
                              "Each win give you +1 point for the leader board",
                              textSize: AppDimens.TEXT_REGULAR,
                              maxLine: 2,
                              textOverflow: TextOverflow.ellipsis,
                              textColor: AppColors.textColor,
                              textAlign: TextAlign.center,
                              lineHeight: 1.5,
                            ),
                          ),
                          Positioned(
                            top: AppDimens.MARGIN_MEDIUM,
                            left: 0,
                            right: 0,
                            child: Image.asset(
                              AppImages.icCrown,
                              width: 32,
                              height: 32,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: AppDimens.MARGIN_MEDIUM,
                    ),
                  ],
                ),
              ),
              pinned: true,
            )
          ];
        },
        body: ScrollConfiguration(
          behavior: CustomScrollBehavior(),
          child: Obx(
                () =>
                Stack(
                  children: [
                    Positioned(
                      top: Get.width * 0.5,
                      left: 0,
                      right: 0,
                      child: Column(
                        children: [
                          Container(
                            width: Get.width * 0.4,
                            height: Get.width * 0.4,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.primaryColor,
                                  blurRadius: 10,
                                  offset: Offset(
                                    1,
                                    1,
                                  ),
                                ),
                              ],
                              gradient: LinearGradient(
                                end: Alignment(0.0, 0.6),
                                begin: Alignment(0.0, -1),
                                colors: [
                                  Color(0xfff7de55),
                                  Color(0xfffdc65f),
                                  Color(0xffe99436),
                                ],
                              ),
                            ),
                            child: Container(
                              width: Get.width * 0.4,
                              height: Get.width * 0.4,
                              margin: const EdgeInsets.all(
                                  AppDimens.MARGIN_SMALL),
                              decoration: const BoxDecoration(
                                color: AppColors.whiteColor,
                                shape: BoxShape.circle,
                              ),
                              child: Stack(
                                children: [
                                  Center(
                                    child: Countup(
                                      begin: controller
                                          .currentGuessedIndex.value <
                                          1
                                          ? controller
                                          .guessedNumberList[0]!
                                          .toDouble()
                                          : controller
                                          .guessedNumberList[(controller
                                          .currentGuessedIndex.value -
                                          1)]!
                                          .toDouble(),
                                      end: controller.guessedNumberList[
                                      controller.currentGuessedIndex.value]!
                                          .toDouble(),
                                      duration: const Duration(
                                          milliseconds: 500),
                                      style: const TextStyle(
                                          fontSize: AppDimens
                                              .TEXT_GUESSED_NUMBER,
                                          color: AppColors.gussNumberColor,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Opacity(
                                    opacity: 0.8,
                                    child: Center(
                                      child: Lottie.asset(
                                        controller.gameStateAnim.value,
                                        fit: BoxFit.fill,
                                        controller: controller.animController,
                                        repeat: false,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: AppDimens.MARGIN_CARD_MEDIUM_2,
                          ),
                          const TextViewWidget(
                            "Higher or Lower?",
                            textSize: AppDimens.TEXT_REGULAR_3X,
                            fontWeight: FontWeight.w500,
                            textColor: AppColors.textColor,
                          ),
                          controller.isPlayerHasChance.value
                              ? Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: Get.width * 0.06,
                              horizontal: Get.width * 0.1,
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                GamePlayButton(
                                    actionName: "Lower",
                                    iconPath: AppImages.icArrowDown,
                                    onPressed: () =>
                                        controller.guessNumber(true)),
                                const SizedBox(
                                  width: AppDimens.MARGIN_CARD_MEDIUM,
                                ),
                                GamePlayButton(
                                    actionName: "Higher",
                                    iconPath: AppImages.icArrowUp,
                                    onPressed: () =>
                                        controller.guessNumber(false)),
                              ],
                            ),
                          )
                              : Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: Get.width * 0.06,
                              horizontal: Get.width * 0.1,
                            ),
                            child: Column(
                              children: [
                                GradientButtonWidget(
                                  onPressed: () =>
                                      controller.clickWatchVideo(),
                                  width: Get.width * 0.5,
                                  height: Get.height * 0.08,
                                  child: const TextViewWidget(
                                    "Watch Video",
                                    textSize: AppDimens.TEXT_REGULAR_3X,
                                    fontWeight: FontWeight.bold,
                                    textColor: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: AppDimens.MARGIN_MEDIUM,),
                                PrimaryButtonWidget(
                                  onPress: () => Get.back(),
                                  bgColor: AppColors.pageBackgroundColor,
                                  child: const TextViewWidget(
                                    "Quit game",
                                    fontWeight: FontWeight.w600,
                                    textColor: AppColors.textColor,
                                    textSize: AppDimens.TEXT_REGULAR_2X,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    GridView.builder(
                        physics: const ScrollPhysics(),
                        shrinkWrap: true,
                        padding: const EdgeInsets.all(
                            AppDimens.MARGIN_CARD_MEDIUM),
                        gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 5,
                          childAspectRatio: 1,
                        ),
                        itemCount: controller.guessedNumberList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            margin: const EdgeInsets.all(
                                AppDimens.MARGIN_MEDIUM),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(
                                  AppDimens.MARGIN_MEDIUM_2,
                                ),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.primaryColor.withOpacity(
                                      0.5),
                                  blurRadius: 3,
                                  offset: const Offset(
                                    0.5,
                                    0.5,
                                  ),
                                ),
                              ],
                            ),
                            child: Center(
                              child: controller.guessedNumberList[index] == null
                                  ? Image.asset(
                                AppImages.icQuestion,
                                width: 38,
                                height: 38,
                              )
                                  : TextViewWidget(
                                controller.guessedNumberList[index]
                                    .toString(),
                                textColor: AppColors.gussNumberColor,
                                fontWeight: FontWeight.bold,
                                textSize: AppDimens.TEXT_HEADING_2X,
                              ),
                            ),
                          );
                        }),
                    const SizedBox(
                      height: AppDimens.MARGIN_CARD_MEDIUM,
                    ),
                  ],
                ),
          ),
        ),
      ),
    );
  }
}

class GamePlayButton extends StatelessWidget {
  final Function onPressed;
  final String actionName;
  final String iconPath;

  const GamePlayButton({
    required this.actionName,
    required this.iconPath,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () => onPressed(),
          child: Container(
            width: Get.width * 0.25,
            height: Get.width * 0.25,
            decoration: WidgetHelper.commonBoxDecoration,
            padding: const EdgeInsets.all(AppDimens.MARGIN_CARD_MEDIUM_2),
            child: Image.asset(
              iconPath,
            ),
          ),
        ),
        const SizedBox(
          height: AppDimens.MARGIN_CARD_MEDIUM,
        ),
        TextViewWidget(
          actionName,
          textSize: AppDimens.TEXT_REGULAR_3X,
          fontWeight: FontWeight.w600,
          textColor: AppColors.textColor,
        )
      ],
    );
  }
}
