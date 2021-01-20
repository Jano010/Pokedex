import 'dart:convert';

class BaseApiListItem {
  final String name;
  final String url;

  BaseApiListItem({this.name, this.url});

  factory BaseApiListItem.fromJson(Map<String, dynamic> json) =>
      BaseApiListItem(name: json['name'], url: json['url']);

  Map<String, dynamic> toJson() => {'name': name, 'url': url};
}

class BaseApiList {
  final int count;
  final String next;
  final String previous;
  List<BaseApiListItem> results;

  BaseApiList({this.count, this.next, this.previous, this.results});

  factory BaseApiList.fromRawJson(String str) =>
      BaseApiList.fromJson(json.decode(str));

  factory BaseApiList.fromJson(Map<String, dynamic> json) => BaseApiList(
      count: json['count'],
      next: json['next'],
      previous: json['previous'],
      results: List<BaseApiListItem>.from(
          json['results'].map((x) => BaseApiListItem.fromJson(x))));

  Map<String, dynamic> toJson() => {
        'count': count,
        'next': next,
        'previous': previous,
        'results': List<BaseApiListItem>.from(results.map((x) => x.toJson()))
      };
}
