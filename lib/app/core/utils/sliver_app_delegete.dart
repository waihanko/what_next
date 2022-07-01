import 'package:flutter/material.dart';
import 'package:higher_lower/app/constant/resources/app_colors.dart';

class SliverTabBarDelegate extends SliverPersistentHeaderDelegate {
  double height;

  SliverTabBarDelegate(
    this.tabBar, {
    this.height = 100,
  });

  final Widget? tabBar;

  @override
  double get minExtent => height;

  @override
  double get maxExtent => height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        decoration: const BoxDecoration(
          color: AppColors.pageBackgroundColor,
        ),
        child: tabBar,
      ),
    );
  }

  @override
  bool shouldRebuild(SliverTabBarDelegate oldDelegate) {
    return true;
  }
}
