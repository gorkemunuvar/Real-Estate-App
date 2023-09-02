import 'package:dartz/dartz.dart';

import '../../../../core/errors/errors.dart';
import '../entities/entities.dart';

abstract interface class IEstateDetailsRepository {
  Future<Either<Failure, EstateDetails>> getEstateDetails();
}
