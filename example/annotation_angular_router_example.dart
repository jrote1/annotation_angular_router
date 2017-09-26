import 'dart:async';

import 'package:annotation_angular_router/annotation_angular_router.dart';
import 'package:angular/angular.dart';

main() {
  bootstrap(MyComponent, []);
}

@Route("Home")
@Component(selector: "my", template: '{{id}}')
class MyComponent {
  final String id;
  final Router _router;

  MyComponent(@RouteParam("id") this.id, this._router);

  Future onClick() async {
    await _router.navigate(MyComponent, {'id': 1});
  }
}
