import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

import '../../../../../core/constants/constants.dart';
import '../../../estate_details.dart';

abstract interface class IEstateDetailsRemoteDataSource {
  Future<EstateDetailsModel> getEstateDetails();
}

@Injectable(as: IEstateDetailsRemoteDataSource)
class EstateDetailsRemoteDataSource implements IEstateDetailsRemoteDataSource {
  @override
  Future<EstateDetailsModel> getEstateDetails() async {
    final estateId = await _getRandomEstateId();
    final url = '${ApiConstants.baseUrl}/feeds/Aanbod.svc/json/detail/${ApiSecrets.apiKey}/koop/$estateId/';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode != 200) {
      Exception('Failed to load estate details.');
    }

    final decodedJson = jsonDecode(response.body);
    return EstateDetailsModel.fromJson(decodedJson);
  }

  Future<String> _getRandomEstateId() async {
    const city = 'amsterdam';
    const url = '${ApiConstants.baseUrl}/feeds/Aanbod.svc/json/${ApiSecrets.apiKey}/?type=koop&zo=/$city';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode != 200) {
      Exception('Failed to call search api.');
    }

    final decodedJson = jsonDecode(response.body);
    final estates = decodedJson['Objects'] as List;

    estates.shuffle();
    final randomEstateId = estates.first['Id'] as String;

    return randomEstateId;
  }
}
