import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:wallet_app/presentation/assets/asset_index.dart';
import 'package:wallet_app/presentation/components/button/main_button.dart';

class Money extends StatelessWidget {
  const Money({
    super.key, required this.showVisible, required this.type,
  });
  
  final VoidCallback showVisible;
  final int type;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          height: double.maxFinite,
          width: double.maxFinite,
          alignment: Alignment.center,
          color: AppTheme.colors.black.withOpacity(.3),
          padding: EdgeInsets.only(bottom: 100.h),
          child: Container(
            height: 320.h,
            width: double.maxFinite,
            margin: EdgeInsets.symmetric(horizontal: ScreenSize.h25),
            padding: EdgeInsets.symmetric(horizontal: ScreenSize.h10),
            decoration: BoxDecoration(
              color: AppTheme.colors.white,
              borderRadius: BorderRadius.circular(ScreenSize.r25),
              border: Border.all(
                color: type == 1? AppTheme.colors.red:AppTheme.colors.green,
                width: ScreenSize.h2
              ),
              boxShadow: [
                BoxShadow(
                  color: AppTheme.colors.black.withOpacity(.3),
                  blurRadius: ScreenSize.h8,
                  spreadRadius: ScreenSize.h8,
                  offset: Offset(ScreenSize.h5, ScreenSize.h8)
                )
              ]
            ),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Gap(ScreenSize.h10),
                InkWell(
                  onTap: showVisible,
                  child: Container(
                    width: double.maxFinite,
                    alignment: Alignment.centerRight,
                    child: Icon(Icons.close,size: ScreenSize.h25)),
                ),
                Gap(ScreenSize.h20),
                Text(type == 1?"Harajat yaratish":"Kirim yaratish",style: AppTheme.data.textTheme.displaySmall),
                Gap(ScreenSize.h8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(type == 1?"  Harajat miqdori:":"  Kirim miqdori:",style: AppTheme.data.textTheme.labelSmall!.copyWith(color: AppTheme.colors.textSecondary)),
                    Gap(ScreenSize.h4),
                    TextField(
                      decoration: InputDecoration(
                        hintText: "Pul miqdorini kiriting...",
                        hintStyle: AppTheme.data.textTheme.labelSmall!.copyWith(color: AppTheme.colors.textSecondary),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(ScreenSize.r10),
                          borderSide: BorderSide(
                            color: AppTheme.colors.black.withOpacity(.3),
                            width: 1.2
                          )
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(ScreenSize.r10),
                          borderSide: BorderSide(
                            color: AppTheme.colors.primary,
                            width: 1.2
                          )
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: ScreenSize.h10)
                      ),
                    ),
                  ],
                ),
                Gap(ScreenSize.h15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("  Izoh:",style: AppTheme.data.textTheme.labelSmall!.copyWith(color: AppTheme.colors.textSecondary)),
                    Gap(ScreenSize.h4),
                    TextField(
                      style: AppTheme.data.textTheme.bodyLarge,
                      maxLines: 4,
                      decoration: InputDecoration(
                        hintText: "Izoh kiriting...",
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(ScreenSize.r10),
                          borderSide: BorderSide(
                            color: AppTheme.colors.black.withOpacity(.3),
                            width: 1.2
                          )
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(ScreenSize.r10),
                          borderSide: BorderSide(
                            color: AppTheme.colors.primary,
                            width: 1.2
                          )
                        ),
                        hintStyle: AppTheme.data.textTheme.labelSmall!.copyWith(color: AppTheme.colors.textSecondary),
                        contentPadding: EdgeInsets.symmetric(horizontal: ScreenSize.h10,vertical: ScreenSize.h8)
                      ),
                    ),
                    Gap(ScreenSize.h20),
                    MainButton(text: "Tasdiqlash", onPressed: (){})
                  ],
                )
              ],
            ),
          ),
        ),
        Container(
            height:110.h,
            width: 110.h,
            margin: EdgeInsets.only(top: 80.h),
            padding: EdgeInsets.all(ScreenSize.h20),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppTheme.colors.white,
              border: Border.all(
                color: type == 1? AppTheme.colors.red:AppTheme.colors.green,
                width: ScreenSize.h2
                ),
            ),
            child: SvgPicture.asset(type ==1? AppIcons.send:AppIcons.receive,color: type == 1? AppTheme.colors.red:AppTheme.colors.green),
          )
      ],
    );
  }
}