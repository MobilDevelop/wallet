import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wallet_app/infrastructure/helper/helper.dart';
import 'package:wallet_app/presentation/assets/asset_index.dart';

class HomeCostsInfo extends StatelessWidget {
  const HomeCostsInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: ScreenSize.h15,vertical: ScreenSize.h10),
      margin: EdgeInsets.only(bottom: ScreenSize.h20),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Joriy oydagi kirim:",style: AppTheme.data.textTheme.titleSmall!.copyWith(color: AppTheme.colors.textSecondary)),
              Text("${Helper.toProcessCost("15000000")} so'm",style: AppTheme.data.textTheme.titleMedium!.copyWith(color: AppTheme.colors.green))
            ],
          ),
          Gap(ScreenSize.h5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Joriy oydagi chiqim:",style: AppTheme.data.textTheme.titleSmall!.copyWith(color: AppTheme.colors.textSecondary)),
              Text("${Helper.toProcessCost("6000000")} so'm",style: AppTheme.data.textTheme.titleMedium!.copyWith(color: AppTheme.colors.red))
            ],
          ),
        ],
      ),
    );
  }
}