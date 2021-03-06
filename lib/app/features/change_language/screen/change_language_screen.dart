import 'package:flutter/services.dart';
import 'package:higher_lower/app/constant/resources/app_colors.dart';
import 'package:higher_lower/app/constant/resources/app_dimens.dart';
import 'package:higher_lower/app/constant/translation/app_translation.dart';
import 'package:higher_lower/app/core/base/base_view.dart';
import 'package:higher_lower/app/features/change_language/controller/change_language_controller.dart';
import 'package:higher_lower/app/widget/default_app_bar_widget.dart';
import 'package:higher_lower/app/widget/gradient_button_widget.dart';
import 'package:higher_lower/app/widget/text_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/preferred_size.dart';
import 'package:get/get.dart';

class ChangeLanguageScreen extends BaseView<ChangeLanguageController> {
  ChangeLanguageScreen({Key? key}) : super(key: key);

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget body(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: controller.languageList.length,
        itemBuilder: (_, index) => changeLanguageWidget(index),
      ),
    );
  }

  @override
  Widget? bottomNavigationBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: AppDimens.MARGIN_SMALL,
          horizontal: AppDimens.MARGIN_MEDIUM),
      child: GradientButtonWidget(
          child: const TextViewWidget(
            "Save",
            textSize: AppDimens.TEXT_REGULAR_3X,
            textColor: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          onPressed: () {
            controller.changeLanguage(
              AppTranslation
                      .locales[controller.changeLanguageGroupLanguage.value]
                  ['locale'],
            );
          }),
    );
  }

  Widget changeLanguageWidget(int radioValue) {
    return Obx(
      () => Container(
        padding: const EdgeInsets.all(AppDimens.MARGIN_MEDIUM_2),
        margin: const EdgeInsets.only(bottom: AppDimens.MARGIN_MEDIUM),
        decoration: const BoxDecoration(
          borderRadius:
              BorderRadius.all(Radius.circular(AppDimens.MARGIN_MEDIUM)),
          color: AppColors.whiteColor,
        ),
        child: Center(
          child: ListTile(
            title:
                TextViewWidget(controller.languageList[radioValue].name ?? ""),
            leading: Radio(
              value: radioValue,
              groupValue: controller.changeLanguageGroupLanguage.value,
              onChanged: (value) {
                controller.changeLanguageGroupLanguage.value = radioValue;
              },
              activeColor: AppColors.primaryColor,
            ),
            trailing:
                Image.asset(controller.languageList[radioValue].image ?? ""),
          ),
        ),
      ),
    );
  }
}
