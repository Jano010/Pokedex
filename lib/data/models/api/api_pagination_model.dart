import 'dart:convert';
import 'package:pokedex/data/models/api/api_resource_model.dart';
import 'package:pokedex/domain/entities/api/api_pagination.dart';

class ApiPaginationModel extends ApiPagination {
  final int count;
  final String? next;
  final String? previous;
  final List<ApiResourceModel> results;

  ApiPaginationModel({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  }) : super(count: count, next: next, previous: previous, results: results);

  ApiPaginationModel copyWith({
    int? count,
    String? next,
    String? previous,
    List<ApiResourceModel>? results,
  }) {
    return ApiPaginationModel(
      count: count ?? this.count,
      next: next ?? this.next,
      previous: previous ?? this.previous,
      results: results ?? this.results,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'count': count,
      'next': next,
      'previous': previous,
      'results': results.map((x) => x.toMap()).toList(),
    };
  }

  factory ApiPaginationModel.fromMap(Map<String, dynamic> map) {
    return ApiPaginationModel(
      count: map['count'],
      next: map['next'],
      previous: map['previous'],
      results: List<ApiResourceModel>.from(
          map['results']?.map((x) => ApiResourceModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory ApiPaginationModel.fromJson(String source) =>
      ApiPaginationModel.fromMap(json.decode(source));
}
