import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallet_app/application/home/home_state.dart';

class HomeCubit extends Cubit<HomeState>{
  HomeCubit():super(HomeInitial());
}