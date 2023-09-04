import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:real_estate_app/core/errors/errors.dart';
import 'package:real_estate_app/feautres/estate_details/estate_details.dart';

class MockEstateDetailsEntity extends Mock implements EstateDetails {}

class MockEstateDetailsRemoteDataSource extends Mock implements IEstateDetailsRemoteDataSource {}

void main() {
  late MockEstateDetailsRemoteDataSource remoteSource;
  late IEstateDetailsRepository repository;

  setUp(() {
    remoteSource = MockEstateDetailsRemoteDataSource();
    repository = EstateDetailsRepository(remoteSource);
  });

  group('getEstateDetails', () {
    test('returns Right(entity) when _remoteSource.getEstateDetails() is performed properly', () async {
      //arrange
      when(() => remoteSource.getEstateDetails()).thenAnswer(
        (_) async => mockEstateDetailsModel,
      );

      //act
      final result = await repository.getEstateDetails();

      //assert
      verify(() => remoteSource.getEstateDetails());

      expect(result, equals(const Right(mockEstateDetailsEntity)));
    });

    test('returns Left(Failure()) when there is an exception thrown by remoteSource.getEstateDetails method', () async {
      //arrange
      when(() => remoteSource.getEstateDetails()).thenThrow(Exception());

      //act
      final result = await repository.getEstateDetails();

      //assert
      verify(() => remoteSource.getEstateDetails());
      expect(result, equals(const Left(Failure())));
    });
  });
}

const mockEstateDetailsModel = EstateDetailsModel(
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

const mockEstateDetailsEntity = EstateDetails(
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
