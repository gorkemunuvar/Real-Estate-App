import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc_observer.dart';
import '../injection/injection.dart';
import '../logger/logger.dart';

///Initializes all dependencies and configurations.
Future<void> initDependencies() async {
  // Unneccesary in this case since there is no need to make a call to native code.
  WidgetsFlutterBinding.ensureInitialized();

  AppLogger.init();
  configureDependencies();
  Bloc.observer = FundaBlocObserver();
}
