import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallet_app/application/expenses/expenses_cubit.dart';
import 'package:wallet_app/application/expenses/expenses_state.dart';
import 'package:wallet_app/presentation/assets/asset_index.dart';

import 'components/inputs.dart';
import 'components/outputs.dart';

class ExpensesPage extends StatelessWidget {
  const ExpensesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ExpensesCubit,ExpensesState>(listener: (_, state) {
      
    },
    child: Builder(builder: (_) {
     ExpensesCubit cubit = _.read<ExpensesCubit>();

     return BlocBuilder<ExpensesCubit,ExpensesState>(builder: (_, state) => Scaffold(
       body: Container(
         width: double.maxFinite,
         color: AppTheme.colors.background,
         child: Column(
           children: [
             Container(
               height: ScreenSize.h50,
               alignment: Alignment.bottomCenter,
               color: AppTheme.colors.white,
               padding: EdgeInsets.only(bottom: ScreenSize.h5),
               //child: Text("Harajatlar",style: AppTheme.data.textTheme.headlineMedium),
             ),
             Expanded(
               child: ContainedTabBarView(
                 tabBarProperties: TabBarProperties(
                   indicatorColor: AppTheme.colors.primary,
                   labelStyle: AppTheme.data.textTheme.titleMedium,
                   unselectedLabelStyle: AppTheme.data.textTheme.titleMedium,
                   labelColor: AppTheme.colors.primary,
                   background: Container(
                     color: AppTheme.colors.white,
                   ),
                   unselectedLabelColor: AppTheme.colors.black.withOpacity(.7)
                 ),
            tabs: const [
                     Text('Kirimlar'),
                     Text('Chiqimlar'),
                   ],

            views: [
                     Inputs(),
                     Outputs()
                   ],
               onChange: (index) => print(index),
                   ),
             ),
               ],
             ),
           )
         )); 
       },),
     );
  }
}
