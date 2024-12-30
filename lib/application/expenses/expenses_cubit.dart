import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallet_app/application/expenses/expenses_state.dart';
import 'package:wallet_app/domain/provider/main_service.dart';
import 'package:wallet_app/infrastructure/models/expenses/expenses_info.dart';

class ExpensesCubit extends Cubit<ExpensesState>{
  ExpensesCubit():super(ExpensesInitial()){
    init();
  }

  List<ExpensesInfo> items = [];

  String type = "";
  String startDate = "";
  String endDete = "";

  bool loading = true;

  void init()async{
    items = await MainService().getPricesInfo("Ayubxon1");
    loading = false;
    emit(ExpensesInitial());
  }
}