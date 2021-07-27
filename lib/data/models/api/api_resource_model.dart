import 'dart:convert';

import 'package:pokedex/domain/entities/api/api_resource.dart';

class ApiResourceModel extends ApiResource {
  final String name;
  final String url;
  ApiResourceModel({
    required this.name,
    required this.url,
  }) : super(name: name, url: url);

  ApiResourceModel copyWith({
    String? name,
    String? url,
  }) {
    return ApiResourceModel(
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'url': url,
    };
  }

  factory ApiResourceModel.fromMap(Map<String, dynamic> map) {
    return ApiResourceModel(
      name: map['name'],
      url: map['url'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ApiResourceModel.fromJson(String source) =>
      ApiResourceModel.fromMap(json.decode(source));
}
