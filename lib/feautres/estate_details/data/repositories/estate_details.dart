import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:real_estate_app/core/logger/logger.dart';

import '../../../../core/errors/errors.dart';
import '../../domain/domain.dart';
import '../data_sources/remote/estate_details.dart';

@Injectable(as: IEstateDetailsRepository)
class EstateDetailsRepository implements IEstateDetailsRepository {
  const EstateDetailsRepository(this._remoteSource);

  final IEstateDetailsRemoteDataSource _remoteSource;

  @override
  Future<Either<Failure, EstateDetails>> getEstateDetails() async {
    try {
      final detailsModel = await _remoteSource.getEstateDetails();
      final details = EstateDetails.fromModel(detailsModel);
      return Right(details);
    } catch (e) {
      AppLogger.error('(EstateDetailsRepository.getEstateDetails)', e);
      return const Left(Failure());
    }
  }
}
