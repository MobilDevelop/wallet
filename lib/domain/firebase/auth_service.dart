import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService{
  final auth = FirebaseAuth.instance;


  Future<UserCredential?> loginWithGoogle()async{
     try {
       final googleUser = await GoogleSignIn().signIn();

       final googleAuth = await googleUser?.authentication;

       final cred = GoogleAuthProvider.credential(idToken: googleAuth?.  idToken,accessToken: googleAuth?.accessToken);

       return await auth.signInWithCredential(cred);  
     } catch (e) {
       print(e);
     }
     return null;  
  }

  
  Future<User?>  createUserWithEmailAndPassword(String email,String password)async{
    try {
      final cred = await auth.createUserWithEmailAndPassword(email: email, password: password);

      return cred.user;
    } on FirebaseAuthException catch (e) {
      print(e.code);
    } catch(e){
      print(e);
    }
    return null;
  }

  Future<void> signOut()async{
    try {
      await auth.signOut();
    } catch (e) {
      print(e);
    }
  }

}