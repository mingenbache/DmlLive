// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'machines_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<MachinesRecord> _$machinesRecordSerializer =
    new _$MachinesRecordSerializer();

class _$MachinesRecordSerializer
    implements StructuredSerializer<MachinesRecord> {
  @override
  final Iterable<Type> types = const [MachinesRecord, _$MachinesRecord];
  @override
  final String wireName = 'MachinesRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, MachinesRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.metadata;
    if (value != null) {
      result
        ..add('metadata')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.reference;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    return result;
  }

  @override
  MachinesRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MachinesRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'metadata':
          result.metadata = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'Document__Reference__Field':
          result.reference = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
      }
    }

    return result.build();
  }
}

class _$MachinesRecord extends MachinesRecord {
  @override
  final String name;
  @override
  final String metadata;
  @override
  final DocumentReference<Object> reference;

  factory _$MachinesRecord([void Function(MachinesRecordBuilder) updates]) =>
      (new MachinesRecordBuilder()..update(updates)).build();

  _$MachinesRecord._({this.name, this.metadata, this.reference}) : super._();

  @override
  MachinesRecord rebuild(void Function(MachinesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MachinesRecordBuilder toBuilder() =>
      new MachinesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MachinesRecord &&
        name == other.name &&
        metadata == other.metadata &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, name.hashCode), metadata.hashCode), reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('MachinesRecord')
          ..add('name', name)
          ..add('metadata', metadata)
          ..add('reference', reference))
        .toString();
  }
}

class MachinesRecordBuilder
    implements Builder<MachinesRecord, MachinesRecordBuilder> {
  _$MachinesRecord _$v;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _metadata;
  String get metadata => _$this._metadata;
  set metadata(String metadata) => _$this._metadata = metadata;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  MachinesRecordBuilder() {
    MachinesRecord._initializeBuilder(this);
  }

  MachinesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _metadata = $v.metadata;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MachinesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MachinesRecord;
  }

  @override
  void update(void Function(MachinesRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$MachinesRecord build() {
    final _$result = _$v ??
        new _$MachinesRecord._(
            name: name, metadata: metadata, reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
