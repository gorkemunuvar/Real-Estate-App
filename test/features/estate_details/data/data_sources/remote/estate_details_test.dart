import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:real_estate_app/feautres/estate_details/estate_details.dart';

class MockEstateDetailsRemoteDataSource extends Mock implements EstateDetailsRemoteDataSource {}

void main() {
  late MockEstateDetailsRemoteDataSource remoteDataSource;

  setUp(() {
    remoteDataSource = MockEstateDetailsRemoteDataSource();
  });
  group('getEstateDetails', () {
    test('returns estate details from remote data source', () async {
      //arrange
      when(() => remoteDataSource.getEstateDetails()).thenAnswer(
        (_) async => mockEstateDetailsModel,
      );

      //act
      final result = await remoteDataSource.getEstateDetails();

      //assert
      expect(result, equals(mockEstateDetailsModel));
    });

    test('throws an error when something unexpected occurs', () async {
      //arrange
      when(() => remoteDataSource.getEstateDetails()).thenThrow(Exception());

      //act - assert
      expect(() => remoteDataSource.getEstateDetails(), throwsException);
    });
  });

  group('getRandomEstateId', () {
    test('returns a random estate id', () async {
      //arrange
      when(() => remoteDataSource.getRandomEstateId()).thenAnswer(
        (_) async => 'id',
      );

      //act
      final result = await remoteDataSource.getRandomEstateId();

      //assert
      expect(result, equals('id'));
    });

    test('throws an error when something unexpected occurs', () async {
      //arrange
      when(() => remoteDataSource.getRandomEstateId()).thenThrow(Exception());

      //act - assert
      expect(() => remoteDataSource.getRandomEstateId(), throwsException);
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
