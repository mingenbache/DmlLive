// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'special_test_type_struct.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SpecialTestTypeStruct> _$specialTestTypeStructSerializer =
    new _$SpecialTestTypeStructSerializer();

class _$SpecialTestTypeStructSerializer
    implements StructuredSerializer<SpecialTestTypeStruct> {
  @override
  final Iterable<Type> types = const [
    SpecialTestTypeStruct,
    _$SpecialTestTypeStruct
  ];
  @override
  final String wireName = 'SpecialTestTypeStruct';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, SpecialTestTypeStruct object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'firestoreUtilData',
      serializers.serialize(object.firestoreUtilData,
          specifiedType: const FullType(FirestoreUtilData)),
    ];
    Object? value;
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  SpecialTestTypeStruct deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SpecialTestTypeStructBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'firestoreUtilData':
          result.firestoreUtilData = serializers.deserialize(value,
                  specifiedType: const FullType(FirestoreUtilData))!
              as FirestoreUtilData;
          break;
      }
    }

    return result.build();
  }
}

class _$SpecialTestTypeStruct extends SpecialTestTypeStruct {
  @override
  final String? name;
  @override
  final String? description;
  @override
  final FirestoreUtilData firestoreUtilData;

  factory _$SpecialTestTypeStruct(
          [void Function(SpecialTestTypeStructBuilder)? updates]) =>
      (new SpecialTestTypeStructBuilder()..update(updates))._build();

  _$SpecialTestTypeStruct._(
      {this.name, this.description, required this.firestoreUtilData})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        firestoreUtilData, r'SpecialTestTypeStruct', 'firestoreUtilData');
  }

  @override
  SpecialTestTypeStruct rebuild(
          void Function(SpecialTestTypeStructBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SpecialTestTypeStructBuilder toBuilder() =>
      new SpecialTestTypeStructBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SpecialTestTypeStruct &&
        name == other.name &&
        description == other.description &&
        firestoreUtilData == other.firestoreUtilData;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, name.hashCode), description.hashCode),
        firestoreUtilData.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SpecialTestTypeStruct')
          ..add('name', name)
          ..add('description', description)
          ..add('firestoreUtilData', firestoreUtilData))
        .toString();
  }
}

class SpecialTestTypeStructBuilder
    implements Builder<SpecialTestTypeStruct, SpecialTestTypeStructBuilder> {
  _$SpecialTestTypeStruct? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  FirestoreUtilData? _firestoreUtilData;
  FirestoreUtilData? get firestoreUtilData => _$this._firestoreUtilData;
  set firestoreUtilData(FirestoreUtilData? firestoreUtilData) =>
      _$this._firestoreUtilData = firestoreUtilData;

  SpecialTestTypeStructBuilder() {
    SpecialTestTypeStruct._initializeBuilder(this);
  }

  SpecialTestTypeStructBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _description = $v.description;
      _firestoreUtilData = $v.firestoreUtilData;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SpecialTestTypeStruct other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SpecialTestTypeStruct;
  }

  @override
  void update(void Function(SpecialTestTypeStructBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SpecialTestTypeStruct build() => _build();

  _$SpecialTestTypeStruct _build() {
    final _$result = _$v ??
        new _$SpecialTestTypeStruct._(
            name: name,
            description: description,
            firestoreUtilData: BuiltValueNullFieldError.checkNotNull(
                firestoreUtilData,
                r'SpecialTestTypeStruct',
                'firestoreUtilData'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
