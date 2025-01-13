abstract class HomeState{}

class HomeInitial extends HomeState{}

class HomeLoadingState extends HomeState{}

class HomeSuccessState extends HomeState{
  final int allIncome;
  final int allOutput;

  HomeSuccessState({required this.allIncome, required this.allOutput});
}