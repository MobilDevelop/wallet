
List<Test> testFromMap(List list)=>List<Test>.from(list.map((json) => Test.fromJson(json)));

class Test{
  int id;
  String name;
  List<Test> children;

  Test({required this.id,required this.name,required this.children});

  factory Test.fromJson(Map<String,dynamic> json)=>Test(
    id: json['id']??"", 
    name: json['title']??"", 
    children: testFromMap(json['children']??[]));
}