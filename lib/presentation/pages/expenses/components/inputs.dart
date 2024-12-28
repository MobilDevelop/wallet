import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wallet_app/infrastructure/helper/helper.dart';
import 'package:wallet_app/infrastructure/models/expenses/expenses_info.dart';
import 'package:wallet_app/presentation/assets/asset_index.dart';

class ExpensesItemView extends StatelessWidget {
  const ExpensesItemView({
    super.key, required this.item,
  });
  final ExpensesInfo item;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.maxFinite,
        margin: EdgeInsets.symmetric(vertical: ScreenSize.h7,horizontal: ScreenSize.h14),
        padding: EdgeInsets.symmetric(horizontal: ScreenSize.h10,vertical: ScreenSize.h5),
        decoration: BoxDecoration(
          color: AppTheme.colors.white,
          borderRadius: BorderRadius.circular(ScreenSize.r15),
          border: Border.all(
            color: item.type=="Kirim"?AppTheme.colors.primary:AppTheme.colors.red,
            width: ScreenSize.h1
          ),
          boxShadow: [
            BoxShadow(
              color: AppTheme.colors.black.withOpacity(.1),
              blurRadius: ScreenSize.h5,
              spreadRadius: ScreenSize.h1,
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
                    Text("${item.type} summasi",style: AppTheme.data.textTheme.bodySmall!.copyWith(color: AppTheme.colors.textSecondary)),
                    Text("${Helper.toProcessCost(item.value)} so'm",
                    style: AppTheme.data.textTheme.labelSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: item.type=="Kirim"?AppTheme.colors.primary:AppTheme.colors.red)),
                  ],
                ),
                Text("ID: ${item.id}",style: AppTheme.data.textTheme.labelLarge?.copyWith(color: AppTheme.colors.black))
              ],
            ),
            Gap(ScreenSize.h10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${item.type} kuni:",style: AppTheme.data.textTheme.bodySmall!.copyWith(color: AppTheme.colors.textSecondary)),
                    Text(Helper.dateFormat(item.date),style: AppTheme.data.textTheme.labelSmall!.copyWith(fontWeight: FontWeight.w600)),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text("${item.type} vaqti:",style: AppTheme.data.textTheme.bodySmall!.copyWith(color: AppTheme.colors.textSecondary)),
                    Text(Helper.timeFormat(item.date),style: AppTheme.data.textTheme.labelSmall!.copyWith(fontWeight: FontWeight.w600)),
                  ],
                )
              ],
            ),
            Gap(ScreenSize.h10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Kategoriya:",style: AppTheme.data.textTheme.labelSmall!.copyWith(color: AppTheme.colors.textSecondary)),
                Text(item.category.title,style: AppTheme.data.textTheme.labelSmall!.copyWith(fontWeight: FontWeight.w600)),
              ],
            ),
            Gap(ScreenSize.h10),
            DottedLine(dashColor: AppTheme.colors.black.withOpacity(.2)),
            Gap(ScreenSize.h5),
            SizedBox(
              width: double.maxFinite,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(text: TextSpan(
                    text:"Izoh: ",
                    style:  AppTheme.data.textTheme.labelLarge,
                    children: [
                      TextSpan(
                        text: item.comment,
                        style: AppTheme.data.textTheme.bodyMedium
                      )
                    ]
                  ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
  }
}