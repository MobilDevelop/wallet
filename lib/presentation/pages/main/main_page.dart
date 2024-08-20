import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wallet_app/application/main/main_cubit.dart';
import 'package:wallet_app/application/main/main_state.dart';
import 'package:wallet_app/presentation/assets/res/screen_size.dart';
import 'package:wallet_app/presentation/assets/theme/app_theme.dart';

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
              // Bounce(
              //   duration: const Duration(milliseconds: 200),
              //   onPressed: () {
                  
              //   },
              //   child: Container(
              //     height: 58.h,
              //     width: 58.h,
              //     margin: EdgeInsets.only(bottom: ScreenSize.h20),
              //     decoration: BoxDecoration(
              //       shape: BoxShape.circle,
              //       color: AppTheme.colors.primary,
              //       border: Border.all(
              //         color: AppTheme.colors.white,
              //         width: 2
              //       ),
              //       boxShadow: [
              //     BoxShadow(
              //     blurRadius: 14,
              //     spreadRadius: 7,
              //     color: AppTheme.colors.black.withOpacity(.1),
              //     offset: Offset(5.w,5.h)
              //         )
              //       ]
              //     ),
              //   ),
              // ), 
              
           ],
         ),
       ));
     },),
    ),
    );
  }
}