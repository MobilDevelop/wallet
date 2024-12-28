import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:wallet_app/domain/common/constants.dart';
import 'package:wallet_app/infrastructure/models/expenses/category.dart';
import 'package:wallet_app/infrastructure/models/expenses/expenses_info.dart';

class MainService{
 
 FirebaseFirestore firestore = FirebaseFirestore.instance;



 Future<List<ExpensesInfo>> getPricesInfo(String title)async{
  try {
    QuerySnapshot response = await firestore.collection(AppConstants.mainName).doc(title).collection(AppConstants.keyW).get();
    
    return Future.value(expensesFromMap(response.docs));
  } catch (e) {
    return Future.value([]);
  }
 }

 Future<List<ExpensesCategory>> getCategories(String title)async{
  try {
    QuerySnapshot response = await firestore.collection(AppConstants.mainName).doc(title).collection(AppConstants.keyK).get();

    return Future.value(categoryFromMap(response.docs));
  } catch (e) {
    return Future.value([]);
  }
 }

 Future<String> addPrice({required String title,required int id,required Map<String,dynamic> param})async{
  try {
    await firestore.collection(AppConstants.mainName).doc(title).collection(AppConstants.keyW).doc(id.toString()).set(param);
    return Future.value("Ma'lumot saqlandi");
  } catch (e) {
    EasyLoading.showInfo("Xatolik yuz berdi");
    return Future.value("");
  }
 }
}