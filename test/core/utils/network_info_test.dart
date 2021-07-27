import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pokedex/core/utils/network_info.dart';

import 'network_info_test.mocks.dart';

@GenerateMocks([InternetConnectionChecker])
void main() {
  late Future<bool> tFuture;
  late NetworkInfo networkInfo;
  late MockInternetConnectionChecker mockInternetConnectionChecker;

  setUp(() {
    tFuture = Future.value(true);
    mockInternetConnectionChecker = MockInternetConnectionChecker();
    networkInfo = NetworkInfoImpl(
        internetConnectionChecker: mockInternetConnectionChecker);
  });

  test(
      "Calling has connection on our internet cheker must return a valur in thsi case true",
      () {
    // Arrange
    when(mockInternetConnectionChecker.hasConnection)
        .thenAnswer((realInvocation) => tFuture);

    //Act
    final result = networkInfo.isConnected;

    // Assert
    expect(result, tFuture);
    verify(mockInternetConnectionChecker.hasConnection);
    verifyNoMoreInteractions(mockInternetConnectionChecker);
  });
}
