import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/data/models/api/api_resource_model.dart';
import 'package:pokedex/domain/entities/api/api_resource.dart';
import 'dart:convert';
import '../../../fixtures/fixture_reader.dart';

void main() {
  late ApiResourceModel tApiResoucerModel;

  setUp(() {
    tApiResoucerModel = ApiResourceModel(name: "name", url: "url");
  });

  group("Json: ", () {
    test("Given a Json file Then return a valid Api REsource model", () {
      final String jsonString = fixture("api_resource.json");

      final result = ApiResourceModel.fromJson(jsonString);

      expect(result, tApiResoucerModel);
    });

    test("Given a Map of ApiResource parameters Then return a json", () {
      final jsonMap = {
        'name': 'name',
        'url': 'url',
      };
      final expectedJson = json.encode(jsonMap);

      final result = tApiResoucerModel.toJson();

      expect(result, expectedJson);
    });

    test(
        "Given a Api Resource model then it should be a subclass of Api Resource",
        () async {
      expect(tApiResoucerModel, isA<ApiResource>());
    });
  });
}
