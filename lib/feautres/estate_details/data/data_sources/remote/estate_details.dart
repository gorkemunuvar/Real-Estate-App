import 'package:injectable/injectable.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../common/common.dart';
import '../../../estate_details.dart';

abstract interface class IEstateDetailsRemoteDataSource {
  Future<EstateDetailsModel> getEstateDetails(String estateId);
  Future<List<String>> getRandomEstateIds();
}

@Injectable(as: IEstateDetailsRemoteDataSource)
class EstateDetailsRemoteDataSource implements IEstateDetailsRemoteDataSource {
  const EstateDetailsRemoteDataSource(this._httpClient);

  final IHttpClient _httpClient;

  @override
  Future<EstateDetailsModel> getEstateDetails(String estateId) async {
    final url = '${ApiConstants.baseUrl}/feeds/Aanbod.svc/json/detail/${ApiSecrets.apiKey}/koop/$estateId/';

    final json = await _httpClient.get(url);

    return EstateDetailsModel.fromJson(json);
  }

  @override
  Future<List<String>> getRandomEstateIds() async {
    const city = 'amsterdam';
    const url = '${ApiConstants.baseUrl}/feeds/Aanbod.svc/json/${ApiSecrets.apiKey}/?type=koop&zo=/$city';

    final json = await _httpClient.get(url);

    final estates = json['Objects'] as List;
    final estateIds = estates.map((e) => e['Id'] as String).toList();

    return estateIds;
  }
}
