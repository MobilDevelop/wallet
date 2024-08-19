import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:wallet_app/presentation/assets/res/screen_size.dart';
import 'package:wallet_app/presentation/assets/theme/app_theme.dart';

class ItemLoading extends StatelessWidget {
  const ItemLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
         filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
        child: Container(
          height: double.maxFinite,
          decoration: BoxDecoration(
            color: AppTheme.colors.stroke.withOpacity(.3),
            borderRadius: BorderRadius.circular(ScreenSize.r5),
          ),
          alignment: Alignment.center,
          child: LoadingAnimationWidget.beat(color: AppTheme.colors.primary, size: 50)),
      ),
    );
  }
}