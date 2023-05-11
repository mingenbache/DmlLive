// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'd_m_l_info_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<DMLInfoRecord> _$dMLInfoRecordSerializer =
    new _$DMLInfoRecordSerializer();

class _$DMLInfoRecordSerializer implements StructuredSerializer<DMLInfoRecord> {
  @override
  final Iterable<Type> types = const [DMLInfoRecord, _$DMLInfoRecord];
  @override
  final String wireName = 'DMLInfoRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, DMLInfoRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.url;
    if (value != null) {
      result
        ..add('url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.primaryEmail;
    if (value != null) {
      result
        ..add('primaryEmail')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.phoneNumbers;
    if (value != null) {
      result
        ..add('phone_numbers')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.dMLLogo;
    if (value != null) {
      result
        ..add('DML_Logo')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.footerReferences;
    if (value != null) {
      result
        ..add('footerReferences')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.location;
    if (value != null) {
      result
        ..add('location')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.isMain;
    if (value != null) {
      result
        ..add('isMain')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
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
  DMLInfoRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DMLInfoRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'url':
          result.url = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'primaryEmail':
          result.primaryEmail = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'phone_numbers':
          result.phoneNumbers.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'DML_Logo':
          result.dMLLogo = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'footerReferences':
          result.footerReferences.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'location':
          result.location = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'isMain':
          result.isMain = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
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

class _$DMLInfoRecord extends DMLInfoRecord {
  @override
  final String? url;
  @override
  final String? primaryEmail;
  @override
  final BuiltList<String>? phoneNumbers;
  @override
  final String? dMLLogo;
  @override
  final BuiltList<String>? footerReferences;
  @override
  final String? location;
  @override
  final bool? isMain;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$DMLInfoRecord([void Function(DMLInfoRecordBuilder)? updates]) =>
      (new DMLInfoRecordBuilder()..update(updates))._build();

  _$DMLInfoRecord._(
      {this.url,
      this.primaryEmail,
      this.phoneNumbers,
      this.dMLLogo,
      this.footerReferences,
      this.location,
      this.isMain,
      this.ffRef})
      : super._();

  @override
  DMLInfoRecord rebuild(void Function(DMLInfoRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DMLInfoRecordBuilder toBuilder() => new DMLInfoRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DMLInfoRecord &&
        url == other.url &&
        primaryEmail == other.primaryEmail &&
        phoneNumbers == other.phoneNumbers &&
        dMLLogo == other.dMLLogo &&
        footerReferences == other.footerReferences &&
        location == other.location &&
        isMain == other.isMain &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, url.hashCode);
    _$hash = $jc(_$hash, primaryEmail.hashCode);
    _$hash = $jc(_$hash, phoneNumbers.hashCode);
    _$hash = $jc(_$hash, dMLLogo.hashCode);
    _$hash = $jc(_$hash, footerReferences.hashCode);
    _$hash = $jc(_$hash, location.hashCode);
    _$hash = $jc(_$hash, isMain.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DMLInfoRecord')
          ..add('url', url)
          ..add('primaryEmail', primaryEmail)
          ..add('phoneNumbers', phoneNumbers)
          ..add('dMLLogo', dMLLogo)
          ..add('footerReferences', footerReferences)
          ..add('location', location)
          ..add('isMain', isMain)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class DMLInfoRecordBuilder
    implements Builder<DMLInfoRecord, DMLInfoRecordBuilder> {
  _$DMLInfoRecord? _$v;

  String? _url;
  String? get url => _$this._url;
  set url(String? url) => _$this._url = url;

  String? _primaryEmail;
  String? get primaryEmail => _$this._primaryEmail;
  set primaryEmail(String? primaryEmail) => _$this._primaryEmail = primaryEmail;

  ListBuilder<String>? _phoneNumbers;
  ListBuilder<String> get phoneNumbers =>
      _$this._phoneNumbers ??= new ListBuilder<String>();
  set phoneNumbers(ListBuilder<String>? phoneNumbers) =>
      _$this._phoneNumbers = phoneNumbers;

  String? _dMLLogo;
  String? get dMLLogo => _$this._dMLLogo;
  set dMLLogo(String? dMLLogo) => _$this._dMLLogo = dMLLogo;

  ListBuilder<String>? _footerReferences;
  ListBuilder<String> get footerReferences =>
      _$this._footerReferences ??= new ListBuilder<String>();
  set footerReferences(ListBuilder<String>? footerReferences) =>
      _$this._footerReferences = footerReferences;

  String? _location;
  String? get location => _$this._location;
  set location(String? location) => _$this._location = location;

  bool? _isMain;
  bool? get isMain => _$this._isMain;
  set isMain(bool? isMain) => _$this._isMain = isMain;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  DMLInfoRecordBuilder() {
    DMLInfoRecord._initializeBuilder(this);
  }

  DMLInfoRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _url = $v.url;
      _primaryEmail = $v.primaryEmail;
      _phoneNumbers = $v.phoneNumbers?.toBuilder();
      _dMLLogo = $v.dMLLogo;
      _footerReferences = $v.footerReferences?.toBuilder();
      _location = $v.location;
      _isMain = $v.isMain;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DMLInfoRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DMLInfoRecord;
  }

  @override
  void update(void Function(DMLInfoRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DMLInfoRecord build() => _build();

  _$DMLInfoRecord _build() {
    _$DMLInfoRecord _$result;
    try {
      _$result = _$v ??
          new _$DMLInfoRecord._(
              url: url,
              primaryEmail: primaryEmail,
              phoneNumbers: _phoneNumbers?.build(),
              dMLLogo: dMLLogo,
              footerReferences: _footerReferences?.build(),
              location: location,
              isMain: isMain,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'phoneNumbers';
        _phoneNumbers?.build();

        _$failedField = 'footerReferences';
        _footerReferences?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'DMLInfoRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
