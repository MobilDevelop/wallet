import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wallet_app/infrastructure/helper/helper.dart';
import 'package:wallet_app/infrastructure/models/statistic/statistic_info.dart';
import 'package:wallet_app/presentation/assets/res/screen_size.dart';
import 'package:wallet_app/presentation/assets/theme/app_theme.dart';

class DayInfo extends StatelessWidget {
  const DayInfo({
    super.key, required this.info,
  });
   final StatisticInfo info;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
       margin: EdgeInsets.symmetric(horizontal: ScreenSize.h10,vertical: ScreenSize.h8),
       padding: EdgeInsets.all(ScreenSize.h10),
      decoration: BoxDecoration(
        color: AppTheme.colors.white,
          borderRadius: BorderRadius.circular(ScreenSize.r15),
          border: Border.all(
          color: info.allPrice>info.limit? AppTheme.colors.red:AppTheme.colors.black.withOpacity(.18),
          width: ScreenSize.h1
          ),
      ),
      child: Column(
        children: [
          Text(info.title,style: AppTheme.data.textTheme.titleSmall),
          Gap(ScreenSize.h5),
          DottedLine(dashGapLength: ScreenSize.h3,dashRadius: ScreenSize.h5,dashGradient: [AppTheme.colors.intro3,AppTheme.colors.primary]),
          Gap(ScreenSize.h10),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Xarajat:",style: AppTheme.data.textTheme.bodySmall!.copyWith(color: AppTheme.colors.textSecondary)),
                    Text("${Helper.toProcessCost(info.allPrice.toString())} so'm",style: AppTheme.data.textTheme.labelSmall!.copyWith(fontWeight: FontWeight.w600)),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text("Cheklov:",style: AppTheme.data.textTheme.bodySmall!.copyWith(color: AppTheme.colors.textSecondary)),
                    Text("${Helper.toProcessCost(info.limit.toString())}  so'm",style: AppTheme.data.textTheme.labelSmall!.copyWith(fontWeight: FontWeight.w600)),
                  ],
                )
              ],
            ),
            Gap(ScreenSize.h10),
            Container(
              height: ScreenSize.h30,
              width: double.maxFinite,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(ScreenSize.r5),
                border: Border.all(
                  color: AppTheme.colors.grey
                )
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: info.allPrice,
                    child: Container(
                      height: ScreenSize.h30,
                      alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppTheme.colors.gold,
                      borderRadius: BorderRadius.horizontal(left: Radius.circular(ScreenSize.r4))
                    ),
                    child: Text("${((info.allPrice/info.limit)*100).round()}%",style: AppTheme.data.textTheme.bodyMedium),
                  )),
                  Expanded(
                    flex: info.limit-info.allPrice,
                    child: Container(
                      height: ScreenSize.h30,
                      alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppTheme.colors.gray1,
                      borderRadius: BorderRadius.horizontal(right: Radius.circular(ScreenSize.r4))
                    ),
                    child: Text("${(((info.limit-info.allPrice)/info.limit)*100).round()}%",style: AppTheme.data.textTheme.bodyMedium),
                  ))
                ],
              ),
            ),
            Gap(ScreenSize.h15),
             Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(ScreenSize.r8),
                border: Border.all(
                  color: AppTheme.colors.grey
                )
              ),
              child: Column(
                children: [
                  for(int index=0;index<info.items.length;index++)...[
               Container(
                decoration: BoxDecoration(
                  color: index%2==0?AppTheme.colors.gray1:AppTheme.colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(index==0?ScreenSize.r8:0),bottom: Radius.circular(index+1==info.items.length?ScreenSize.r8:0))
                ),
                 child: Row(
                      children: [
                  Container(
                    height: ScreenSize.h25,
                    width: ScreenSize.h25,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border(
                        right: BorderSide(
                          color: AppTheme.colors.grey
                        )
                      )
                    ),
                    child: Text("${index+1}",style: AppTheme.data.textTheme.labelSmall),
                  ),
                  Gap(ScreenSize.h3),
                  Expanded(
                    child: Container(
                      height: ScreenSize.h25,
                      padding: EdgeInsets.only(left: ScreenSize.h2,right: ScreenSize.h6),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                      Text("${Helper.toProcessCost(info.items[index].value)} so'm",style: AppTheme.data.textTheme.labelSmall),
                      Text(Helper.dateFormat(info.items[index].date),style: AppTheme.data.textTheme.labelSmall),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: ScreenSize.h25,
                    width: ScreenSize.h45,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border(
                        left: BorderSide(
                          color: AppTheme.colors.grey
                        )
                      )
                    ),
                    child: Text(Helper.timeFormat(info.items[index].date),style: AppTheme.data.textTheme.labelSmall),
                  ),
                      ],
                   ),
               )
             ]
                ],
              ),
             )
        ],
      ),
    );
  }
}