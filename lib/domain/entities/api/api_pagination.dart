import 'package:equatable/equatable.dart';
import 'package:pokedex/domain/entities/api/api_resource.dart';

class ApiPagination extends Equatable {
  final int count;
  final String? next;
  final String? previous;
  final List<ApiResource> results;

  ApiPagination(
      {required this.count,
      required this.next,
      required this.previous,
      required this.results});

  @override
  List<Object?> get props => [count, next, previous, results];

  @override
  bool get stringify => true;
}
