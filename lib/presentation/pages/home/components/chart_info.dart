import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wallet_app/infrastructure/helper/helper.dart';
import 'package:wallet_app/presentation/assets/asset_index.dart';

class ChartInfo extends StatelessWidget {
  const ChartInfo({
    super.key, required this.input, required this.output,
  });
  final int input;
  final int output;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: ScreenSize.h15,vertical: ScreenSize.h15),
      decoration: BoxDecoration(
      color: AppTheme.colors.white,
      borderRadius: BorderRadius.circular(ScreenSize.r15),
      boxShadow: [
      BoxShadow(
      color: AppTheme.colors.black.withOpacity(.1),
      blurRadius: ScreenSize.h5,
      spreadRadius: ScreenSize.h1,
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
              Text("Joriy balans:",style: AppTheme.data.textTheme.labelMedium!.copyWith(color: AppTheme.colors.textSecondary)),
              Text("${Helper.toProcessCost("${input-output}")} so'm",style: AppTheme.data.textTheme.titleMedium!.copyWith(color: AppTheme.colors.red))
            ],
          ),
           
           Stack(
            alignment: Alignment.center,
             children: [
               SizedBox(
                height: 200.h,
                width: 200.h,
                 child: CircularProgressIndicator(
                  value: (input-output)/input,
                  color: AppTheme.colors.green,
                  strokeWidth: ScreenSize.h30,
                  backgroundColor: AppTheme.colors.softBlue,
                 ),
               ),
               Text("${(((input-output)/input)*100).round()}%",style: AppTheme.data.textTheme.headlineSmall)
             ],
           ),
           
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text("Joriy balans:",style: AppTheme.data.textTheme.labelMedium!.copyWith(color: AppTheme.colors.textSecondary)),
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
                  Text("Harajatlar:",style: AppTheme.data.textTheme.labelMedium!.copyWith(color: AppTheme.colors.textSecondary)),
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