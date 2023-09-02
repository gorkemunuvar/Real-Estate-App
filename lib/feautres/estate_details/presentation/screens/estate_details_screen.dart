import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../common/common.dart';

import '../../../../core/injection/injection.dart';
import '../widgets/widgets.dart';
import 'cubit/estate_details_cubit.dart';

class EstateDetailsScreen extends StatelessWidget {
  const EstateDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => getIt<EstateDetailsCubit>()..init(),
        child: const _View(),
      ),
    );
  }
}

class _View extends StatelessWidget {
  const _View();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EstateDetailsCubit, EstateDetailsState>(
      builder: (context, state) {
        final status = state.status;
        final showLoading = status.isInitial || status.isLoading;

        if (showLoading) {
          return const LoadingWidget();
        } else if (status.isSuccess) {
          return const _DetailsView();
        }

        return const FailedWidget();
      },
    );
  }
}

class _DetailsView extends StatelessWidget {
  const _DetailsView();

  static const _space = 32.0;

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImagesSection(),
          SizedBox(height: _space),
          MainDetailsSection(),
          SizedBox(height: _space),
          DescriptionSection(),
          SizedBox(height: _space),
          FeaturesSection(),
          SizedBox(height: _space),
          LocationSection(),
          SizedBox(height: _space),
        ],
      ),
    );
  }
}
