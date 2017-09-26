import 'dart:async';

import 'package:analyzer/dart/element/element.dart';
import 'package:barback/barback.dart';
import 'package:code_transformers/resolver.dart';

class ReflectionRemover extends Transformer with ResolverTransformer {
  @override
  void applyResolver(Transform transform, Resolver resolver) {
    var types = _expandCompilationUnitsWhereShouldBeMapped(resolver, (compilationUnit) => compilationUnit.types)
        .where((type) => !type.isAbstract)
        .where((type) =>
            type.unnamedConstructor != null && type.unnamedConstructor.parameters.any((p) => p.metadata.any(isRouteParam)));
  }

  bool isRouteParam(ElementAnnotation annotation) {
    if (annotation.element is ConstructorElement) {
      return annotation.element.enclosingElement.displayName == "RouteParam";
    }
    return false;
  }

  List<ClassElement> _expandCompilationUnitsWhereShouldBeMapped(
      Resolver resolver, Iterable<ClassElement> expand(CompilationUnitElement unit)) {
    return resolver.libraries.expand((lib) => lib.units).expand((compilationUnit) => expand(compilationUnit)).toList();
  }
}
