import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wallet_app/presentation/assets/res/screen_size.dart';
import 'package:wallet_app/presentation/assets/theme/app_theme.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.only(top: ScreenSize.h15,left: ScreenSize.h15,right: ScreenSize.h15,bottom: ScreenSize.h20),
      margin: EdgeInsets.symmetric(horizontal: ScreenSize.h10,vertical: ScreenSize.h10),
      decoration: BoxDecoration(
        color: AppTheme.colors.white,
      borderRadius: BorderRadius.circular(ScreenSize.r10),  
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
        children: [
          CircleAvatar(
            radius: ScreenSize.r45,
            backgroundColor: Colors.blue,
          ),
          Gap(ScreenSize.h30),
          SizedBox(
            width: double.maxFinite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Full Name",style: AppTheme.data.textTheme.bodyLarge!.copyWith(color: AppTheme.colors.textSecondary)),
                Gap(ScreenSize.h2),
                Text("Nomonov Muhammadayubxon",style: AppTheme.data.textTheme.titleSmall),
                Gap(ScreenSize.h10),
                Divider(
                  color: AppTheme.colors.black.withOpacity(.3),
                  height: ScreenSize.h2,
                )
              ],
            ),
          ),
          Gap(ScreenSize.h20),
          Container(
            width: double.maxFinite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Email adress",style: AppTheme.data.textTheme.bodyLarge!.copyWith(color: AppTheme.colors.textSecondary)),
                Gap(ScreenSize.h2),
                Text("nomonovmuhammdayubxon@gmail.com",style: AppTheme.data.textTheme.titleSmall),
                Gap(ScreenSize.h10),
                Divider(
                  color: AppTheme.colors.black.withOpacity(.3),
                  height: ScreenSize.h2,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}