// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tests_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TestsRecord> _$testsRecordSerializer = new _$TestsRecordSerializer();

class _$TestsRecordSerializer implements StructuredSerializer<TestsRecord> {
  @override
  final Iterable<Type> types = const [TestsRecord, _$TestsRecord];
  @override
  final String wireName = 'TestsRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, TestsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.price;
    if (value != null) {
      result
        ..add('price')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.homeTest;
    if (value != null) {
      result
        ..add('home_test')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.duration;
    if (value != null) {
      result
        ..add('duration')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.durationResults;
    if (value != null) {
      result
        ..add('duration_results')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.category;
    if (value != null) {
      result
        ..add('category')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.isAvailable;
    if (value != null) {
      result
        ..add('is_available')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.keywords;
    if (value != null) {
      result
        ..add('Keywords')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.updateDate;
    if (value != null) {
      result
        ..add('update_date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.updateRole;
    if (value != null) {
      result
        ..add('updateRole')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.varianceMale;
    if (value != null) {
      result
        ..add('varianceMale')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.varianceFemale;
    if (value != null) {
      result
        ..add('varianceFemale')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.varianceUnitsMale;
    if (value != null) {
      result
        ..add('varianceUnitsMale')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.varianceUnitsFemale;
    if (value != null) {
      result
        ..add('varianceUnitsFemale')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.equipmentInfo;
    if (value != null) {
      result
        ..add('equipmentInfo')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.procedure;
    if (value != null) {
      result
        ..add('procedure')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
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
  TestsRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TestsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'price':
          result.price = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'home_test':
          result.homeTest = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'duration':
          result.duration = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'duration_results':
          result.durationResults = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'category':
          result.category = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'is_available':
          result.isAvailable = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'Keywords':
          result.keywords.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'update_date':
          result.updateDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'updateRole':
          result.updateRole = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'varianceMale':
          result.varianceMale = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'varianceFemale':
          result.varianceFemale = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'varianceUnitsMale':
          result.varianceUnitsMale = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'varianceUnitsFemale':
          result.varianceUnitsFemale = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'equipmentInfo':
          result.equipmentInfo = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'procedure':
          result.procedure.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
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

class _$TestsRecord extends TestsRecord {
  @override
  final int? price;
  @override
  final String? name;
  @override
  final bool? homeTest;
  @override
  final String? description;
  @override
  final double? duration;
  @override
  final double? durationResults;
  @override
  final String? category;
  @override
  final bool? isAvailable;
  @override
  final BuiltList<String>? keywords;
  @override
  final DateTime? updateDate;
  @override
  final String? updateRole;
  @override
  final String? varianceMale;
  @override
  final String? varianceFemale;
  @override
  final String? varianceUnitsMale;
  @override
  final String? varianceUnitsFemale;
  @override
  final String? equipmentInfo;
  @override
  final BuiltList<String>? procedure;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$TestsRecord([void Function(TestsRecordBuilder)? updates]) =>
      (new TestsRecordBuilder()..update(updates))._build();

  _$TestsRecord._(
      {this.price,
      this.name,
      this.homeTest,
      this.description,
      this.duration,
      this.durationResults,
      this.category,
      this.isAvailable,
      this.keywords,
      this.updateDate,
      this.updateRole,
      this.varianceMale,
      this.varianceFemale,
      this.varianceUnitsMale,
      this.varianceUnitsFemale,
      this.equipmentInfo,
      this.procedure,
      this.ffRef})
      : super._();

  @override
  TestsRecord rebuild(void Function(TestsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TestsRecordBuilder toBuilder() => new TestsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TestsRecord &&
        price == other.price &&
        name == other.name &&
        homeTest == other.homeTest &&
        description == other.description &&
        duration == other.duration &&
        durationResults == other.durationResults &&
        category == other.category &&
        isAvailable == other.isAvailable &&
        keywords == other.keywords &&
        updateDate == other.updateDate &&
        updateRole == other.updateRole &&
        varianceMale == other.varianceMale &&
        varianceFemale == other.varianceFemale &&
        varianceUnitsMale == other.varianceUnitsMale &&
        varianceUnitsFemale == other.varianceUnitsFemale &&
        equipmentInfo == other.equipmentInfo &&
        procedure == other.procedure &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, price.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, homeTest.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, duration.hashCode);
    _$hash = $jc(_$hash, durationResults.hashCode);
    _$hash = $jc(_$hash, category.hashCode);
    _$hash = $jc(_$hash, isAvailable.hashCode);
    _$hash = $jc(_$hash, keywords.hashCode);
    _$hash = $jc(_$hash, updateDate.hashCode);
    _$hash = $jc(_$hash, updateRole.hashCode);
    _$hash = $jc(_$hash, varianceMale.hashCode);
    _$hash = $jc(_$hash, varianceFemale.hashCode);
    _$hash = $jc(_$hash, varianceUnitsMale.hashCode);
    _$hash = $jc(_$hash, varianceUnitsFemale.hashCode);
    _$hash = $jc(_$hash, equipmentInfo.hashCode);
    _$hash = $jc(_$hash, procedure.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TestsRecord')
          ..add('price', price)
          ..add('name', name)
          ..add('homeTest', homeTest)
          ..add('description', description)
          ..add('duration', duration)
          ..add('durationResults', durationResults)
          ..add('category', category)
          ..add('isAvailable', isAvailable)
          ..add('keywords', keywords)
          ..add('updateDate', updateDate)
          ..add('updateRole', updateRole)
          ..add('varianceMale', varianceMale)
          ..add('varianceFemale', varianceFemale)
          ..add('varianceUnitsMale', varianceUnitsMale)
          ..add('varianceUnitsFemale', varianceUnitsFemale)
          ..add('equipmentInfo', equipmentInfo)
          ..add('procedure', procedure)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class TestsRecordBuilder implements Builder<TestsRecord, TestsRecordBuilder> {
  _$TestsRecord? _$v;

  int? _price;
  int? get price => _$this._price;
  set price(int? price) => _$this._price = price;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  bool? _homeTest;
  bool? get homeTest => _$this._homeTest;
  set homeTest(bool? homeTest) => _$this._homeTest = homeTest;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  double? _duration;
  double? get duration => _$this._duration;
  set duration(double? duration) => _$this._duration = duration;

  double? _durationResults;
  double? get durationResults => _$this._durationResults;
  set durationResults(double? durationResults) =>
      _$this._durationResults = durationResults;

  String? _category;
  String? get category => _$this._category;
  set category(String? category) => _$this._category = category;

  bool? _isAvailable;
  bool? get isAvailable => _$this._isAvailable;
  set isAvailable(bool? isAvailable) => _$this._isAvailable = isAvailable;

  ListBuilder<String>? _keywords;
  ListBuilder<String> get keywords =>
      _$this._keywords ??= new ListBuilder<String>();
  set keywords(ListBuilder<String>? keywords) => _$this._keywords = keywords;

  DateTime? _updateDate;
  DateTime? get updateDate => _$this._updateDate;
  set updateDate(DateTime? updateDate) => _$this._updateDate = updateDate;

  String? _updateRole;
  String? get updateRole => _$this._updateRole;
  set updateRole(String? updateRole) => _$this._updateRole = updateRole;

  String? _varianceMale;
  String? get varianceMale => _$this._varianceMale;
  set varianceMale(String? varianceMale) => _$this._varianceMale = varianceMale;

  String? _varianceFemale;
  String? get varianceFemale => _$this._varianceFemale;
  set varianceFemale(String? varianceFemale) =>
      _$this._varianceFemale = varianceFemale;

  String? _varianceUnitsMale;
  String? get varianceUnitsMale => _$this._varianceUnitsMale;
  set varianceUnitsMale(String? varianceUnitsMale) =>
      _$this._varianceUnitsMale = varianceUnitsMale;

  String? _varianceUnitsFemale;
  String? get varianceUnitsFemale => _$this._varianceUnitsFemale;
  set varianceUnitsFemale(String? varianceUnitsFemale) =>
      _$this._varianceUnitsFemale = varianceUnitsFemale;

  String? _equipmentInfo;
  String? get equipmentInfo => _$this._equipmentInfo;
  set equipmentInfo(String? equipmentInfo) =>
      _$this._equipmentInfo = equipmentInfo;

  ListBuilder<String>? _procedure;
  ListBuilder<String> get procedure =>
      _$this._procedure ??= new ListBuilder<String>();
  set procedure(ListBuilder<String>? procedure) =>
      _$this._procedure = procedure;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  TestsRecordBuilder() {
    TestsRecord._initializeBuilder(this);
  }

  TestsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _price = $v.price;
      _name = $v.name;
      _homeTest = $v.homeTest;
      _description = $v.description;
      _duration = $v.duration;
      _durationResults = $v.durationResults;
      _category = $v.category;
      _isAvailable = $v.isAvailable;
      _keywords = $v.keywords?.toBuilder();
      _updateDate = $v.updateDate;
      _updateRole = $v.updateRole;
      _varianceMale = $v.varianceMale;
      _varianceFemale = $v.varianceFemale;
      _varianceUnitsMale = $v.varianceUnitsMale;
      _varianceUnitsFemale = $v.varianceUnitsFemale;
      _equipmentInfo = $v.equipmentInfo;
      _procedure = $v.procedure?.toBuilder();
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TestsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TestsRecord;
  }

  @override
  void update(void Function(TestsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TestsRecord build() => _build();

  _$TestsRecord _build() {
    _$TestsRecord _$result;
    try {
      _$result = _$v ??
          new _$TestsRecord._(
              price: price,
              name: name,
              homeTest: homeTest,
              description: description,
              duration: duration,
              durationResults: durationResults,
              category: category,
              isAvailable: isAvailable,
              keywords: _keywords?.build(),
              updateDate: updateDate,
              updateRole: updateRole,
              varianceMale: varianceMale,
              varianceFemale: varianceFemale,
              varianceUnitsMale: varianceUnitsMale,
              varianceUnitsFemale: varianceUnitsFemale,
              equipmentInfo: equipmentInfo,
              procedure: _procedure?.build(),
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'keywords';
        _keywords?.build();

        _$failedField = 'procedure';
        _procedure?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'TestsRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
