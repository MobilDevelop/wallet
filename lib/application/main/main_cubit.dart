import 'package:animate_icons/animate_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallet_app/application/main/main_state.dart';
import 'package:wallet_app/infrastructure/models/rive_models.dart';
import 'package:wallet_app/presentation/pages/expenses/expenses_page.dart';
import 'package:wallet_app/presentation/pages/home/home_page.dart';
import 'package:wallet_app/presentation/pages/profile/profile_page.dart';
import 'package:wallet_app/presentation/pages/statistic/statistic_page.dart';

class MainCubit extends Cubit<MainState>{
  MainCubit():super(MainInitial()){
    init(0);
  }

  final iconController = AnimateIconController();
  
  int currentIndex = 0;
  int moneyType = 0;

  bool setType = false;
  bool visibleAdd = false;
  bool addVisible = false;

  Widget currentScreen = Container();

  RiveAsset selectBottomNav = sideMenus.first;

  void init(int index){
      switch (index) {
        case 0:currentScreen = const HomePage();      break;
        case 1:currentScreen = const ExpensesPage();  break;
        case 2:currentScreen = const StatisticPage(); break;
        case 3:currentScreen = const ProfilePage();   break;
      }
  }

   void setAdd(){
    visibleAdd = !visibleAdd;
    emit(MainInitial());
   }

   void onCheck(int index){
   
   sideMenus[index].input!.change(true);
   if(sideMenus[index]!=selectBottomNav){
    currentIndex = index;
    init(index);
    selectBottomNav = sideMenus[index];
    emit(MainInitial());
   }
   Future.delayed(const Duration(seconds: 1),(){
   sideMenus[index].input!.change(false);
    });
    
  }

  void showVisible(int type){
    addVisible = !addVisible;
    moneyType = type;
    emit(MainInitial());
  }
}