import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:wallet_app/application/home/home_bloc.dart';
import 'package:wallet_app/application/home/home_state.dart';
import 'package:wallet_app/presentation/assets/asset_index.dart';
import 'package:wallet_app/presentation/components/animation_loading/loading.dart';
import 'package:wallet_app/presentation/pages/home/components/costs_info.dart';
import 'package:wallet_app/presentation/pages/home/components/home_top.dart';

import 'components/chart_info.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listener: (context, state) {},
      child: Scaffold(
                  backgroundColor: AppTheme.colors.background,
                  appBar: AppBar(
                    elevation: 0,
                    backgroundColor: AppTheme.colors.white,
                    centerTitle: true,
                    toolbarHeight: 37.h,
                    title: Text(tr('Dashboard'),
                        style: AppTheme.data.textTheme.titleMedium),
                  ),
                  body: BlocBuilder<HomeBloc, HomeState>(
                    builder: (context, state) {
                      if(state is HomeLoadingState){
                        return loadingView();
                      } else if(state is HomeSuccessState){
                        return succesView(state.allIncome, state.allOutput);
                      }
                      return Container();
                    },
                  ))
    );
  }
 
 Widget loadingView()=> const Loading();

 Widget succesView(int allIncome, int allOutput)=> Container(
              width: double.maxFinite,
             padding: EdgeInsets.symmetric(horizontal: ScreenSize.h12),
                child: Column(
                  children: [
                    Gap(ScreenSize.h15),
                    const HomeTop(),
                      Expanded(
                       child: ChartInfo(input: allIncome,output: allOutput)),
            Gap(ScreenSize.h15),
            HomeCostsInfo(input: allIncome.toString(),output: allOutput.toString()),
            Gap(80.h),
        ],
     ),
  );
}