import 'package:wallet_app/infrastructure/models/expenses/expenses_info.dart';

class StatisticInfo{
  String title;
  int limit;
  int allPrice;
  List<ExpensesInfo> items;

  StatisticInfo({required this.title,required this.limit,required this.allPrice,required this.items});
}