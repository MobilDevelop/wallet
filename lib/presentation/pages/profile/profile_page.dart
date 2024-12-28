import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wallet_app/application/profile/profile_cubit.dart';
import 'package:wallet_app/application/profile/profile_state.dart';
import 'package:wallet_app/presentation/assets/theme/app_theme.dart';
import 'package:wallet_app/presentation/pages/profile/components/user_info.dart';

import 'components/setting_info.dart';

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
          backgroundColor: AppTheme.colors.background,
          appBar: AppBar(
                elevation: 0,
                backgroundColor: AppTheme.colors.white,
                centerTitle: true,
                toolbarHeight: 37.h,
                title: Text(tr('Profil'),
                  style: AppTheme.data.textTheme.titleMedium),
              ),
          body: Column(
            children: [
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(0),
                  children: [
                    UserInfo(),
                    Setting()
                  ],
                ),
              )
            ],
          )
        ));
      },),
     ),
    );
  }
}