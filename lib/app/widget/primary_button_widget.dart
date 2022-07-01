import 'package:higher_lower/app/constant/resources/app_colors.dart';
import 'package:flutter/material.dart';

class PrimaryButtonWidget extends StatefulWidget {
  final Function? onPress;
  final Color bgColor;
  final Widget? child;
  final double? height;
  final double? width;
  final double radiusFactor;

  const PrimaryButtonWidget({
    required this.onPress,
    this.bgColor = AppColors.whiteColor,
    this.child,
    this.height = 40,
    this.radiusFactor =  0.5,
    this.width,
    Key? key,
  }) : super(key: key);

  @override
  _PrimaryButtonWidgetState createState() => _PrimaryButtonWidgetState();
}

class _PrimaryButtonWidgetState extends State<PrimaryButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: widget.width,
      height: widget.height,
      onPressed: ()=> widget.onPress == null ? null : widget.onPress!(),
      child: widget.child ?? const SizedBox(),
      color: widget.bgColor,
      highlightElevation: 4,
      highlightColor: AppColors.pureBlackColor.withOpacity(0.1),
      splashColor: AppColors.pureBlackColor.withOpacity(0.1),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(widget.height! * widget.radiusFactor),
        side: const BorderSide(
          width: 0,
          color: AppColors.lightBlueColor2,
        ),
      ),
    );
  }
}
