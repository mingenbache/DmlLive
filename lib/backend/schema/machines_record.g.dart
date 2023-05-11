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
  Iterable<Object?> serialize(Serializers serializers, MachinesRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
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
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  MachinesRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MachinesRecordBuilder();

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
        case 'metadata':
          result.metadata = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$MachinesRecord extends MachinesRecord {
  @override
  final String? name;
  @override
  final String? metadata;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$MachinesRecord([void Function(MachinesRecordBuilder)? updates]) =>
      (new MachinesRecordBuilder()..update(updates))._build();

  _$MachinesRecord._({this.name, this.metadata, this.ffRef}) : super._();

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
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, metadata.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MachinesRecord')
          ..add('name', name)
          ..add('metadata', metadata)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class MachinesRecordBuilder
    implements Builder<MachinesRecord, MachinesRecordBuilder> {
  _$MachinesRecord? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _metadata;
  String? get metadata => _$this._metadata;
  set metadata(String? metadata) => _$this._metadata = metadata;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  MachinesRecordBuilder() {
    MachinesRecord._initializeBuilder(this);
  }

  MachinesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _metadata = $v.metadata;
      _ffRef = $v.ffRef;
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
  void update(void Function(MachinesRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MachinesRecord build() => _build();

  _$MachinesRecord _build() {
    final _$result = _$v ??
        new _$MachinesRecord._(name: name, metadata: metadata, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
