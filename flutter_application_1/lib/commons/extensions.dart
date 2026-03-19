import 'package:flutter/material.dart';

extension BuildContextExt on BuildContext {
  void go(String pathName, {Object? arguments}) =>
      Navigator.pushNamed(this, pathName, arguments: arguments);
}
