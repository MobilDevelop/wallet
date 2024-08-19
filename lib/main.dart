import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wallet_app/application/app_manager/app_manager_cubit.dart';
import 'infrastructure/common/app_init.dart';
import 'presentation/pages/manager/app_widget.dart';
Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  await runZonedGuarded<Future<void>>(() async {
  await initializeApp();

    runApp( 
      EasyLocalization(
        supportedLocales: const [Locale('uz'),Locale('ru')],
        useFallbackTranslations: true,
        useOnlyLangCode: true,
        fallbackLocale: const Locale('uz'),
        path: 'assets/translations',
        child: const MyApp(),
      ),
    );
  }, (error, stack) {});
} 

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>{
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  @override 
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<AppManagerCubit>(create: (context) => AppManagerCubit()..init()),
             ], 
        child: ScreenUtilInit(
          minTextAdapt: true,
          useInheritedMediaQuery: true,
          splitScreenMode: true,
          builder: (context, child) => const AppWidget(),
      ),
    );
  }
}