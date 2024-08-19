import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:wallet_app/application/intro/intro_cubit.dart';
import 'package:wallet_app/application/intro/intro_state.dart';
import 'package:wallet_app/presentation/assets/res/app_icons.dart';
import 'package:wallet_app/presentation/assets/theme/app_theme.dart';
import 'package:wallet_app/presentation/pages/intro/components/slide.dart';
import 'package:wallet_app/presentation/routes/index_routes.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => IntroCubit(),
    child: BlocListener<IntroCubit,IntroState>(listener: (_, state) {
       if(state is IntroNextLogin){
        _.go(Routes.login.path);
       }
    },
    child: Builder(builder: (_) {
      final IntroCubit cubit = _.read<IntroCubit>();
      return BlocBuilder<IntroCubit,IntroState>(builder: (_, state) => Scaffold(
        backgroundColor: AppTheme.colors.background,
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Expanded(
              child: PageView(
                controller: cubit.pageController,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                 Container(
                  color: AppTheme.colors.intro1,
                   child: Column(
                     children: [
                       Expanded(
                         child: Image.asset(AppIcons.image1,fit: BoxFit.fill)),
                        Gap(350.h)
                     ],
                   ),
                 ),
                Container(
                  color: AppTheme.colors.intro2,
                  child: Column(
                     children: [
                      Gap(60.h),
                       Expanded(
                         child: Image.asset(AppIcons.image2,fit: BoxFit.fill)),
                         Gap(360.h)
                     ],
                   ),
                ),
                  Container(
                    color: AppTheme.colors.intro3,
                    child: Column(
                     children: [
                      Gap(50.h),
                       Expanded(
                         child: Image.asset(AppIcons.image3,fit: BoxFit.fill)),
                        Gap(390.h)
                     ],
                   ),
                  ),
                ],
              ),
            ),
            SlidePage(
              index: cubit.currentIndex,
              introColor: cubit.introColor,
              controller: cubit.pageControllerText,
              skip: cubit.skipPress,
              press: cubit.nextIndex)
          ],
        ),
      ));
    },),
    ),
    );
  }
}