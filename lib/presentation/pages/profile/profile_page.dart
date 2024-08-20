import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallet_app/application/profile/profile_cubit.dart';
import 'package:wallet_app/application/profile/profile_state.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => ProfileCubit(),
     child: BlocListener<ProfileCubit,ProfileState>(listener: (_, state) {
       
     },
      child: Builder(builder: (_) {
        ProfileCubit cubit = _.read<ProfileCubit>();

        return BlocBuilder<ProfileCubit,ProfileState>(builder: (_, state) => Scaffold(
          body: Center(
            child: Text("Profile Page"),
          ),
        ));
      },),
     ),
    );
  }
}