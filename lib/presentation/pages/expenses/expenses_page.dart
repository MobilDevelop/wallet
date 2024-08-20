import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallet_app/application/expenses/expenses_cubit.dart';
import 'package:wallet_app/application/expenses/expenses_state.dart';

class ExpensesPage extends StatelessWidget {
  const ExpensesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => ExpensesCubit(),
     child: BlocListener<ExpensesCubit,ExpensesState>(listener: (_, state) {
       
     },
     child: Builder(builder: (_) {
      ExpensesCubit cubit = _.read<ExpensesCubit>();

      return BlocBuilder<ExpensesCubit,ExpensesState>(builder: (_, state) => Scaffold(
        body: Center(
          child: Text("Expenses page"),
        ),
      )); 
     },),
     ),
    );
  }
}