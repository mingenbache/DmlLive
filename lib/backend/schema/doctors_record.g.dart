// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctors_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<DoctorsRecord> _$doctorsRecordSerializer =
    new _$DoctorsRecordSerializer();

class _$DoctorsRecordSerializer implements StructuredSerializer<DoctorsRecord> {
  @override
  final Iterable<Type> types = const [DoctorsRecord, _$DoctorsRecord];
  @override
  final String wireName = 'DoctorsRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, DoctorsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.names;
    if (value != null) {
      result
        ..add('names')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.address;
    if (value != null) {
      result
        ..add('address')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.phonenumber;
    if (value != null) {
      result
        ..add('phonenumber')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.emailaddress;
    if (value != null) {
      result
        ..add('emailaddress')
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
  DoctorsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DoctorsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'names':
          result.names.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'address':
          result.address = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'phonenumber':
          result.phonenumber = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'emailaddress':
          result.emailaddress = serializers.deserialize(value,
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

class _$DoctorsRecord extends DoctorsRecord {
  @override
  final BuiltList<String>? names;
  @override
  final String? address;
  @override
  final String? phonenumber;
  @override
  final String? name;
  @override
  final String? emailaddress;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$DoctorsRecord([void Function(DoctorsRecordBuilder)? updates]) =>
      (new DoctorsRecordBuilder()..update(updates))._build();

  _$DoctorsRecord._(
      {this.names,
      this.address,
      this.phonenumber,
      this.name,
      this.emailaddress,
      this.ffRef})
      : super._();

  @override
  DoctorsRecord rebuild(void Function(DoctorsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DoctorsRecordBuilder toBuilder() => new DoctorsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DoctorsRecord &&
        names == other.names &&
        address == other.address &&
        phonenumber == other.phonenumber &&
        name == other.name &&
        emailaddress == other.emailaddress &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, names.hashCode), address.hashCode),
                    phonenumber.hashCode),
                name.hashCode),
            emailaddress.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DoctorsRecord')
          ..add('names', names)
          ..add('address', address)
          ..add('phonenumber', phonenumber)
          ..add('name', name)
          ..add('emailaddress', emailaddress)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class DoctorsRecordBuilder
    implements Builder<DoctorsRecord, DoctorsRecordBuilder> {
  _$DoctorsRecord? _$v;

  ListBuilder<String>? _names;
  ListBuilder<String> get names => _$this._names ??= new ListBuilder<String>();
  set names(ListBuilder<String>? names) => _$this._names = names;

  String? _address;
  String? get address => _$this._address;
  set address(String? address) => _$this._address = address;

  String? _phonenumber;
  String? get phonenumber => _$this._phonenumber;
  set phonenumber(String? phonenumber) => _$this._phonenumber = phonenumber;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _emailaddress;
  String? get emailaddress => _$this._emailaddress;
  set emailaddress(String? emailaddress) => _$this._emailaddress = emailaddress;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  DoctorsRecordBuilder() {
    DoctorsRecord._initializeBuilder(this);
  }

  DoctorsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _names = $v.names?.toBuilder();
      _address = $v.address;
      _phonenumber = $v.phonenumber;
      _name = $v.name;
      _emailaddress = $v.emailaddress;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DoctorsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DoctorsRecord;
  }

  @override
  void update(void Function(DoctorsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DoctorsRecord build() => _build();

  _$DoctorsRecord _build() {
    _$DoctorsRecord _$result;
    try {
      _$result = _$v ??
          new _$DoctorsRecord._(
              names: _names?.build(),
              address: address,
              phonenumber: phonenumber,
              name: name,
              emailaddress: emailaddress,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'names';
        _names?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'DoctorsRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
