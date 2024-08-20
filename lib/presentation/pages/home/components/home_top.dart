import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wallet_app/infrastructure/helper/helper.dart';
import 'package:wallet_app/presentation/assets/asset_index.dart';

class HomeTop extends StatelessWidget {
  const HomeTop({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 75.h,
          alignment: Alignment.bottomCenter,
          padding: EdgeInsets.only(bottom: ScreenSize.h10),
          child: Text("Dashboard",style: AppTheme.data.textTheme.headlineMedium,),
        ),
        Container(
          height: 55.h,
          width: double.maxFinite,
          padding: EdgeInsets.only(left: ScreenSize.h20),
          margin: EdgeInsets.only(bottom: ScreenSize.h25),
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
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(Helper.homeDate(DateTime.now()),style: AppTheme.data.textTheme.titleMedium),
              Gap(ScreenSize.h5),
              Text("Muhammadayubxon Nomonov",style: AppTheme.data.textTheme.titleSmall),
            ],
          ),
        ),
      ],
    );
  }
}