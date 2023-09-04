import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:real_estate_app/feautres/estate_details/estate_details.dart';

class MockEstateDetailsRepository extends Mock implements IEstateDetailsRepository {}

void main() {
  late MockEstateDetailsRepository repository;
  late GetEstateDetails usecase;

  setUp(() {
    repository = MockEstateDetailsRepository();
    usecase = GetEstateDetails(repository);
  });

  test('returns EstateDetails from repository', () async {
    //arrange
    when(() => repository.getEstateDetails()).thenAnswer(
      (_) async => const Right(mockEstateDetailsEntity),
    );

    //act
    final result = await usecase();

    //assert
    verify(() => repository.getEstateDetails());
    expect(result, equals(const Right(mockEstateDetailsEntity)));
  });
}

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
