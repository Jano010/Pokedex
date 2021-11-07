import 'package:json_annotation/json_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_resource.freezed.dart';
part 'api_resource.g.dart';

@freezed
abstract class ApiResource with _$ApiResource {
  const factory ApiResource({required String name, required String url}) =
      _ApiResource;
  factory ApiResource.fromJson(Map<String, dynamic> json) =>
      _$ApiResourceFromJson(json);
}
