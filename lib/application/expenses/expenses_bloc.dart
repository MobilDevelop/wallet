import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallet_app/application/expenses/expenses_event.dart';
import 'package:wallet_app/application/expenses/expenses_state.dart';
import 'package:wallet_app/domain/provider/main_service.dart';

class ExpensesBloc extends Bloc<ExpenseEvent,ExpensesState>{
  ExpensesBloc():super(ExpensesLoadingState()){
    
    on<ExpennseGetItemEvent>((event, emit)async{
      emit(ExpensesSuccess(items: await MainService().getPricesInfo("Ayubxon1")));
    });

   add(ExpennseGetItemEvent()); 
  }
}