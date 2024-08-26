import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallet_app/application/main/main_cubit.dart';
import 'package:wallet_app/application/main/main_state.dart';
import 'components/add_button.dart';
import 'components/add_expanses.dart';
import 'components/bottom_bar.dart';

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

              AddExpenses(visibleAdd: cubit.visibleAdd),

              AddButton(press: cubit.setAdd),
           ],
         ),
       ));
     },),
    ),
    );
  }
}