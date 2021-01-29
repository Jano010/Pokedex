import 'dart:convert';

class ApiResource {
  final String name;
  final String url;

  ApiResource({
    this.name,
    this.url,
  });

  factory ApiResource.fromJson(String source) =>
      ApiResource.fromMap(json.decode(source));

  factory ApiResource.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return ApiResource(
      name: map['name'],
      url: map['url'],
    );
  }

  @override
  String toString() => 'ApiResource(name: $name, url: $url)';

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'url': url,
    };
  }
}

class ApiResourceList {
  final int count;
  final String next;
  final String previous;
  final List<ApiResource> results;

  ApiResourceList({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  factory ApiResourceList.fromJson(String source) =>
      ApiResourceList.fromMap(json.decode(source));

  factory ApiResourceList.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return ApiResourceList(
      count: map['count'],
      next: map['next'],
      previous: map['previous'],
      results: List<ApiResource>.from(
          map['results']?.map((x) => ApiResource.fromMap(x))),
    );
  }

  @override
  String toString() {
    return 'ApiResourceList(count: $count, next: $next, previous: $previous, results: $results)';
  }

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() {
    return {
      'count': count,
      'next': next,
      'previous': previous,
      'results': results?.map((x) => x?.toMap())?.toList(),
    };
  }
}
