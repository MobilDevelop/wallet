import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallet_app/application/main/main_state.dart';

class MainCubit extends Cubit<MainState>{
  MainCubit():super(MainInitial());
}