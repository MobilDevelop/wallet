import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:wallet_app/domain/common/constants.dart';
import 'package:wallet_app/infrastructure/models/login/user_check.dart';

class LoginService{
  FirebaseFirestore firestore = FirebaseFirestore.instance;



 Future getUsers()async{
  try {
    QuerySnapshot response = await firestore.collection(AppConstants.mainName).get();
    
    return Future.value(response.docs);
  } catch (e) {
    return Future.value([]);
  }
 }

 Future<UserCheck> checkUserExists() async {
  User? user = FirebaseAuth.instance.currentUser;

  if (user != null) {
    final docRef = FirebaseFirestore.instance.collection(AppConstants.mainName).doc(user.uid);

    try {
      DocumentSnapshot doc = await docRef.get();
      if (doc.exists) {
        return UserCheck(uuid: user.uid, message: "Foydalanuvchi Firestore’da mavjud", check: true);
      } else {
        return UserCheck(uuid: "", message: "Foydalanuvchi tizimga kirmagan", check: false);
        }
    } catch (e) {
      return UserCheck(uuid: "", message: "Foydalanuvchi tizimga kirmagan", check: false);
    }
  } else {
    return UserCheck(uuid: "", message: "Foydalanuvchi tizimga kirmagan", check: false);
  }
}

Future<bool> loginWithEmailPassword(String email, String password) async {
  try {
    // Firebase Authentication orqali foydalanuvchini tizimga kiriting
    UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email,password: password);

    // Agar muvaffaqiyatli bo'lsa, foydalanuvchi tizimga kirgan deb hisoblanadi
    print("Tizimga kirish muvaffaqiyatli!");
    return true;
  } catch (e) {
    // Agar xatolik yuzaga kelsa (masalan, email yoki parol noto'g'ri)
    print("Xatolik: ${e.toString()}");
    return false;
  }
}


}