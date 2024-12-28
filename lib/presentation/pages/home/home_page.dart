import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:wallet_app/application/home/home_cubit.dart';
import 'package:wallet_app/application/home/home_state.dart';
import 'package:wallet_app/infrastructure/models/expenses/expenses_info.dart';
import 'package:wallet_app/presentation/assets/asset_index.dart';
import 'package:wallet_app/presentation/pages/home/components/costs_info.dart';
import 'package:wallet_app/presentation/pages/home/components/home_top.dart';

import 'components/chart_info.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.items});
  final List<ExpensesInfo> items;
  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeCubit,HomeState>(listener: (context, state) {
      
    },
    child: Builder(builder: (context) {
      HomeCubit cubit = context.read<HomeCubit>();
      
      return BlocBuilder<HomeCubit,HomeState>(builder: (context, state) => Scaffold(
        backgroundColor: AppTheme.colors.background,
        appBar: AppBar(
                elevation: 0,
                backgroundColor: AppTheme.colors.white,
                centerTitle: true,
                toolbarHeight: 37.h,
                title: Text(tr('Dashboard'),
                  style: AppTheme.data.textTheme.titleMedium),
              ),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: ScreenSize.h12),
          child: Column(
            children: [
              Gap(ScreenSize.h15),
              const HomeTop(),

              Expanded(child: ChartInfo(input: cubit.allIncome,output: cubit.allOutput)),
              Gap(ScreenSize.h15),

              HomeCostsInfo(input: cubit.allIncome.toString(),output: cubit.allOutput.toString()),

              Gap(80.h),
            ],
          ),
        )
      ));
    },),
    );
  }
}