import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wallet_app/infrastructure/helper/helper.dart';
import 'package:wallet_app/presentation/assets/res/screen_size.dart';
import 'package:wallet_app/presentation/assets/theme/app_theme.dart';

class ChartInfo extends StatelessWidget {
  const ChartInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: ScreenSize.h15,vertical: ScreenSize.h15),
      decoration: BoxDecoration(
      color: AppTheme.colors.white,
      borderRadius: BorderRadius.circular(ScreenSize.r20),
      boxShadow: [
      BoxShadow(
      color: AppTheme.colors.black.withOpacity(.1),
      blurRadius: ScreenSize.h5,
      spreadRadius: 5,
      offset: const Offset(5, 5)
         )
       ]
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Joriy balans:",style: AppTheme.data.textTheme.titleSmall!.copyWith(color: AppTheme.colors.textSecondary)),
              Text("${Helper.toProcessCost("9000000")} so'm",style: AppTheme.data.textTheme.titleMedium!.copyWith(color: AppTheme.colors.red))
            ],
          ),
           
           Expanded(child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(vertical: ScreenSize.h50,horizontal: ScreenSize.h40),
             child: CircularProgressIndicator(
              value: 75/100,
              color: AppTheme.colors.green,
              strokeWidth: ScreenSize.h35,
              backgroundColor: AppTheme.colors.softBlue,
             ),
           )),
           
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text("Joriy balans:",style: AppTheme.data.textTheme.titleSmall!.copyWith(color: AppTheme.colors.textSecondary)),
                  Gap(ScreenSize.h5),
                  Container(
                    height: ScreenSize.h18,
                    width: ScreenSize.h18,
                    decoration: BoxDecoration(
                      color: AppTheme.colors.green,
                      borderRadius: BorderRadius.circular(ScreenSize.r5)
                    ),
                  )
                ],
              ),
              
              Row(
                children: [
                  Text("Harajatlar:",style: AppTheme.data.textTheme.titleSmall!.copyWith(color: AppTheme.colors.textSecondary)),
                  Gap(ScreenSize.h5),
                  Container(
                    height: ScreenSize.h18,
                    width: ScreenSize.h18,
                    decoration: BoxDecoration(
                      color: AppTheme.colors.softBlue,
                      borderRadius: BorderRadius.circular(ScreenSize.r5)
                    ),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}