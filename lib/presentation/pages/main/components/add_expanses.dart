import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wallet_app/presentation/assets/res/screen_size.dart';
import 'package:wallet_app/presentation/assets/theme/app_theme.dart';

class AddExpenses extends StatelessWidget {
  const AddExpenses({
    super.key, required this.visibleAdd, required this.press,
  });

  final bool visibleAdd;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      height: 63.h,
      width: visibleAdd? MediaQuery.of(context).size.width:0,
      margin: EdgeInsets.only(bottom: ScreenSize.h18,left: ScreenSize.h10,right: ScreenSize.h10),
      child: Row(
       children: [
          Expanded(
            child: InkWell(
              onTap: () => press(1),
              child: AnimatedContainer(
                height: double.maxFinite,
                width: double.maxFinite,
                duration: const Duration(milliseconds: 500),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppTheme.colors.red,
                 borderRadius: BorderRadius.horizontal(left: Radius.circular(visibleAdd?23.r:0)),   
                ),
                child: Text("Xarajat kiritish",
                maxLines: 1,
                overflow: TextOverflow.fade,
                style: AppTheme.data.textTheme.displaySmall?.copyWith(color: AppTheme.colors.white)),
              ),
            ),
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            height: visibleAdd?63.h:0,
            width: ScreenSize.h2,
            color: AppTheme.colors.white, 
            ),
          Expanded(
            child: InkWell(
              onTap: () => press(2),
              child: AnimatedContainer(
                height: double.maxFinite,
                width: double.maxFinite,
                duration: const Duration(milliseconds: 500),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppTheme.colors.green,
                   borderRadius: BorderRadius.horizontal(right: Radius.circular(visibleAdd? 23.r:0)),
                ),
                child: Text("Daromad kiritish",
                maxLines: 1,
                overflow: TextOverflow.fade,
                style: AppTheme.data.textTheme.displaySmall?.copyWith(color: AppTheme.colors.white)),
              ),
            ),
          )
        ],
      ),
    );
  }
}