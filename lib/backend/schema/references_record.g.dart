// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'references_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ReferencesRecord> _$referencesRecordSerializer =
    new _$ReferencesRecordSerializer();

class _$ReferencesRecordSerializer
    implements StructuredSerializer<ReferencesRecord> {
  @override
  final Iterable<Type> types = const [ReferencesRecord, _$ReferencesRecord];
  @override
  final String wireName = 'ReferencesRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, ReferencesRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.doctors;
    if (value != null) {
      result
        ..add('doctors')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
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
  ReferencesRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ReferencesRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'doctors':
          result.doctors.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
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

class _$ReferencesRecord extends ReferencesRecord {
  @override
  final BuiltList<DocumentReference<Object?>>? doctors;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$ReferencesRecord(
          [void Function(ReferencesRecordBuilder)? updates]) =>
      (new ReferencesRecordBuilder()..update(updates))._build();

  _$ReferencesRecord._({this.doctors, this.ffRef}) : super._();

  @override
  ReferencesRecord rebuild(void Function(ReferencesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ReferencesRecordBuilder toBuilder() =>
      new ReferencesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ReferencesRecord &&
        doctors == other.doctors &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, doctors.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ReferencesRecord')
          ..add('doctors', doctors)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class ReferencesRecordBuilder
    implements Builder<ReferencesRecord, ReferencesRecordBuilder> {
  _$ReferencesRecord? _$v;

  ListBuilder<DocumentReference<Object?>>? _doctors;
  ListBuilder<DocumentReference<Object?>> get doctors =>
      _$this._doctors ??= new ListBuilder<DocumentReference<Object?>>();
  set doctors(ListBuilder<DocumentReference<Object?>>? doctors) =>
      _$this._doctors = doctors;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  ReferencesRecordBuilder() {
    ReferencesRecord._initializeBuilder(this);
  }

  ReferencesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _doctors = $v.doctors?.toBuilder();
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ReferencesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ReferencesRecord;
  }

  @override
  void update(void Function(ReferencesRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ReferencesRecord build() => _build();

  _$ReferencesRecord _build() {
    _$ReferencesRecord _$result;
    try {
      _$result = _$v ??
          new _$ReferencesRecord._(doctors: _doctors?.build(), ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'doctors';
        _doctors?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ReferencesRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
