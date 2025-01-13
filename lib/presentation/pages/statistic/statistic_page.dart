import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:wallet_app/application/statistic/statistic_bloc.dart';
import 'package:wallet_app/application/statistic/statistic_state.dart';
import 'package:wallet_app/infrastructure/models/statistic/statistic_info.dart';
import 'package:wallet_app/presentation/assets/asset_index.dart';
import 'package:wallet_app/presentation/components/animation_loading/loading.dart';
import 'components/day-info.dart';
import 'components/statistic.dart';

class StatisticPage extends StatelessWidget {
  const StatisticPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<StatisticBloc, StatisticState>(
      listener: (context, state) {},
      child: Scaffold(
                  backgroundColor: AppTheme.colors.background,
                  appBar: AppBar(
                    elevation: 0,
                    backgroundColor: AppTheme.colors.white,
                    centerTitle: true,
                    toolbarHeight: 37.h,
                    title: Text(tr('Statistika'),
                        style: AppTheme.data.textTheme.titleMedium),
                  ),
                  body: BlocBuilder<StatisticBloc, StatisticState>(
                    builder: (context, state) {
                      if(state is StatisticLoading){
                        return const Loading();
                      }else if(state is StatisticSuccess){
                        return successView(state.items);
                      }
                        return Container();
                    },
                  ))
    );
  }
  Widget successView(List<StatisticInfo> items)=> ListView(
          children: [
            Gap(ScreenSize.h15),
            Statistic(),
            Gap(ScreenSize.h10),
            ListView.builder(
             itemCount: items.length,
             padding: EdgeInsets.only(bottom: 80.h),
             physics: const NeverScrollableScrollPhysics(),
             shrinkWrap: true,
             itemBuilder: (context, index) =>items[index].items.isEmpty
                    ? Container()
                    : DayInfo(info: items[index]))
          ],
      );
}
