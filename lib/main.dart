import 'package:flutter/material.dart';

import 'core/app/app.dart';
import 'core/app/init_helper.dart';

void main() async {
  await initDependencies();
  runApp(const FundaApp());
}
