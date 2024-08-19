import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallet_app/application/registration/registration_state.dart';

class RegistrationCubit extends Cubit<RegistrationState>{
  RegistrationCubit():super(RegistrationInitial());

  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
}