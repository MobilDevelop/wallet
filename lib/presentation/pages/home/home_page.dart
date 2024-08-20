import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallet_app/application/home/home_cubit.dart';
import 'package:wallet_app/application/home/home_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => HomeCubit(),
    child: BlocListener<HomeCubit,HomeState>(listener: (_, state) {
      
    },
    child: Builder(builder: (_) {
      HomeCubit cubit = _.read<HomeCubit>();
      
      return BlocBuilder<HomeCubit,HomeState>(builder: (_, state) => Scaffold(
        body: Center(
          child: Text("Home page"),
        ),
      ));
    },),
    ),
    );
  }
}