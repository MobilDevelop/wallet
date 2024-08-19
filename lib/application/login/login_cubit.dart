import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallet_app/application/login/login_state.dart';
import 'package:wallet_app/domain/firebase/auth_service.dart';

class LoginCubit extends Cubit<LoginState>{
  LoginCubit():super(LoginInitial());

    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

   bool eyeShow = false;

  void googleAuth()async{
    UserCredential? user = await AuthService().loginWithGoogle();
    emailController.text = user!.user!.email!;
    emit(LoginInitial());
  }

  void eyePress(){
    eyeShow = !eyeShow;
    emit(LoginInitial());
  }
}