import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:real_estate_app/feautres/common/common.dart';

class MockHttpClient extends Mock implements IHttpClient {}

void main() {
  late MockHttpClient httpClient;

  setUp(() {
    httpClient = MockHttpClient();
  });

  group('get', () {
    test('perform a GET request on a URL', () async {
      //arrange
      when(() => httpClient.get(any())).thenAnswer(
        (_) async => {},
      );

      //act
      final result = await httpClient.get('test');

      //assert
      verify(() => httpClient.get('test')).called(1);
      expect(result, equals({}));
    });

    test('throws an error when something unexpected occurs', () async {
      //arrange
      when(() => httpClient.get(any())).thenThrow(Exception());

      //act - assert
      expect(() => httpClient.get('test'), throwsException);
    });
  });
}
