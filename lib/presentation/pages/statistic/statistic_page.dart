import 'package:easy_localization/easy_localization.dart';
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
    return BlocListener<StatisticCubit,StatisticState>(listener: (context, state) {
      
    },
     child: Builder(builder: (context) {
       StatisticCubit cubit = context.read<StatisticCubit>();

       return BlocBuilder<StatisticCubit,StatisticState>(builder: (context, state) => Scaffold(
           backgroundColor: AppTheme.colors.background,
           appBar: AppBar(
                elevation: 0,
                backgroundColor: AppTheme.colors.white,
                centerTitle: true,
                toolbarHeight: 37.h,
                title: Text(tr('Statistika'),
                  style: AppTheme.data.textTheme.titleMedium),
              ),
             body: ListView(
              children: [
             Gap(ScreenSize.h15),
             Statistic(),
             Gap(ScreenSize.h10),
             ListView.builder(
              itemCount: cubit.items.length,
              padding: EdgeInsets.only(bottom: 80.h),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) => cubit.items[index].items.isEmpty?Container():DayInfo(info: cubit.items[index]))
            ],
           )
       ));
     },),
    );
  }
}