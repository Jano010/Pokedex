import 'package:fpdart/fpdart.dart';
import 'package:pokedex/core/errors/failures.dart';

abstract class AuthRepository {
  Future<Either<Failure, void>> logIn();
  Future<Either<Failure, void>> register();
  Future<Either<Failure, void>> logOut();
}
