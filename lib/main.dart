import 'package:flutter/material.dart';
import 'package:recipes_app/app/app.dart';
import 'package:recipes_app/app/core/utils/injection_container.dart';

void main() async {
  configureDependencies();
  runApp(const MyApp());
}
