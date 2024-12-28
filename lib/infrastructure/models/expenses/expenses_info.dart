import 'package:wallet_app/infrastructure/models/expenses/category.dart';

List<ExpensesInfo> expensesFromMap(List list)=>List<ExpensesInfo>.from(list.map((json) => ExpensesInfo.fromJson(json.data())));

class ExpensesInfo{
  int id;
  String value;
  String comment;
  String  date;
  String type;
  ExpensesCategory category;

   ExpensesInfo({required this.id,required this.value,required this.date,required this.type,required this.comment,required this.category});

   factory ExpensesInfo.fromJson(Map<String,dynamic> json)=>ExpensesInfo(
    id: json['id']??-1, 
    value: json['value']??"", 
    date: json['date']??"", 
    type: json['type']??"", 
    comment: json['comment']??"",
    category: ExpensesCategory.fromJson(json['category']??{}));

  Map<String,dynamic> toJson()=>{
    'id':id,
    'value':value,
    'date':date,
    'type':type,
    'comment':comment,
    'category':category.toJson()
  };
}