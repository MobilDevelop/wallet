import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallet_app/application/home/home_state.dart';
import 'package:wallet_app/domain/provider/main_service.dart';
import 'package:wallet_app/infrastructure/models/expenses/expenses_info.dart';

class HomeCubit extends Cubit<HomeState>{
  HomeCubit():super(HomeInitial()){
    init();
  }


  int allIncome = 1;
  int allOutput = 1;

  bool loading = true;

  init()async{
    List<ExpensesInfo> items = await MainService().getPricesInfo("Ayubxon1");
      allIncome = 0;
      allOutput = 0;
    for (ExpensesInfo element in items) {
      if(element.type=="Kirim"){
        allIncome+=int.parse(element.value);
      }else{
        allOutput+=int.parse(element.value);
      }
    }
    loading = false;
    emit(HomeInitial());
  }
}