import 'package:flutter/material.dart';
import 'package:wallet_app/presentation/assets/res/screen_size.dart';
import 'package:wallet_app/presentation/assets/theme/app_theme.dart';

class DayInfo extends StatelessWidget {
  const DayInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200 ,
      width: double.maxFinite,
       margin: EdgeInsets.symmetric(horizontal: ScreenSize.h10),
      decoration: BoxDecoration(
        color: AppTheme.colors.white,
          borderRadius: BorderRadius.circular(ScreenSize.r15),
          border: Border.all(
          color: AppTheme.colors.black.withOpacity(.18)
          ),
      ),
    );
  }
}