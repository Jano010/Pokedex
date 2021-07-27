import 'package:equatable/equatable.dart';

class ApiResource extends Equatable {
  final String name;
  final String url;

  ApiResource({required this.name, required this.url});

  @override
  List<Object?> get props => [name, url];

  @override
  bool get stringify => true;
}
