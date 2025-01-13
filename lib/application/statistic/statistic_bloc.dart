import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallet_app/application/statistic/statistic_event.dart';
import 'package:wallet_app/application/statistic/statistic_state.dart';
import 'package:wallet_app/domain/provider/main_service.dart';
import 'package:wallet_app/infrastructure/models/expenses/category.dart';
import 'package:wallet_app/infrastructure/models/expenses/expenses_info.dart';
import 'package:wallet_app/infrastructure/models/statistic/statistic_info.dart';

class StatisticBloc extends Bloc<StatisticEvent,StatisticState>{
  StatisticBloc():super(StatisticLoading()){
     
     on<StatistiGetInfoEvent>((event, emit)async{
        
        List<StatisticInfo> items = [];
        

      for (ExpensesCategory category in await MainService().getCategories("Ayubxon1")) {

       List<ExpensesInfo> newData = [];
       int allPrice = 0;

      for (ExpensesInfo element in await MainService().getPricesInfo("Ayubxon1")) {
        if(element.category.id == category.id && element.type=="Chiqim"){
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
    
    emit(StatisticSuccess(items: items));
     });

     add(StatistiGetInfoEvent());
  }
}