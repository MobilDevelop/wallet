import 'package:wallet_app/infrastructure/models/statistic/statistic_info.dart';

abstract class StatisticState{}

class StatisticInitial extends StatisticState{}

class StatisticLoading extends StatisticState{}

class StatisticSuccess extends StatisticState{
  List<StatisticInfo> items;

  // String startDate = "";
  // String endDate = "";

  StatisticSuccess({required this.items});

}