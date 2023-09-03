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
  static const _estateId = 'b9b5be58-48d9-4559-9e9b-faa027cdc59d';

  @override
  Future<EstateDetailsModel> getEstateDetails() async {
    const url = '${ApiConstants.baseUrl}/feeds/Aanbod.svc/json/detail/${ApiSecrets.apiKey}/koop/$_estateId/';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode != 200) {
      Exception('Failed to load estate details');
    }

    final decodedJson = jsonDecode(response.body);
    return EstateDetailsModel.fromJson(decodedJson);
  }
}
