import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../domain/domain.dart';

part 'estate_details_state.dart';

@injectable
class EstateDetailsCubit extends Cubit<EstateDetailsState> {
  EstateDetailsCubit(
    this._getEstateDetails,
  ) : super(const EstateDetailsState());

  final GetEstateDetails _getEstateDetails;

  Future<void> init() async {
    await fethEstateDetails();
  }

  Future<void> fethEstateDetails() async {
    emit(state.copyWith(status: EstateDetailsStatus.loading));

    final failureOrDetails = await _getEstateDetails();
    failureOrDetails.fold(
      (failure) => emit(state.copyWith(status: EstateDetailsStatus.failure)),
      (details) => emit(state.copyWith(status: EstateDetailsStatus.success, details: details)),
    );
  }
}
