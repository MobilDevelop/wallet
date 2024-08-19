import 'coordinate.dart';

class Routes implements Coordinate {
  const Routes._({
    required this.name,
    required this.path,
  });

  final String name;
  final String path;

  static const intro = Routes._(
    name: 'intro_page',
    path: '/intro',
  );
  static const main = Routes._(
    name: 'main_page',
    path: '/main',
  );
  static const splash = Routes._(
    name: 'splash_page',
    path: '/splash',
  );
  static const login = Routes._(
    name: 'login_page',
    path: '/login',
  );
  static const registration = Routes._(
    name: 'registration_page',
    path: '/registration',
  );
  static const forget = Routes._(
    name: 'forget_page',
    path: '/forget',
  );


  @override
  String toString() => 'name=$name, path=$path';
}
