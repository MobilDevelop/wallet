import 'package:wallet_app/infrastructure/models/expenses/category.dart';

abstract class MainEvent{}

class MainBottomEvent extends MainEvent{
  int index;

  MainBottomEvent({required this.index});
}

class MainAddButtonEvent extends MainEvent{
  final bool visible;

  MainAddButtonEvent({required this.visible});
}

class MainAddExpenseEvent extends MainEvent{
  final int type;
  MainAddExpenseEvent({required this.type});
}

class MainKategorySelectEvent extends MainEvent{
  final ExpensesCategory select;
  final List<ExpensesCategory> categorys;
  final int moneyType;

  MainKategorySelectEvent({required this.select, required this.categorys,required this.moneyType});
}

class MainSaveExpensesEvent extends MainEvent{
  final String price;
  final String comment;
  final ExpensesCategory? selected;
  final int id;
  final int type;
  final List<ExpensesCategory> categorys;

  MainSaveExpensesEvent({required this.price, required this.comment, this.selected,required this.id,required this.type,required this.categorys});
}