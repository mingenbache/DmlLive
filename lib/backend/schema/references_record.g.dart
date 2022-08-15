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
  Iterable<Object> serialize(Serializers serializers, ReferencesRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.doctors;
    if (value != null) {
      result
        ..add('doctors')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(DocumentReference, const [const FullType(Object)])
            ])));
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
  ReferencesRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ReferencesRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'doctors':
          result.doctors.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType(Object)])
              ])) as BuiltList<Object>);
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

class _$ReferencesRecord extends ReferencesRecord {
  @override
  final BuiltList<DocumentReference<Object>> doctors;
  @override
  final DocumentReference<Object> reference;

  factory _$ReferencesRecord(
          [void Function(ReferencesRecordBuilder) updates]) =>
      (new ReferencesRecordBuilder()..update(updates))._build();

  _$ReferencesRecord._({this.doctors, this.reference}) : super._();

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
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, doctors.hashCode), reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ReferencesRecord')
          ..add('doctors', doctors)
          ..add('reference', reference))
        .toString();
  }
}

class ReferencesRecordBuilder
    implements Builder<ReferencesRecord, ReferencesRecordBuilder> {
  _$ReferencesRecord _$v;

  ListBuilder<DocumentReference<Object>> _doctors;
  ListBuilder<DocumentReference<Object>> get doctors =>
      _$this._doctors ??= new ListBuilder<DocumentReference<Object>>();
  set doctors(ListBuilder<DocumentReference<Object>> doctors) =>
      _$this._doctors = doctors;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  ReferencesRecordBuilder() {
    ReferencesRecord._initializeBuilder(this);
  }

  ReferencesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _doctors = $v.doctors?.toBuilder();
      _reference = $v.reference;
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
  void update(void Function(ReferencesRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  ReferencesRecord build() => _build();

  _$ReferencesRecord _build() {
    _$ReferencesRecord _$result;
    try {
      _$result = _$v ??
          new _$ReferencesRecord._(
              doctors: _doctors?.build(), reference: reference);
    } catch (_) {
      String _$failedField;
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

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
