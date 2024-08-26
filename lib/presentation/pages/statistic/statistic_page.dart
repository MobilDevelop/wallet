import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:wallet_app/application/statistic/statistic_cubit.dart';
import 'package:wallet_app/application/statistic/statistic_state.dart';
import 'package:wallet_app/presentation/assets/asset_index.dart';
import 'components/day-info.dart';
import 'components/statistic.dart';

class StatisticPage extends StatelessWidget {
  const StatisticPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<StatisticCubit,StatisticState>(listener: (_, state) {
      
    },
     child: Builder(builder: (_) {
       StatisticCubit cubit = _.read<StatisticCubit>();

       return BlocBuilder<StatisticCubit,StatisticState>(builder: (_, state) => Scaffold(
         body: Container(
          width: double.maxFinite,
          color: AppTheme.colors.softGray,
           child: Column(
            children: [
              Container(
                height: 80.h,
                width: double.maxFinite,
                color: AppTheme.colors.white,
                alignment: Alignment.bottomCenter,
                padding: EdgeInsets.only(bottom: ScreenSize.h10),
                child: Text("Statistika",style: AppTheme.data.textTheme.headlineMedium),
              ),
              Gap(ScreenSize.h15),

              Statistic(),
              Gap(ScreenSize.h10),

              DayInfo()
            ],
           ),
         )
       ));
     },),
    );
  }
}