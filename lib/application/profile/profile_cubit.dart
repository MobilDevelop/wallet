import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallet_app/application/profile/profile_state.dart';

class ProfileCubit extends Cubit<ProfileState>{
  ProfileCubit():super(ProfileInitial());
}