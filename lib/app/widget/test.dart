import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:higher_lower/app/constant/resources/app_colors.dart';
import 'package:higher_lower/app/constant/resources/app_dimens.dart';
import 'package:higher_lower/app/features/sample_feature/controller/game_play_controller.dart';
import 'package:higher_lower/app/widget/gradient_button_widget.dart';
import 'package:higher_lower/app/widget/text_view_widget.dart';
import 'package:lottie/lottie.dart';

class CustomDialogBox extends StatefulWidget {
  final GamePlayController controller;

  const CustomDialogBox(
    this.controller, {
    Key? key,
  }) : super(key: key);

  @override
  _CustomDialogBoxState createState() => _CustomDialogBoxState();
}

class _CustomDialogBoxState extends State<CustomDialogBox> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned.fill(
          child: Lottie.asset(
            "assets/images/conf.json",
            repeat: true,
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: <Widget>[
                Positioned(
                  top: -32,
                  left: 0,
                  right: 0,
                  child: Lottie.asset("assets/images/trophy.json",
                      repeat: false, width: 180, height: 180),
                ),
                Column(
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(top: 140),
                      child: TextViewWidget(
                        "Congratulations",
                        textSize: AppDimens.TEXT_HEADING_1X,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: AppDimens.MARGIN_LARGE,
                    ),
                    TextViewWidget(
                      "You got 1 point",
                      textSize: AppDimens.TEXT_REGULAR,
                      fontWeight: FontWeight.w600,
                      textColor: AppColors.textColor,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: AppDimens.MARGIN_LARGE,
            ),
            GradientButtonWidget(
                height: 48,
                radiusFactor: 0.3,
                child: const TextViewWidget(
                  "Play again",
                  textSize: AppDimens.TEXT_REGULAR_3X,
                  textColor: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                onPressed: () => {
                      widget.controller.setInitialNumber(),
                      Get.back()
                    }),
            const SizedBox(
              height: AppDimens.MARGIN_CARD_MEDIUM_2,
            )
          ],
        ),
      ],
    );
  }
}
