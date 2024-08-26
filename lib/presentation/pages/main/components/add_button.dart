import 'package:flutter/material.dart';
import 'package:wallet_app/presentation/assets/asset_index.dart';

class AddButton extends StatelessWidget {
  const AddButton({
    super.key,
    required this.press,
  });

  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Container(
        height: 58.h,
        width: 58.h,
        margin: EdgeInsets.only(bottom: ScreenSize.h50),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppTheme.colors.primary,
          border: Border.all(
            color: AppTheme.colors.white,
            width: ScreenSize.h2
          ),
        ),
      ),
    );
  }
}