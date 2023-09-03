import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/injection/injection.dart';
import '../../../common/common.dart';
import '../../estate_details.dart';
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
          return _DetailsView(state.details!);
        }

        return const FailedWidget();
      },
    );
  }
}

class _DetailsView extends StatelessWidget {
  const _DetailsView(this.estateDetails);

  final EstateDetails estateDetails;

  static const _space = 32.0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImagesSection(estateDetails.imageUrls.first),
            const SizedBox(height: _space),
            MainDetailsSection(estateDetails: estateDetails),
            const SizedBox(height: _space),
            DescriptionSection(estateDetails.description),
            const SizedBox(height: _space),
            LocationSection(
              latitude: estateDetails.latitude,
              longitude: estateDetails.longitude,
            ),
            const SizedBox(height: _space),
          ],
        ),
      ),
    );
  }
}
