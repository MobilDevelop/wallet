import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wallet_app/presentation/assets/asset_index.dart';
import 'package:wallet_app/presentation/components/button/main_button.dart';

class BottomSheetFilter extends StatelessWidget {
  const BottomSheetFilter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: ScreenSize.h10,right: ScreenSize.h10,bottom: ScreenSize.h15),
      decoration: BoxDecoration(
        color: AppTheme.colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(ScreenSize.r10))
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Container(
            height: ScreenSize.h3,
            width: 60.h,
            margin: EdgeInsets.only(top: ScreenSize.h7),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(ScreenSize.r5),
              color: AppTheme.colors.gray1
            ),
          ),
          Gap(ScreenSize.h20),
          Row(
            children: [
              Expanded(child: Container(
                height: ScreenSize.h35,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                color: AppTheme.colors.red.withOpacity(.15),
                borderRadius: BorderRadius.circular(ScreenSize.r10),
                border: Border.all(
                  color: AppTheme.colors.red,
                  width: ScreenSize.h1
                )
                ),
                child: Text("Chiqimlar",style: AppTheme.data.textTheme.titleSmall!.copyWith(color: AppTheme.colors.red)),
              )),
              Gap(ScreenSize.h10),
              Expanded(child: Container(
                height: ScreenSize.h35,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                color: AppTheme.colors.primary.withOpacity(.15),
                borderRadius: BorderRadius.circular(ScreenSize.r10),
                border: Border.all(
                  color: AppTheme.colors.primary,
                  width: ScreenSize.h1
                )
                ),
                child: Text("Kirimlar",style: AppTheme.data.textTheme.titleSmall!.copyWith(color: AppTheme.colors.primary)),
              ))
            ],
          ),
            ],
          ),

          MainButton(text: "Tasdiqlash", onPressed: (){})
        ],
      ),
    );
  }
}