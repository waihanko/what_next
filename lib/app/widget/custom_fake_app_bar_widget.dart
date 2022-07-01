import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:higher_lower/app/constant/resources/app_colors.dart';
import 'package:higher_lower/app/constant/resources/app_dimens.dart';
import 'package:higher_lower/app/constant/resources/app_images.dart';
import 'package:higher_lower/app/constant/resources/widget_helpers.dart';
import 'package:higher_lower/app/constant/routing/app_pages.dart';
import 'package:higher_lower/app/constant/routing/app_route.dart';
import 'package:higher_lower/app/widget/rounded_icon_widget.dart';
import 'package:higher_lower/app/widget/text_view_widget.dart';

class CustomFakeAppBarWidget extends StatelessWidget {
  final bool isShowBackBtn;
  const CustomFakeAppBarWidget({
    this.isShowBackBtn = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,
      width: double.infinity,
      margin: const EdgeInsets.all(AppDimens.MARGIN_CARD_MEDIUM),
      decoration: WidgetHelper.commonBoxDecoration,
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimens.MARGIN_CARD_MEDIUM,
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child:  !isShowBackBtn? GestureDetector(
              onTap: ()=> Get.toNamed(Routes.profileScreen),
              child: Image.asset(
                AppImages.icProfile,
                width: 48,
                height: 48,
                fit: BoxFit.cover,
              ),
            ) : RoundedIconWidget(
              icon: const Icon(Icons.arrow_back_ios_rounded),
              backgroundColor: Colors.transparent,
              contentPadding: AppDimens.MARGIN_SMALL,
              onClickIcon: () => Get.back(),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      AppImages.icCoin,
                      width: 18,
                      height: 18,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(
                      width: AppDimens.MARGIN_SMALL,
                    ),
                    const TextViewWidget(
                      "1000",
                      textSize: AppDimens.TEXT_REGULAR,
                      textColor: AppColors.textColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
                const SizedBox(
                  height: AppDimens.MARGIN_SMALL,
                ),
                const TextViewWidget(
                  "USD 0.001",
                  textSize: AppDimens.TEXT_REGULAR,
                  textColor: AppColors.textColor,
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}