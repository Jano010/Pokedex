import 'package:fpdart/fpdart.dart';
import 'package:pokedex/core/errors/failures.dart';

class InputConverter {
  static Either<Failure, int> stringToInt(String str) {
    try {
      final parseInt = int.parse(str);
      if (parseInt < 0) throw FormatException();
      return right(parseInt);
    } on FormatException {
      return left(InputFailure());
    }
  }
}
