import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:wallet_app/application/main/main_event.dart';
import 'package:wallet_app/application/main/main_state.dart';
import 'package:wallet_app/domain/provider/main_service.dart';
import 'package:wallet_app/infrastructure/local_source/local_source.dart';
import 'package:wallet_app/infrastructure/models/expenses/category.dart';
import 'package:wallet_app/infrastructure/models/expenses/expenses_info.dart';
import 'package:wallet_app/infrastructure/models/rive_models.dart';
import 'package:wallet_app/presentation/pages/expenses/expenses_page.dart';
import 'package:wallet_app/presentation/pages/home/home_page.dart';
import 'package:wallet_app/presentation/pages/profile/profile_page.dart';
import 'package:wallet_app/presentation/pages/statistic/statistic_page.dart';

class MainBloc extends Bloc<MainEvent,MainState>{
  MainBloc():super(MainInitial()){
    
    on<MainBottomEvent>((event, emit){
     // sideMenus[event.index].input!.change(true);

      emit(MainBottomViewInitial(currentScreen: init(event.index),selectBottomNav: sideMenus[event.index]));
     
       Future.delayed(const Duration(seconds: 1),(){
       //sideMenus[event.index].input!.change(false);
      // emit(MainBottomViewInitial(currentScreen: init(event.index),selectBottomNav: sideMenus[event.index]));
       });
    });

    on<MainSaveExpensesEvent>((event, emit)async{

      bool errorCategory = event.selected==null;
      bool errorPrice = event.price.length<5;
    
    if(!errorCategory && !errorPrice){
      
      String message = await MainService().addPrice(title: "Ayubxon1", id: event.id, 
      param: ExpensesInfo(
       id: event.id, 
       value: event.price, 
       date: DateTime.now().toString(), 
       type: event.type==1?"Kirim":"Chiqim", 
       comment: event.comment, 
       category: event.selected!).toJson());
      
      if(message.isNotEmpty){
        EasyLoading.showSuccess(message);
        emit(MainInitial());
       }
     }else{
      emit(MainAddExpenseState(moneyType: event.type, categorys: event.categorys,errorCategory: errorCategory,errorPrice: errorPrice));
     }
    });

    on<MainAddExpenseEvent>((event, emit)async{
      if(event.type==-1){
        emit(MainInitial());
      }else{
        emit(MainAddExpenseState(moneyType: event.type, categorys: await getCategory(),items: await getExpenses()));
      }
    });

    on<MainAddButtonEvent>((event, emit){
      emit(MainAddButtonInitials(visibleAdd: !event.visible));
    });

    on<MainKategorySelectEvent>((event, emit){
        emit(MainAddExpenseState(moneyType: event. moneyType, categorys: event.categorys,selected: event.select));
    });

    add(MainBottomEvent(index: 0));
  }

  Widget init(int index){
      switch (index) {
        case 0:return const HomePage();
        case 1:return const ExpensesPage();
        case 2:return const StatisticPage();
        case 3:return const ProfilePage();
      }
      return Container();
  }

  // firebaseda jadvaldan kategoriyalar va barcha pul ishlanmalarini olib keladi
   Future<List<ExpensesCategory>> getCategory()async{
    String uuid = await LocalSource.getInfo(key: "UserUUID");

    return Future.value(await MainService().getCategories("Ayubxon1"));
  }

  Future<List<ExpensesInfo>> getExpenses()async{
    String uuid = await LocalSource.getInfo(key: "UserUUID");

    return Future.value(await MainService().getPricesInfo("Ayubxon1"));
  }
}