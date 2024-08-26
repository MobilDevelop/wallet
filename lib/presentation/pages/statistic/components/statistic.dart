import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wallet_app/presentation/assets/res/screen_size.dart';
import 'package:wallet_app/presentation/assets/theme/app_theme.dart';

class Statistic extends StatelessWidget {
  const Statistic({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170.h,
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: ScreenSize.h10),
      decoration: BoxDecoration(
        color: AppTheme.colors.white,
          borderRadius: BorderRadius.circular(ScreenSize.r15),
          border: Border.all(
            color: AppTheme.colors.black.withOpacity(.18)
          ),
          // boxShadow: [
          //   BoxShadow(
          //     color: AppTheme.colors.black.withOpacity(.1),
          //     blurRadius: ScreenSize.h5,
          //     spreadRadius: ScreenSize.h5,
          //     offset:  Offset(ScreenSize.h3, ScreenSize.h5)
          //   )
          // ]
      ),
    );
  }
}