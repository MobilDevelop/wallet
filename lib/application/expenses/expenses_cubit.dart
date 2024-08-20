import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallet_app/application/expenses/expenses_state.dart';

class ExpensesCubit extends Cubit<ExpensesState>{
  ExpensesCubit():super(ExpensesInitial());
}