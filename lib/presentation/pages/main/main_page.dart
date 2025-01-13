import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:wallet_app/application/main/main_bloc.dart';
import 'package:wallet_app/application/main/main_event.dart';
import 'package:wallet_app/application/main/main_state.dart';
import 'components/add_button.dart';
import 'components/add_expanses.dart';
import 'components/bottom_bar.dart';
import 'components/money.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainBloc(),
      child: BlocListener<MainBloc, MainState>(
          listener: (context, state) {
            if(state is MainAddExpenseState){
              if(state.errorPrice){
                EasyLoading.showInfo("Pul mablag'i kiritilmadi yoki kam");
              }
              if(state.errorCategory){
                EasyLoading.showInfo("Kategoriya tanlanmadi");
              }
            }
          },
          child: Scaffold(
            body: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                BlocBuilder<MainBloc, MainState>(
                  buildWhen: (previous, current) => current is MainBottomViewInitial,
                  builder: (context, state) {
                    return state.currentScreen;
                  },
                ),

                BlocBuilder<MainBloc, MainState>(
                  buildWhen: (previous, current) => current is MainBottomViewInitial,
                  builder: (context, state) {
                    return BottomBar(
                        ontap: (int index) => context.read<MainBloc>().add(MainBottomEvent(index: index)),
                        selectBottomNav: state.selectBottomNav);
                  },
                ),

                BlocBuilder<MainBloc, MainState>(
                  buildWhen: (previous, current) => current is MainAddButtonInitials,
                  builder: (context, state) {
                    if(state is MainAddButtonInitials){
                      return AddExpenses(
                      visibleAdd: state.visibleAdd,
                      press: (int type)=>context.read<MainBloc>().add(MainAddExpenseEvent(type: type)),
                     );
                    }
                    return Container();
                  },
                ),

                BlocBuilder<MainBloc, MainState>(
                  buildWhen: (previous, current) => current is MainAddButtonInitials,
                  builder: (context, state) {
                    return AddButton(
                        controller: state.iconController,
                        press: () =>context.read<MainBloc>().add(MainAddButtonEvent(visible: state.visibleAdd)));
                  },
                ),

                BlocBuilder<MainBloc, MainState>(
                  builder: (context, state) {
                  if(state is MainAddExpenseState){
                    return Money(
                    type: state.moneyType,
                    items: state.categorys,
                    selected: state.selected,
                    errorCategory: state.errorCategory,
                    errorPrice: state.errorPrice,
                    moneyController: state.priceController,
                    commentController: state.commentController,
                    onSelect: (value)=>context.read<MainBloc>().add(MainKategorySelectEvent(select: value, categorys: state.categorys,moneyType: state.moneyType)),
                    
                    successPress: ()=>context.read<MainBloc>().add(MainSaveExpensesEvent(
                      price: state.priceController.text.replaceAll(RegExp(r'[,\.\s]'),''), 
                      comment: state.commentController.text.trim(), 
                      id: state.items.last.id+1, 
                      type: state.moneyType, 
                      categorys: state.categorys)),  
                   
                    showVisible:()=>context.read<MainBloc>().add(MainAddExpenseEvent(type: -1))
                    ).animate().fadeIn().fade();
                  }
                  return Container();
                },
                )
              ],
            ),
          )
      ),
    );
  }
}