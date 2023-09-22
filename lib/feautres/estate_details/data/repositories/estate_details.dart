import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:real_estate_app/core/logger/logger.dart';

import '../../../../core/errors/errors.dart';
import '../../domain/domain.dart';
import '../data_sources/remote/estate_details.dart';

@Injectable(as: IEstateDetailsRepository)
class EstateDetailsRepository implements IEstateDetailsRepository {
  EstateDetailsRepository(this._remoteSource);

  final IEstateDetailsRemoteDataSource _remoteSource;

  final Map<String, String> _estateIdsCache = {};

  @override
  Future<Either<Failure, EstateDetails>> getEstateDetails() async {
    try {
      final randomEstateId = await _getRandomEstateId();
      final detailsModel = await _remoteSource.getEstateDetails(randomEstateId);
      final details = EstateDetails.fromModel(detailsModel);

      return Right(details);
    } catch (e) {
      AppLogger.error('(EstateDetailsRepository.getEstateDetails)', e);
      return const Left(Failure());
    }
  }

  Future<String> _getRandomEstateId() async {
    if (_estateIdsCache.isEmpty) {
      final estateIds = await _remoteSource.getRandomEstateIds();
      for (final id in estateIds) {
        _estateIdsCache[id] = id;
      }
    }

    final randomIndex = _estateIdsCache.length - 1;
    final randomEstateId = _estateIdsCache.keys.elementAt(randomIndex);
    _estateIdsCache.remove(randomEstateId);

    return randomEstateId;
  }
}
