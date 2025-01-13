import 'package:wallet_app/infrastructure/models/expenses/expenses_info.dart';

abstract class ExpensesState{}

class  ExpensesInitial extends ExpensesState{}

class  ExpensesLoadingState extends ExpensesState{}

class  ExpensesSuccess extends ExpensesState{
 final List<ExpensesInfo> items;

  // String type = "";
  // String startDate = "";
  // String endDete = "";

  ExpensesSuccess({required this.items});
}