import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:wallet_app/application/home/home_cubit.dart';
import 'package:wallet_app/application/home/home_state.dart';
import 'package:wallet_app/presentation/assets/asset_index.dart';
import 'package:wallet_app/presentation/pages/home/components/costs_info.dart';
import 'package:wallet_app/presentation/pages/home/components/home_top.dart';

import 'components/chart_info.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => HomeCubit(),
    child: BlocListener<HomeCubit,HomeState>(listener: (_, state) {
      
    },
    child: Builder(builder: (_) {
      HomeCubit cubit = _.read<HomeCubit>();
      
      return BlocBuilder<HomeCubit,HomeState>(builder: (_, state) => Scaffold(
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: ScreenSize.h12),
          child: Column(
            children: [
              HomeTop(),

              Expanded(child: ChartInfo()),
              Gap(ScreenSize.h25),

              HomeCostsInfo(),

              Gap(85.h),
            ],
          ),
        )
      ));
    },),
    ),
    );
  }
}