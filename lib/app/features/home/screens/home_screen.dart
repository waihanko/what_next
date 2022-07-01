import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:higher_lower/app/constant/resources/app_colors.dart';
import 'package:higher_lower/app/constant/resources/app_dimens.dart';
import 'package:higher_lower/app/constant/resources/app_images.dart';
import 'package:higher_lower/app/constant/resources/widget_helpers.dart';
import 'package:higher_lower/app/constant/routing/app_route.dart';
import 'package:higher_lower/app/core/base/base_view.dart';
import 'package:higher_lower/app/core/utils/sliver_app_delegete.dart';
import 'package:higher_lower/app/features/home/controller/home_controller.dart';
import 'package:higher_lower/app/features/sample_feature/controller/game_play_controller.dart';
import 'package:higher_lower/app/widget/custom_fake_app_bar_widget.dart';
import 'package:higher_lower/app/widget/custom_scroll_behavior_widget.dart';
import 'package:higher_lower/app/widget/gradient_button_widget.dart';
import 'package:higher_lower/app/widget/text_view_widget.dart';

class HomeScreen extends BaseView<HomeController> {
  HomeScreen({Key? key}) : super(key: key);

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget? bottomNavigationBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: AppDimens.MARGIN_SMALL,
          horizontal: AppDimens.MARGIN_MEDIUM),
      child: GradientButtonWidget(
          height: 52,
          radiusFactor: 0.3,
          child: const TextViewWidget(
            "Play now",
            textSize: AppDimens.TEXT_HEADING_1X,
            textColor: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          onPressed: () async => {
                Get.toNamed(Routes.gamePlayScreen)!.then((value) => Get.delete<GamePlayController>()),
                //controller.setInitialNumber()
              }),
    );
  }

  @override
  Widget body(BuildContext context) {
    return SafeArea(
      child: NestedScrollView(
        headerSliverBuilder: (context, value) {
          return [
            SliverPersistentHeader(
              delegate: SliverTabBarDelegate(
                const CustomFakeAppBarWidget(),
                height: 100,
              ),
              pinned: true,
            )
          ];
        },
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TitleSectionView(),
              const SizedBox(
                height: AppDimens.MARGIN_CARD_MEDIUM_2,
              ),
              Container(
                decoration: WidgetHelper.commonBoxDecoration,
                margin: const EdgeInsets.symmetric(
                    horizontal: AppDimens.MARGIN_CARD_MEDIUM),
                width: double.infinity,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      AppImages.icTrophy,
                      width: 120,
                      height: 100,
                    ),
                    const SizedBox(
                      width: AppDimens.MARGIN_MEDIUM,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        TextViewWidget(
                          "Leader Board",
                          textSize: AppDimens.TEXT_REGULAR_3X,
                          fontWeight: FontWeight.w600,
                        ),
                        SizedBox(
                          height: AppDimens.MARGIN_MEDIUM,
                        ),
                        Text.rich(
                          TextSpan(
                            children: <InlineSpan>[
                              TextSpan(
                                text: 'Position:',
                                style: TextStyle(
                                  color: AppColors.titleTextColor,
                                  fontSize: AppDimens.TEXT_REGULAR,
                                ),
                              ),
                              WidgetSpan(
                                  child: SizedBox(
                                width: AppDimens.MARGIN_MEDIUM,
                              )),
                              TextSpan(
                                text: '1000',
                                style: TextStyle(
                                  color: AppColors.titleTextColor,
                                  fontSize: AppDimens.TEXT_REGULAR,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: AppDimens.MARGIN_SMALL),
                        Text.rich(
                          TextSpan(
                            children: <InlineSpan>[
                              TextSpan(
                                text: 'Win:',
                                style: TextStyle(
                                  color: AppColors.titleTextColor,
                                  fontSize: AppDimens.TEXT_REGULAR,
                                ),
                              ),
                              WidgetSpan(
                                  child: SizedBox(
                                width: AppDimens.MARGIN_MEDIUM,
                              )),
                              TextSpan(
                                text: 'USD 100',
                                style: TextStyle(
                                  color: AppColors.titleTextColor,
                                  fontSize: AppDimens.TEXT_REGULAR,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        )
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: AppDimens.MARGIN_CARD_MEDIUM_2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  HomeMenuWidget(
                    title: "Invite friends",
                    amountTitle: "win up to",
                    iconPath: AppImages.icGifBox,
                    amount: "10000",
                    onPress: () => print("Press Invite Friend"),
                  ),
                  HomeMenuWidget(
                    title: "Our offers",
                    amountTitle: "win up to",
                    iconPath: AppImages.icCoin,
                    amount: "10000000",
                    onPress: () => print("Press Offer"),
                  ),
                ],
              ),
              const SizedBox(
                height: AppDimens.MARGIN_CARD_MEDIUM_2,
              ),
              Container(
                constraints: const BoxConstraints(minHeight: 100),
                decoration: WidgetHelper.commonBoxDecoration,
                margin: const EdgeInsets.symmetric(
                    horizontal: AppDimens.MARGIN_CARD_MEDIUM),
                width: double.infinity,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      AppImages.icWallet,
                      width: 84,
                      height: 52,
                    ),
                    const SizedBox(
                      width: AppDimens.MARGIN_MEDIUM,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        TextViewWidget(
                          "Withdraw",
                          textSize: AppDimens.TEXT_REGULAR_3X,
                          fontWeight: FontWeight.w600,
                        ),
                        SizedBox(
                          height: AppDimens.MARGIN_MEDIUM,
                        ),
                        Text.rich(
                          TextSpan(
                            children: <InlineSpan>[
                              TextSpan(
                                text: 'Minimum withdraw:',
                                style: TextStyle(
                                  color: AppColors.titleTextColor,
                                  fontSize: AppDimens.TEXT_REGULAR,
                                ),
                              ),
                              WidgetSpan(
                                  child: SizedBox(
                                width: AppDimens.MARGIN_MEDIUM,
                              )),
                              TextSpan(
                                text: 'USD 1.09',
                                style: TextStyle(
                                  color: AppColors.titleTextColor,
                                  fontSize: AppDimens.TEXT_REGULAR,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: AppDimens.MARGIN_LARGE,
              ),
              Container(
                padding: EdgeInsets.all(AppDimens.MARGIN_MEDIUM),
                decoration: BoxDecoration(color: Colors.white.withOpacity(0.5)),
                margin: const EdgeInsets.symmetric(
                    horizontal: AppDimens.MARGIN_CARD_MEDIUM),
                width: double.infinity,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      AppImages.icAnnounce,
                      height: 24,
                    ),
                    const SizedBox(
                      width: AppDimens.MARGIN_MEDIUM,
                    ),
                    TextViewWidget(
                      "Withdraw" * 4,
                      textSize: AppDimens.TEXT_REGULAR,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeMenuWidget extends StatelessWidget {
  final String title;
  final String? amount;
  final String amountTitle;
  final String iconPath;
  final Function? onPress;

  const HomeMenuWidget({
    required this.title,
    required this.amountTitle,
    required this.iconPath,
    this.amount,
    this.onPress,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: WidgetHelper.commonBoxDecoration,
      width: MediaQuery.of(context).size.width * 0.5 - 18,
      height: MediaQuery.of(context).size.width * 0.45 - 18,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextViewWidget(
            title,
            fontWeight: FontWeight.w600,
            textSize: AppDimens.TEXT_REGULAR_2X,
          ),
          const SizedBox(
            height: AppDimens.MARGIN_SMALL,
          ),
          Image.asset(
            iconPath,
            width: 48,
            height: 48,
          ),
          const SizedBox(
            height: AppDimens.MARGIN_MEDIUM,
          ),
          TextViewWidget(
            amountTitle,
            textSize: AppDimens.TEXT_REGULAR,
          ),
          const SizedBox(
            height: AppDimens.MARGIN_SMALL,
          ),
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
              TextViewWidget(
                amount ?? "",
                textSize: AppDimens.TEXT_REGULAR_2X,
                textColor: AppColors.titleTextColor,
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class TitleSectionView extends StatelessWidget {
  const TitleSectionView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: AppDimens.MARGIN_CARD_MEDIUM_2),
      child: Text.rich(
        TextSpan(
          children: <InlineSpan>[
            TextSpan(
              text: 'It is',
              style: TextStyle(color: AppColors.titleTextColor),
            ),
            WidgetSpan(
                child: SizedBox(
              width: AppDimens.MARGIN_MEDIUM,
            )),
            TextSpan(
              text: 'Higher',
              style: TextStyle(
                color: AppColors.titleTextColor,
                fontSize: AppDimens.TEXT_HEADING_1X,
                fontWeight: FontWeight.bold,
              ),
            ),
            WidgetSpan(
                child: SizedBox(
              width: AppDimens.MARGIN_MEDIUM,
            )),
            TextSpan(
              text: 'or',
              style: TextStyle(color: AppColors.titleTextColor),
            ),
            WidgetSpan(
                child: SizedBox(
              width: AppDimens.MARGIN_MEDIUM,
            )),
            TextSpan(
              text: 'Lower?',
              style: TextStyle(
                color: AppColors.titleTextColor,
                fontSize: AppDimens.TEXT_HEADING_1X,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
