import 'package:flutter/material.dart';
import 'package:wallet_app/presentation/assets/res/screen_size.dart';
import 'package:wallet_app/presentation/assets/theme/app_theme.dart';

class Setting extends StatelessWidget {
  const Setting({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: ScreenSize.h15,vertical: ScreenSize.h10),
      padding: EdgeInsets.symmetric(horizontal: ScreenSize.h10,vertical: ScreenSize.h10),
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Setting",style: AppTheme.data.textTheme.headlineMedium)
      ],
     ), 
    );
  }
}