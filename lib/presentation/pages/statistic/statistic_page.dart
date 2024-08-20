import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallet_app/application/statistic/statistic_cubit.dart';
import 'package:wallet_app/application/statistic/statistic_state.dart';

class StatisticPage extends StatelessWidget {
  const StatisticPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => StatisticCubit(),
     child: BlocListener<StatisticCubit,StatisticState>(listener: (_, state) {
       
     },
      child: Builder(builder: (_) {
        StatisticCubit cubit = _.read<StatisticCubit>();

        return BlocBuilder<StatisticCubit,StatisticState>(builder: (_, state) => Scaffold(
          body: Center(
            child: Text("Statistic page"),
          ),
        ));
      },),
     ),
    );
  }
}