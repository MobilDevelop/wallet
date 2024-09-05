import 'package:animate_icons/animate_icons.dart';
import 'package:flutter/material.dart';
import 'package:wallet_app/presentation/assets/asset_index.dart';

class AddButton extends StatelessWidget {
  const AddButton({
    super.key,
    required this.press, required this.iconType, required this.controller,
  });

  final VoidCallback press;
  final bool iconType;
  final AnimateIconController controller;

  @override
  Widget build(BuildContext context) {
    return Container(

      margin: EdgeInsets.only(bottom: ScreenSize.h50),
      padding: EdgeInsets.all(ScreenSize.h5),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppTheme.colors.primary,
        border: Border.all(
          color: AppTheme.colors.white,
          width: ScreenSize.h2
        ),
      ),
      child:AnimateIcons(
    startIcon: Icons.add,
    endIcon: Icons.close,
    size: 35.h,
    controller: controller,

    onStartIconPress: () {
      press();
      return true;
    },
    onEndIconPress: () {
      press();
      return true;
    },
    duration: const Duration(milliseconds: 100),
    startIconColor: Colors.white,
    endIconColor: Colors.white,
    clockwise: true,
),
    );
  }
}