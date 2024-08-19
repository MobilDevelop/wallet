import 'package:wallet_app/presentation/pages/forget/forget_page.dart';
import 'package:wallet_app/presentation/pages/intro/intro_page.dart';
import 'package:wallet_app/presentation/pages/login/login_page.dart';
import 'package:wallet_app/presentation/pages/registration/registration_page.dart';

import 'index_routes.dart';
import 'package:flutter/material.dart';


final GoRouter router = GoRouter(
    initialLocation: Routes.intro.path,
    debugLogDiagnostics: true,
    routes: <GoRoute>[
      
      GoRoute(
        name: Routes.login.name,
        path: Routes.login.path,
        pageBuilder: (_, state) => buildPageWithDefaultTransition<void>(
          context: _, 
          state: state, 
         child: const LoginPage(),
        )),

      GoRoute(
        name: Routes.intro.name,
        path: Routes.intro.path,
        pageBuilder: (_, state) => buildPageWithDefaultTransition<void>(
          context: _,
          state: state,
          child:  const IntroPage(),
        ),
      ),

      GoRoute(
        name: Routes.registration.name,
        path: Routes.registration.path,
        pageBuilder: (_, state) => buildPageWithDefaultTransition<void>(
          context: _,
          state: state,
          child:  const RegistrationPage(),
        ),
      ),

      GoRoute(
        name: Routes.forget.name,
        path: Routes.forget.path,
        pageBuilder: (_, state) => buildPageWithDefaultTransition<void>(
          context: _,
          state: state,
          child:  const ForgetPage(),
        ),
      ),

    ],

    
    errorBuilder: (_, state) => const SizedBox());

    CustomTransitionPage buildPageWithDefaultTransition<T>({
  required BuildContext context, 
  required GoRouterState state, 
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) => ScaleTransition(scale: animation, child: child),
  );
}

