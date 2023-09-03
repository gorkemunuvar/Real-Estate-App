// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../feautres/common/utils/http_client.dart' as _i3;
import '../../feautres/estate_details/data/data_sources/remote/estate_details.dart'
    as _i4;
import '../../feautres/estate_details/data/repositories/estate_details.dart'
    as _i6;
import '../../feautres/estate_details/domain/domain.dart' as _i5;
import '../../feautres/estate_details/domain/repositories/estate_details.dart'
    as _i8;
import '../../feautres/estate_details/domain/usecases/get_estate_details.dart'
    as _i7;
import '../../feautres/estate_details/presentation/screens/cubit/estate_details_cubit.dart'
    as _i9;

// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.factory<_i3.IHttpClient>(() => _i3.HttpClient());
  gh.factory<_i4.IEstateDetailsRemoteDataSource>(
      () => _i4.EstateDetailsRemoteDataSource(gh<_i3.IHttpClient>()));
  gh.factory<_i5.IEstateDetailsRepository>(() =>
      _i6.EstateDetailsRepository(gh<_i4.IEstateDetailsRemoteDataSource>()));
  gh.factory<_i7.GetEstateDetails>(
      () => _i7.GetEstateDetails(gh<_i8.IEstateDetailsRepository>()));
  gh.factory<_i9.EstateDetailsCubit>(
      () => _i9.EstateDetailsCubit(gh<_i5.GetEstateDetails>()));
  return getIt;
}
