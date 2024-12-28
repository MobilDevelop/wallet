import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:wallet_app/infrastructure/models/expenses/category.dart';
import 'package:wallet_app/presentation/assets/asset_index.dart';

class DropDown extends StatelessWidget {
  const DropDown({
    super.key,
    required this.messengers,
    required this.selectMessengers, required this.title, required this.onChanged, required this.errorBorder});
  final Function onChanged;
  final List<ExpensesCategory> messengers;
  final ExpensesCategory? selectMessengers;
  final String title;
  final bool errorBorder;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(" $title",style: AppTheme.data.textTheme.labelSmall!.copyWith(color: AppTheme.colors.textSecondary)),
        DropdownSearch<ExpensesCategory>(
          mode: Mode.MENU,
          items: messengers,
          selectedItem: selectMessengers,
          dropdownBuilder: (context, selectedItem) => Container(
            height: ScreenSize.h35,
            width: double.maxFinite,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: ScreenSize.w5,top: ScreenSize.h2),
            child: Text(selectedItem!=null?selectedItem.title:errorBorder?"Tanlash majburiy":"-",
            style: AppTheme.data.textTheme.labelSmall!.copyWith(fontWeight: FontWeight.w500,color: errorBorder?AppTheme.colors.red:AppTheme.colors.black)),
          ),
          popupItemBuilder: (context, item, isSelected) => Container(
            height: ScreenSize.h35,
            width: double.maxFinite,
            padding: EdgeInsets.only(left: ScreenSize.w8),
            alignment: Alignment.centerLeft,
            color: item.id == selectMessengers?.id?AppTheme.colors.primary.withOpacity(.1):AppTheme.colors.white,
            child: Text(item.title,
            style:AppTheme.data.textTheme.labelSmall!.copyWith(fontWeight: FontWeight.w500,color: item.id == selectMessengers?.id?AppTheme.colors.primary:AppTheme.colors.black))),
          itemAsString: (ExpensesCategory? item) => item!=null?item.title:"",
          popupShape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(ScreenSize.r8)),
          maxHeight: messengers.length>10? null:messengers.length*ScreenSize.h35,
          onChanged: (value) => onChanged(value),
          dropdownSearchDecoration: InputDecoration(
            contentPadding: EdgeInsets.only(left: ScreenSize.w5),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(ScreenSize.r8),
              borderSide: BorderSide(color: errorBorder?AppTheme.colors.red:AppTheme.colors.primary, width: ScreenSize.h1)),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(ScreenSize.r8),
              borderSide: BorderSide(color: errorBorder?AppTheme.colors.red:AppTheme.colors.textSecondary,width: ScreenSize.h1),
            )
          ),
        ),
      ],
    );
  }
}
