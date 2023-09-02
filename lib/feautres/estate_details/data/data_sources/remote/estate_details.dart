import 'package:injectable/injectable.dart';

import '../../../estate_details.dart';

abstract interface class IEstateDetailsRemoteDataSource {
  Future<EstateDetailsModel> getEstateDetails();
}

@Injectable(as: IEstateDetailsRemoteDataSource)
class EstateDetailsDataSource implements IEstateDetailsRemoteDataSource {
  @override
  Future<EstateDetailsModel> getEstateDetails() async {
    return EstateDetailsModel();
  }
}
