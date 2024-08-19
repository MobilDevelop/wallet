import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallet_app/application/forget/forget_state.dart';

class ForgetCubit extends Cubit<ForgetState>{
  ForgetCubit():super(ForgetInitial());

  final emailController = TextEditingController();

  final pass1Controller = TextEditingController();
  final pass2Controller = TextEditingController();

  int chooseView = 1;

  bool eye1 = true;
  bool eye2 = true;

  void setView(int page){
    chooseView = page;
    emit(ForgetInitial());
  }

  void eyeShow(int type){
    if(type==1){
      eye1 = !eye1;
    }else if(type==2){
      eye2 = !eye2;
    }
    emit(ForgetInitial());
  }
}