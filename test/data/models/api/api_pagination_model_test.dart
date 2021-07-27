import 'package:flutter_test/flutter_test.dart';
import 'dart:convert';
import 'package:pokedex/data/models/api/api_pagination_model.dart';
import 'package:pokedex/data/models/api/api_resource_model.dart';
import 'package:pokedex/domain/entities/api/api_pagination.dart';
import '../../../fixtures/fixture_reader.dart';

void main() {
  late ApiResourceModel tApiResource;
  late ApiPaginationModel tApiPaginationModel;

  setUp(() {
    tApiResource = ApiResourceModel(name: "name", url: "url");
    tApiPaginationModel = ApiPaginationModel(
        count: 1, next: "next", previous: "previous", results: [tApiResource]);
  });

  group("Json: ", () {
    test("Given a Json file Then return a valid Api pagination model", () {
      final String jsonString = fixture("api_pagination.json");

      final result = ApiPaginationModel.fromJson(jsonString);

      expect(result, tApiPaginationModel);
    });

    test('Given a ApiPaginationModel Then the type must be ApiPagination',
        () async {
      expect(tApiPaginationModel, isA<ApiPagination>());
    });
  });
}
