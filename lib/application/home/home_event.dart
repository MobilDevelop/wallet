abstract class HomeEvent{}

class HomeGetInfoEvent extends HomeEvent{
  String name;

  HomeGetInfoEvent({required this.name});
}