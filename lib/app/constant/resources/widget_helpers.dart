import 'package:flutter/material.dart';
import 'package:higher_lower/app/constant/resources/app_colors.dart';
import 'package:higher_lower/app/constant/resources/app_dimens.dart';

class WidgetHelper {
  static BoxDecoration commonBoxDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: const BorderRadius.all(
      Radius.circular(
        AppDimens.MARGIN_CARD_MEDIUM,
      ),
    ),
    boxShadow: [
      BoxShadow(
        color: AppColors.primaryColor.withOpacity(0.1),
        blurRadius: 3,
        offset: const Offset(
          0.5,
          0.5,
        ),
      ),
    ],
  );
}
