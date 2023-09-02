import 'package:flutter/material.dart';
import 'package:real_estate_app/feautres/estate_details/estate_details.dart';

class FundaApp extends StatelessWidget {
  const FundaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: EstateDetailsScreen(),
    );
  }
}
