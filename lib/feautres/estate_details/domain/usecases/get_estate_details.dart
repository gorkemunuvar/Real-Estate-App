import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/errors/errors.dart';
import '../entities/entities.dart';
import '../repositories/estate_details.dart';

@injectable
class GetEstateDetails {
  const GetEstateDetails(this._repository);

  final IEstateDetailsRepository _repository;

  Future<Either<Failure, EstateDetails>> call() {
    return _repository.getEstateDetails();
  }
}
