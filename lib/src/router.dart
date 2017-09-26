import 'dart:async';

abstract class Router {
  Future navigate(Type component, [Map<String, Object> parameters = const <String, Object>{}]);
  Future navigateByName(String routeName, [Map<String, Object> parameters = const <String, Object>{}]);
}
