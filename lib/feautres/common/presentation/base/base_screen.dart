import 'package:flutter/material.dart';

///Base screen template for all screens in the app.
class BaseScreen extends StatelessWidget {
  const BaseScreen({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: child,
      ),
    );
  }
}
