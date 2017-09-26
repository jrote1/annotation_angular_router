import 'package:angular/di.dart';

class Route {
  final String path;

  const Route(this.path);
}

class RouteParam extends Inject {
  const RouteParam(String name) : super(name);
}
