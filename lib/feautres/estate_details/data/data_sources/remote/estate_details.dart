import 'package:injectable/injectable.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../common/common.dart';
import '../../../estate_details.dart';

abstract interface class IEstateDetailsRemoteDataSource {
  Future<EstateDetailsModel> getEstateDetails();
}

@Injectable(as: IEstateDetailsRemoteDataSource)
class EstateDetailsRemoteDataSource implements IEstateDetailsRemoteDataSource {
  const EstateDetailsRemoteDataSource(this._httpClient);

  final IHttpClient _httpClient;

  @override
  Future<EstateDetailsModel> getEstateDetails() async {
    final estateId = await getRandomEstateId();
    final url = '${ApiConstants.baseUrl}/feeds/Aanbod.svc/json/detail/${ApiSecrets.apiKey}/koop/$estateId/';

    final json = await _httpClient.get(url);
    return EstateDetailsModel.fromJson(json);
  }

  Future<String> getRandomEstateId() async {
    const city = 'amsterdam';
    const url = '${ApiConstants.baseUrl}/feeds/Aanbod.svc/json/${ApiSecrets.apiKey}/?type=koop&zo=/$city';

    final json = await _httpClient.get(url);
    final estates = json['Objects'] as List;

    estates.shuffle();
    final randomEstateId = estates.first['Id'] as String;

    return randomEstateId;
  }
}
