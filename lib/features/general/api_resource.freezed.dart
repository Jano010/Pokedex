// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'api_resource.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ApiResource _$ApiResourceFromJson(Map<String, dynamic> json) {
  return _ApiResource.fromJson(json);
}

/// @nodoc
class _$ApiResourceTearOff {
  const _$ApiResourceTearOff();

  _ApiResource call({required String name, required String url}) {
    return _ApiResource(
      name: name,
      url: url,
    );
  }

  ApiResource fromJson(Map<String, Object?> json) {
    return ApiResource.fromJson(json);
  }
}

/// @nodoc
const $ApiResource = _$ApiResourceTearOff();

/// @nodoc
mixin _$ApiResource {
  String get name => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ApiResourceCopyWith<ApiResource> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiResourceCopyWith<$Res> {
  factory $ApiResourceCopyWith(
          ApiResource value, $Res Function(ApiResource) then) =
      _$ApiResourceCopyWithImpl<$Res>;
  $Res call({String name, String url});
}

/// @nodoc
class _$ApiResourceCopyWithImpl<$Res> implements $ApiResourceCopyWith<$Res> {
  _$ApiResourceCopyWithImpl(this._value, this._then);

  final ApiResource _value;
  // ignore: unused_field
  final $Res Function(ApiResource) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? url = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$ApiResourceCopyWith<$Res>
    implements $ApiResourceCopyWith<$Res> {
  factory _$ApiResourceCopyWith(
          _ApiResource value, $Res Function(_ApiResource) then) =
      __$ApiResourceCopyWithImpl<$Res>;
  @override
  $Res call({String name, String url});
}

/// @nodoc
class __$ApiResourceCopyWithImpl<$Res> extends _$ApiResourceCopyWithImpl<$Res>
    implements _$ApiResourceCopyWith<$Res> {
  __$ApiResourceCopyWithImpl(
      _ApiResource _value, $Res Function(_ApiResource) _then)
      : super(_value, (v) => _then(v as _ApiResource));

  @override
  _ApiResource get _value => super._value as _ApiResource;

  @override
  $Res call({
    Object? name = freezed,
    Object? url = freezed,
  }) {
    return _then(_ApiResource(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ApiResource implements _ApiResource {
  const _$_ApiResource({required this.name, required this.url});

  factory _$_ApiResource.fromJson(Map<String, dynamic> json) =>
      _$$_ApiResourceFromJson(json);

  @override
  final String name;
  @override
  final String url;

  @override
  String toString() {
    return 'ApiResource(name: $name, url: $url)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ApiResource &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.url, url) || other.url == url));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, url);

  @JsonKey(ignore: true)
  @override
  _$ApiResourceCopyWith<_ApiResource> get copyWith =>
      __$ApiResourceCopyWithImpl<_ApiResource>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ApiResourceToJson(this);
  }
}

abstract class _ApiResource implements ApiResource {
  const factory _ApiResource({required String name, required String url}) =
      _$_ApiResource;

  factory _ApiResource.fromJson(Map<String, dynamic> json) =
      _$_ApiResource.fromJson;

  @override
  String get name;
  @override
  String get url;
  @override
  @JsonKey(ignore: true)
  _$ApiResourceCopyWith<_ApiResource> get copyWith =>
      throw _privateConstructorUsedError;
}
