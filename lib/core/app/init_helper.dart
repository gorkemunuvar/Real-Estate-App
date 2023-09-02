import 'package:flutter/material.dart';
import 'package:real_estate_app/core/injection/injection.dart';
import 'package:real_estate_app/core/logger/logger.dart';

Future<void> initDependencies() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppLogger.init();
  configureDependencies();
}
