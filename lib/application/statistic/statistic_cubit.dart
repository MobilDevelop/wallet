import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallet_app/application/statistic/statistic_state.dart';

class StatisticCubit extends Cubit<StatisticState>{
  StatisticCubit():super(StatisticInitial());
}