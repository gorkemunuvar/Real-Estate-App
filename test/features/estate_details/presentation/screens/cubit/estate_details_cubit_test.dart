import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:real_estate_app/core/errors/errors.dart';
import 'package:real_estate_app/feautres/estate_details/estate_details.dart';

class MockGetEstateDetailsUseCase extends Mock implements GetEstateDetails {}

void main() {
  late MockGetEstateDetailsUseCase usecase;
  late EstateDetailsCubit cubit;

  setUp(() {
    usecase = MockGetEstateDetailsUseCase();
    cubit = EstateDetailsCubit(usecase);
  });

  test('initial state is as expected', () {
    expect(cubit.state, equals(const EstateDetailsState()));
  });

  blocTest<EstateDetailsCubit, EstateDetailsState>(
    'fethEstateDetails() emits [loading, failure] when usecase returns Left',
    build: () => cubit,
    setUp: () => when(() => usecase()).thenAnswer((_) async => const Left(Failure())),
    act: (_) => cubit.fethEstateDetails(),
    expect: () => [
      const EstateDetailsState(status: EstateDetailsStatus.loading),
      const EstateDetailsState(status: EstateDetailsStatus.failure),
    ],
  );

  blocTest<EstateDetailsCubit, EstateDetailsState>(
    'fethEstateDetails() emits [loading, success] when usecase returns Right',
    build: () => cubit,
    setUp: () => when(() => usecase()).thenAnswer((_) async => const Right(mockEstateDetails)),
    act: (_) => cubit.fethEstateDetails(),
    expect: () => [
      const EstateDetailsState(status: EstateDetailsStatus.loading),
      const EstateDetailsState(status: EstateDetailsStatus.success, details: mockEstateDetails),
    ],
  );
}

const mockEstateDetails = EstateDetails(
  id: 'id',
  address: 'address',
  place: 'place',
  postcode: 'postcode',
  residentalArea: 123213,
  parcelArea: 123123,
  price: 123213.123,
  description: 'description',
  latitude: 12321.123,
  longitude: 12321.213,
  imageUrls: ['url1', 'url2'],
);
