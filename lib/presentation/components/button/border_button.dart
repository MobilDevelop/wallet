
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart' as f_bounce;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:wallet_app/presentation/assets/res/screen_size.dart';
import 'package:wallet_app/presentation/assets/theme/app_theme.dart';

class BorderButton extends StatelessWidget {
  const BorderButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.width,
    this.borderColor,
    this.icon,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String text;
  final double? width;
  final Color? borderColor;
  final String? icon;

  @override
  Widget build(BuildContext context) {
    Widget current = Text(
      text,
      style: AppTheme.data.textTheme.titleSmall
          ?.copyWith(color: borderColor ?? AppTheme.colors.black),
    );

    if (icon != null) {
      current = Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            icon!,
            height: ScreenSize.h20,
          ),
          Gap(ScreenSize.w12),
          current
        ],
      );
    }

    return f_bounce.Bounce(
      onPressed: onPressed,
      duration: const Duration(milliseconds: 150),
      child: Container(
        width: width,
        padding: EdgeInsets.symmetric(
            horizontal: icon != null ? 0 : ScreenSize.w24,
            vertical: ScreenSize.h6),
        decoration: BoxDecoration(
            color: AppTheme.colors.white,
            borderRadius: BorderRadius.circular(15.r),
            border: Border.all(color: borderColor ?? AppTheme.colors.textSecondary)),
        alignment: Alignment.center,
        child: current,
      ),
    );
  }
}
