import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallet_app/application/statistic/statistic_state.dart';
import 'package:wallet_app/domain/provider/main_service.dart';
import 'package:wallet_app/infrastructure/models/expenses/category.dart';
import 'package:wallet_app/infrastructure/models/expenses/expenses_info.dart';
import 'package:wallet_app/infrastructure/models/statistic/statistic_info.dart';

class StatisticCubit extends Cubit<StatisticState>{
  StatisticCubit():super(StatisticInitial()){
    init();
  }

  List<StatisticInfo> items = [];

  String startDate = "";
  String endDate = "";

  init()async{
    List<ExpensesInfo> expenses = await MainService().getPricesInfo("Ayubxon1");
    List<ExpensesCategory> categorys = await MainService().getCategories("Ayubxon1");

    for (ExpensesCategory category in categorys) {

      List<ExpensesInfo> newData = [];
      int allPrice = 0;

      for (ExpensesInfo element in expenses) {
        if(element.category.id == category.id){
          allPrice+= int.parse(element.value);
          newData.add(element);
        }
      }
      
      items.add(StatisticInfo(
          title: category.title, 
          limit: category.limit, 
          allPrice: allPrice, 
          items: newData)
      );
    }
    
    emit(StatisticInitial());
  }
}