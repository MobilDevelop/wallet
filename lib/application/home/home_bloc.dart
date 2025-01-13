import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallet_app/application/home/home_event.dart';
import 'package:wallet_app/application/home/home_state.dart';
import 'package:wallet_app/domain/provider/main_service.dart';
import 'package:wallet_app/infrastructure/models/expenses/expenses_info.dart';

class HomeBloc extends Bloc<HomeEvent,HomeState>{
  HomeBloc():super(HomeLoadingState()){

    on<HomeGetInfoEvent>((event, emit)async{
      int allIncome = 0;
      int allOutput = 0;

     List<ExpensesInfo> items = await MainService().getPricesInfo(event.name);
      for (ExpensesInfo element in items) {
      if(element.type=="Kirim"){
        allIncome+=int.parse(element.value);
      }else{
        allOutput+=int.parse(element.value);
      }
    }

    emit(HomeSuccessState(allIncome: allIncome, allOutput: allOutput));
    });

   add(HomeGetInfoEvent(name: "Ayubxon1")); 
  }
}