import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:pokedex/core/errors/failures.dart';
import 'package:pokedex/core/utils/input_converter.dart';

void main() {
  late InputConverter converter;

  setUp(() {
    // Arrange
    converter = InputConverter();
  });

  group("InputConverter: ", () {
    test(
        "When trying to convert a stringt to a int with valid numbers then return a valid int",
        () {
      // Act
      final result = converter.stringToInt("123");

      // Assert
      expect(result, right(123));
    });

    test(
        "When trying to convert a string to a int with invalid nombers then return a input failure",
        () {
      // Act
      final result = converter.stringToInt("str");

      // Assert
      expect(result, left(InputFailure()));
    });
  });
}
