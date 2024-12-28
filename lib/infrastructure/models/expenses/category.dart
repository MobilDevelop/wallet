List<ExpensesCategory> categoryFromMap(List list)=>List<ExpensesCategory>.from(list.map((json) => ExpensesCategory.fromJson(json.data())));

class ExpensesCategory{
  int id;
  String title;

  ExpensesCategory({required this.id,required this.title});

  factory ExpensesCategory.fromJson(Map<String,dynamic> json)=>ExpensesCategory(
    id: json['id']??-1, 
    title: json['title']??"");

 Map<String,dynamic> toJson()=>{
  'id':id,
  'title':title
 };
}