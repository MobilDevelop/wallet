import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:wallet_app/infrastructure/helper/helper.dart';
import 'package:wallet_app/presentation/assets/res/screen_size.dart';
import 'package:wallet_app/presentation/assets/theme/app_theme.dart';

class Outputs extends StatelessWidget {
  const Outputs({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      color: AppTheme.colors.softGray,
      child:  ListView.builder(
        itemCount: 10,
        padding: EdgeInsets.only(top: ScreenSize.h5,bottom: 80.h),
        itemBuilder: (_, index) => Container(
        width: double.maxFinite,
        margin: EdgeInsets.symmetric(vertical: ScreenSize.h8,horizontal: ScreenSize.h14),
        padding: EdgeInsets.symmetric(horizontal: ScreenSize.h10,vertical: ScreenSize.h15),
        decoration: BoxDecoration(
          color: AppTheme.colors.white,
          borderRadius: BorderRadius.circular(ScreenSize.r15),
          border: Border.all(color: AppTheme.colors.black.withOpacity(.18)),
          boxShadow: [
            BoxShadow(
              color: AppTheme.colors.black.withOpacity(.1),
              blurRadius: ScreenSize.h5,
              spreadRadius: ScreenSize.h5,
              offset:  Offset(ScreenSize.h3, ScreenSize.h5)
            )
          ]
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Chiqim summasi:",style: AppTheme.data.textTheme.labelSmall!.copyWith(color: AppTheme.colors.textSecondary)),
                    Gap(ScreenSize.h3),
                    Text("${Helper.toProcessCost("100000")} so'm",style: AppTheme.data.textTheme.labelLarge?.copyWith(color: AppTheme.colors.red)),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text("Chiqim vaqti:",style: AppTheme.data.textTheme.labelSmall!.copyWith(color: AppTheme.colors.textSecondary)),
                    Gap(ScreenSize.h3),
                    Text("21-avgust, 15:34",style: AppTheme.data.textTheme.labelLarge?.copyWith(color: AppTheme.colors.black)),
                  ],
                )
              ],
            ),
            Gap(ScreenSize.h10),
            DottedLine(dashColor: AppTheme.colors.black.withOpacity(.2)),
            Gap(ScreenSize.h10),
            SizedBox(
              width: double.maxFinite,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(text: TextSpan(
                    text:"Izoh: ",
                    style:  AppTheme.data.textTheme.titleSmall!.copyWith(color: AppTheme.colors.textSecondary),
                    children: [
                      TextSpan(
                        text: "Chiqim summasi aniqlandi",
                        style: AppTheme.data.textTheme.bodyLarge
                      )
                    ]
                  ),
                  ),
                ],
              ),
            )
          ],
        ),
      ))
    );
  }
}