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

import '../../feautres/estate_details/data/data_sources/remote/estate_details.dart'
    as _i3;
import '../../feautres/estate_details/data/repositories/estate_details.dart'
    as _i5;
import '../../feautres/estate_details/domain/domain.dart' as _i4;
import '../../feautres/estate_details/domain/repositories/estate_details.dart'
    as _i7;
import '../../feautres/estate_details/domain/usecases/get_estate_details.dart'
    as _i6;
import '../../feautres/estate_details/presentation/screens/cubit/estate_details_cubit.dart'
    as _i8;

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
  gh.factory<_i3.IEstateDetailsRemoteDataSource>(
      () => _i3.EstateDetailsRemoteDataSource());
  gh.factory<_i4.IEstateDetailsRepository>(() =>
      _i5.EstateDetailsRepository(gh<_i3.IEstateDetailsRemoteDataSource>()));
  gh.factory<_i6.GetEstateDetails>(
      () => _i6.GetEstateDetails(gh<_i7.IEstateDetailsRepository>()));
  gh.factory<_i8.EstateDetailsCubit>(
      () => _i8.EstateDetailsCubit(gh<_i4.GetEstateDetails>()));
  return getIt;
}
