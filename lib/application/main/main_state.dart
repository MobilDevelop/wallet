import 'package:animate_icons/animate_icons.dart';
import 'package:flutter/material.dart';
import 'package:wallet_app/infrastructure/models/expenses/category.dart';
import 'package:wallet_app/infrastructure/models/expenses/expenses_info.dart';
import 'package:wallet_app/infrastructure/models/rive_models.dart';

abstract class MainState{
  final RiveAsset selectBottomNav;
  final Widget currentScreen;
  final bool visibleAdd;
  final AnimateIconController iconController = AnimateIconController();

  MainState({RiveAsset? selectBottomNav,Widget? currentScreen,this.visibleAdd = false}):
  currentScreen = currentScreen??Container(),selectBottomNav=selectBottomNav??sideMenus[0];
}

class MainInitial extends MainState{}


class MainBottomViewInitial extends MainState{

  MainBottomViewInitial({super.currentScreen,super.selectBottomNav});
}

class MainAddButtonInitials extends MainState{
  @override
  final bool visibleAdd;
  MainAddButtonInitials({required this.visibleAdd});
}

class MainAddExpenseState extends MainState{
  final TextEditingController priceController;
  final TextEditingController commentController;
  final List<ExpensesCategory> categorys;
  final List<ExpensesInfo> items;
  final ExpensesCategory? selected;
  final int moneyType;
  final bool errorCategory;
  final bool errorPrice;

  MainAddExpenseState({TextEditingController? commentController,TextEditingController? priceController,required this.moneyType,
  required this.categorys,this.selected,this.errorCategory = false,this.errorPrice = false, List<ExpensesInfo>? items}):
  commentController=commentController??TextEditingController(),
  priceController=priceController??TextEditingController(),
  items = items?? [];
  
}