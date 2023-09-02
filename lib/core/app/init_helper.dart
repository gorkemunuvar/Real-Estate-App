import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc_observer.dart';
import '../injection/injection.dart';
import '../logger/logger.dart';

Future<void> initDependencies() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppLogger.init();
  configureDependencies();
  //TODO: delete when logging is not needed.
  Bloc.observer = FundaBlocObserver();
}
