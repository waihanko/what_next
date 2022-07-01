import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/preferred_size.dart';
import 'package:get/get.dart';
import 'package:higher_lower/app/constant/resources/app_colors.dart';
import 'package:higher_lower/app/constant/resources/app_dimens.dart';
import 'package:higher_lower/app/constant/resources/app_images.dart';
import 'package:higher_lower/app/constant/routing/app_route.dart';
import 'package:higher_lower/app/core/base/base_view.dart';
import 'package:higher_lower/app/core/utils/sliver_app_delegete.dart';
import 'package:higher_lower/app/features/profile/controller/profile_controller.dart';
import 'package:higher_lower/app/widget/custom_fake_app_bar_widget.dart';
import 'package:higher_lower/app/widget/custom_scroll_behavior_widget.dart';
import 'package:higher_lower/app/widget/primary_button_widget.dart';
import 'package:higher_lower/app/widget/rounded_icon_widget.dart';
import 'package:higher_lower/app/widget/text_view_widget.dart';

class ProfileScreen extends BaseView<ProfileController> {
  ProfileScreen({Key? key}) : super(key: key);

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
                  const CustomFakeAppBarWidget(isShowBackBtn: true)),
              pinned: true,
            )
          ];
        },
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: AppDimens.MARGIN_MEDIUM,
              ),
              GestureDetector(
                onTap: () => {},
                child: Image.asset(
                  AppImages.icProfile,
                  width: 76,
                  height: 76,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: AppDimens.MARGIN_MEDIUM,
              ),
              const TextViewWidget(
                "Min Aung Hlaing",
                textSize: AppDimens.TEXT_REGULAR,
                textColor: AppColors.titleTextColor,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(
                height: AppDimens.MARGIN_XLARGE,
              ),
              PrimaryButtonWidget(
                  onPress: () => {},
                  child:  TextViewWidget(
                    "settings".tr,
                    textSize: AppDimens.TEXT_REGULAR_2X,
                    textColor: AppColors.titleTextColor,
                    fontWeight: FontWeight.w400,
                  ),
                  width: Get.width * 0.7,
                  height: 48,
                  radiusFactor: 0.3),
              const SizedBox(
                height: AppDimens.MARGIN_MEDIUM_2,
              ),
              PrimaryButtonWidget(
                  onPress: () => {},
                  child: TextViewWidget(
                    "terms&condition".tr,
                    textSize: AppDimens.TEXT_REGULAR_2X,
                    textColor: AppColors.titleTextColor,
                    fontWeight: FontWeight.w400,
                  ),
                  width: Get.width * 0.7,
                  height: 48,
                  radiusFactor: 0.3),
              const SizedBox(
                height: AppDimens.MARGIN_MEDIUM_2,
              ),
              PrimaryButtonWidget(
                  onPress: () => {},
                  child: TextViewWidget(
                    "privacy_policy".tr,
                    textSize: AppDimens.TEXT_REGULAR_2X,
                    textColor: AppColors.titleTextColor,
                    fontWeight: FontWeight.w400,
                  ),
                  width: Get.width * 0.7,
                  height: 48,
                  radiusFactor: 0.3),
              const SizedBox(
                height: AppDimens.MARGIN_MEDIUM_2,
              ),
              PrimaryButtonWidget(
                  onPress: () => {},
                  child: TextViewWidget(
                    "contact_us".tr,
                    textSize: AppDimens.TEXT_REGULAR_2X,
                    textColor: AppColors.titleTextColor,
                    fontWeight: FontWeight.w400,
                  ),
                  width: Get.width * 0.7,
                  height: 48,
                  radiusFactor: 0.3),
              const SizedBox(
                height: AppDimens.MARGIN_MEDIUM_2,
              ),
              PrimaryButtonWidget(
                  onPress: () => Get.toNamed(Routes.changeLanguageScreen),
                  child: TextViewWidget(
                    "language".tr,
                    textSize: AppDimens.TEXT_REGULAR_2X,
                    textColor: AppColors.titleTextColor,
                    fontWeight: FontWeight.w400,
                  ),
                  width: Get.width * 0.7,
                  height: 48,
                  radiusFactor: 0.3),
            ],
          ),
        ),
      ),
    );
  }
}
