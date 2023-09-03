import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/common.dart';
import '../screens/cubit/estate_details_cubit.dart';

class ShowRandomEstateButton extends StatelessWidget {
  const ShowRandomEstateButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => _onPressed(context),
      child: const Text(
        'Show me a random estate',
        style: TextStyles.main,
      ),
    );
  }

  void _onPressed(BuildContext context) {
    context.read<EstateDetailsCubit>().fethEstateDetails();
  }
}
