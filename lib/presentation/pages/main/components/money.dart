import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:pattern_formatter/pattern_formatter.dart';
import 'package:wallet_app/infrastructure/models/expenses/category.dart';
import 'package:wallet_app/presentation/assets/asset_index.dart';
import 'package:wallet_app/presentation/components/button/border_button.dart';
import 'package:wallet_app/presentation/components/dropDown.dart';

class Money extends StatelessWidget {
  const Money({
    super.key, required this.showVisible, required this.type, required this.items, this.selected, required this.onSelect, 
    required this.moneyController, required this.commentController, required this.successPress, required this.errorCategory, required this.errorPrice,
  });
  
  final int type;
  final List<ExpensesCategory> items;
  final ExpensesCategory? selected;
  final Function onSelect;
  final VoidCallback showVisible;
  final VoidCallback successPress;
  final TextEditingController moneyController;
  final TextEditingController commentController;
  final bool errorCategory;
  final bool errorPrice;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.maxFinite,
      width: double.maxFinite,
      alignment: Alignment.center,
      color: AppTheme.colors.black.withOpacity(.3),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            height: 300.h,
            width: double.maxFinite,
            margin: EdgeInsets.symmetric(horizontal: ScreenSize.h15),
            padding: EdgeInsets.symmetric(horizontal: ScreenSize.h10),
            decoration: BoxDecoration(
              color: AppTheme.colors.white,
              borderRadius: BorderRadius.circular(ScreenSize.r18),
              border: Border.all(
                color: type == 1? AppTheme.colors.red:AppTheme.colors.primary,
                width: ScreenSize.h1
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
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(type == 1?"  Harajat miqdori:":"  Kirim miqdori:",style: AppTheme.data.textTheme.labelSmall!.copyWith(color: AppTheme.colors.textSecondary)),
                    TextField(
                      controller: moneyController,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        ThousandsFormatter(allowFraction: true),
                        LengthLimitingTextInputFormatter(13),
                       ],
                      decoration: InputDecoration(
                        hintText: "Pul miqdorini kiriting...",
                        hintStyle: AppTheme.data.textTheme.labelSmall!.copyWith(color: AppTheme.colors.textSecondary),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(ScreenSize.r10),
                          borderSide: BorderSide(
                            color: errorPrice?AppTheme.colors.red:AppTheme.colors.black.withOpacity(.3),
                            width: 1.2
                          )
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(ScreenSize.r10),
                          borderSide: BorderSide(
                            color: errorPrice?AppTheme.colors.red:AppTheme.colors.primary,
                            width: 1.2
                          )
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: ScreenSize.h10)
                      ),
                    ),
                  ],
                ),
                Gap(ScreenSize.h10),
                DropDown(
                  messengers: items, 
                  selectMessengers: selected,
                   title: "Kategoriya", 
                   onChanged: (value)=>onSelect(value), 
                   errorBorder: errorCategory),
                Gap(ScreenSize.h10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("  Izoh:",style: AppTheme.data.textTheme.labelSmall!.copyWith(color: AppTheme.colors.textSecondary)),
                    TextField(
                      controller: commentController,
                      style: AppTheme.data.textTheme.bodyLarge,
                      maxLines: 2,
                      decoration: InputDecoration(
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
                    Gap(ScreenSize.h15),
                    Row(
                      children: [
                        Expanded(
                          child: BorderButton(
                            onPressed: showVisible, 
                            borderColor: AppTheme.colors.red,
                            text: "Bekor qilish"),
                        ),
                          Gap(ScreenSize.h10),
                          Expanded(
                            child: BorderButton(
                            onPressed: successPress, 
                            borderColor: AppTheme.colors.primary,
                            text: "Tasdiqlash"),
                          )
                      ],
                    ),
                    ],
                ),
                Gap(ScreenSize.h10)
              ],
            ),
          ),
          Transform.translate(
            offset: Offset(0, -60.h),
            child: Container(
            height:110.h,
            width: 110.h,
            padding: EdgeInsets.all(ScreenSize.h20),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppTheme.colors.white,
              border: Border.all(
                color: type == 1? AppTheme.colors.red:AppTheme.colors.primary,
                width: ScreenSize.h1
                ),
            ),
            child: SvgPicture.asset(type ==1? AppIcons.send:AppIcons.receive,color: type == 1? AppTheme.colors.red:AppTheme.colors.primary),
          )),
        ],
      ),
    );
  }
}