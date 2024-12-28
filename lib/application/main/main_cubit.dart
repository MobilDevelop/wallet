import 'package:animate_icons/animate_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:wallet_app/application/main/main_state.dart';
import 'package:wallet_app/domain/provider/main_service.dart';
import 'package:wallet_app/infrastructure/models/expenses/category.dart';
import 'package:wallet_app/infrastructure/models/expenses/expenses_info.dart';
import 'package:wallet_app/infrastructure/models/rive_models.dart';
import 'package:wallet_app/presentation/pages/expenses/expenses_page.dart';
import 'package:wallet_app/presentation/pages/home/home_page.dart';
import 'package:wallet_app/presentation/pages/profile/profile_page.dart';
import 'package:wallet_app/presentation/pages/statistic/statistic_page.dart';

class MainCubit extends Cubit<MainState>{
  MainCubit():super(MainInitial()){
    init(0);
    getInfo();
  }


  final iconController = AnimateIconController();

  final priceController = TextEditingController();
  final commentController = TextEditingController();

  List<ExpensesInfo> items = [];
  List<ExpensesCategory> categorys = [];

  ExpensesCategory? selected;
  
  int currentIndex = 0;
  int moneyType = 0;

  bool setType = false;
  bool visibleAdd = false;
  bool addVisible = false;
  bool errorCategory = false;
  bool errorPrice = false;

  Widget currentScreen = Container();

  RiveAsset selectBottomNav = sideMenus.first;

  void init(int index){
      switch (index) {
        case 0:currentScreen =  HomePage(items: items); break;
        case 1:currentScreen =  ExpensesPage(items: items);  break;
        case 2:currentScreen = const StatisticPage(); break;
        case 3:currentScreen = const ProfilePage();   break;
      }
  }

  /// firebaseda jadvaldan kategoriyalar va barcha pul ishlanmalarini olib keladi
   getInfo()async{
    items = await MainService().getPricesInfo("Ayubxon1");
    categorys = await MainService().getCategories("Ayubxon1");
    emit(MainInitial());
  }

  /// xarajat yoki daromad kiritilganida katagoriya tanlash
  void onSelectCat(ExpensesCategory cat){
    selected = cat;
    errorCategory= false;
    emit(MainInitial());
  }


  void saveInfo()async{
    
    if(selected==null){
      errorCategory = true;
      EasyLoading.showInfo("Kategoriya tanlanmadi");
    }else {
      errorCategory = false;
    }

    if(priceController.text.length<5){
      errorPrice = true;
      EasyLoading.showInfo("Pul kam yoki kirilitmadi");
    }else{
      errorPrice = false;
    }

    emit(MainInitial());
    
    if(!errorCategory && !errorPrice){
      Map<String,dynamic> param = ExpensesInfo(
      id: items.last.id+1, 
      value: priceController.text.replaceAll(RegExp(r'[,\.\s]'),''), 
      date: DateTime.now().toString(), 
      type: moneyType==1?"Chiqim":"Kirim", 
      comment: commentController.text.trim(), 
      category: selected!).toJson();
      
      String message = await MainService().addPrice(title: "Ayubxon1", id: items.last.id+1, param: param);
      if(message.isNotEmpty){
        EasyLoading.showSuccess(message);
        items.clear();
        categorys.clear();
        addVisible = false;
        emit(MainInitial());
        init(currentIndex);
        getInfo();
      }
    }
    
  }


   void setAdd(){
    visibleAdd = !visibleAdd;
    emit(MainInitial());
   }
   
   /// asosiy oynada pastki qisimdagi oynalarni tanlash bo'limi oynalarni o'zgartirish
   /// funksional qismi riv orqali qilingan
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
    if(type!=0){
      priceController.clear();
      commentController.clear();
      selected = null;
      errorCategory = false;
      errorPrice = false;
    }
    addVisible = !addVisible;
    moneyType = type;
    emit(MainInitial());
  }
}