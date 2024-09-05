import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallet_app/application/main/main_cubit.dart';
import 'package:wallet_app/application/main/main_state.dart';
import 'components/add_button.dart';
import 'components/add_expanses.dart';
import 'components/bottom_bar.dart';
import 'components/money.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});
 
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => MainCubit(),
    child: BlocListener<MainCubit,MainState>(listener: (_, state) {
      
    },
     child: Builder(builder: (_) {
       MainCubit cubit = _.read<MainCubit>();

       return BlocBuilder<MainCubit,MainState>(builder: (_, state) => Scaffold(
         body: Stack(
          alignment: Alignment.bottomCenter,
           children: [
             cubit.currentScreen,

             BottomBar(
              colorType: cubit.setType,
              ontap: cubit.onCheck, 
              selectBottomNav: cubit.selectBottomNav),

              AddExpenses(
                visibleAdd: cubit.visibleAdd,
                press:(value)=>cubit.showVisible(value),
                ),

              AddButton(
                iconType: cubit.addVisible,
                controller: cubit.iconController,
                press: cubit.setAdd),

              Visibility(
                visible: cubit.addVisible,
                child: Money(
                  type: cubit.moneyType,
                  showVisible:()=> cubit.showVisible(0)).animate().fadeIn().fade(),
              )
           ],
         ),
       ));
     },),
    ),
    );
  }
}

