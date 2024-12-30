import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wallet_app/application/expenses/expenses_cubit.dart';
import 'package:wallet_app/application/expenses/expenses_state.dart';
import 'package:wallet_app/infrastructure/models/expenses/expenses_info.dart';
import 'package:wallet_app/presentation/assets/asset_index.dart';
import 'package:wallet_app/presentation/components/animation_loading/loading.dart';
import 'components/filter.dart';
import 'components/inputs.dart';


class ExpensesPage extends StatelessWidget {
  const ExpensesPage({super.key, required this.items});
  final List<ExpensesInfo> items;
  @override
  Widget build(BuildContext context) {
    return BlocListener<ExpensesCubit,ExpensesState>(listener: (context, state) {
      
    },
    child: Builder(builder: (context) {
     ExpensesCubit cubit = context.read<ExpensesCubit>();

     return BlocBuilder<ExpensesCubit,ExpensesState>(builder: (context, state) => Scaffold(
      backgroundColor: AppTheme.colors.backcolor,
      appBar: AppBar(
        backgroundColor: AppTheme.colors.white,
        elevation: 0,
        centerTitle: true,
        toolbarHeight: ScreenSize.h35,
        title: Text("Harajatlar",style: AppTheme.data.textTheme.titleMedium),
        actions: [
          IconButton(
            onPressed: ()=>showModalBottomSheet(
              context: context,
              backgroundColor: Colors.transparent,
              builder: (context) => BottomSheetFilter()), 
            icon: SvgPicture.asset(AppIcons.filter))
        ],
      ),
       body: Stack(
         children: [
           ListView.builder(
            itemCount: items.length,
            padding: EdgeInsets.only(bottom: 80.h),
            itemBuilder: (context, index) => ExpensesItemView(item: items[items.length-1-index])),
           Visibility(
            visible: cubit.loading,
            child: const Loading()) 
         ],
       )
         )); 
       },),
     );
  }
}