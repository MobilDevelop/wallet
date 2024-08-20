import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:rive/rive.dart';
import 'package:wallet_app/infrastructure/helper/rive_utils.dart';
import 'package:wallet_app/infrastructure/models/rive_models.dart';
import 'package:wallet_app/presentation/assets/asset_index.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({
    super.key, required this.ontap, required this.selectBottomNav, required this.colorType,
    });
    final Function ontap;
    final  RiveAsset selectBottomNav;
    final bool colorType;
  @override 
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: ScreenSize.w16,right:ScreenSize.w16,top:ScreenSize.h4,bottom:ScreenSize.h4),
      margin: EdgeInsets.symmetric(horizontal: ScreenSize.w10,vertical: ScreenSize.h15),
      decoration: BoxDecoration(
        color: AppTheme.colors.primary.withOpacity(.9),
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(
            color: AppTheme.colors.white,
            width: 2
          ),
        boxShadow: [
          BoxShadow(
                blurRadius: 14,
                spreadRadius: 7,
                color: Colors.black.withOpacity(.1),
                offset: Offset(5.w,5.h)
              )
        ]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ...List.generate(
            sideMenus.length,
            (index)=>GestureDetector(
                    onTap: ()=>ontap(index),
                    child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                height: ScreenSize.h4,
                width: sideMenus[index]==selectBottomNav? 50.w:0,
                margin: EdgeInsets.only(bottom: ScreenSize.h4),
                decoration: BoxDecoration(
                  color: AppTheme.colors.white,
                  borderRadius: BorderRadius.circular(10.r)
                ),
              ),
              SizedBox(
                height: 35.h,
                width: 35.h,
                child:  Opacity( 
                  opacity: sideMenus[index]==selectBottomNav?1:0.5,
                  child: RiveAnimation.asset(
                  sideMenus.first.src,
                  artboard: sideMenus[index].artboard,
                  onInit: (artboard){
                    StateMachineController  controller = RiveUtils.getRiveController(artboard,
                    stateMachinaName: sideMenus[index].stateMachineName);
                    sideMenus[index].input = controller.findSMI("active") as SMIBool;
                  }
                  ),
                ),
              ),
             sideMenus[index]==selectBottomNav?Text(sideMenus[index].title,style: AppTheme.data.textTheme.labelSmall!.copyWith(color: AppTheme.colors.white)):Gap(ScreenSize.h8)
            ],
                    ),
                  )
          ),
          ],
      ),
    );
  }
}