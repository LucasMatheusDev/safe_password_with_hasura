/// This class holds the names of all routes in the application.
///
/// NOTE : The number of named routes must be equal to the number of PAGES
class NamedRoutes {
  static const String home = '/home';
  static const String login = '/login';
  static const String splashScreen = '/';

  List<String> getRoutesNames() {
    return [
      login,
      home,
      splashScreen,
    ];
  }
}
