// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test_packages_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TestPackagesRecord> _$testPackagesRecordSerializer =
    new _$TestPackagesRecordSerializer();

class _$TestPackagesRecordSerializer
    implements StructuredSerializer<TestPackagesRecord> {
  @override
  final Iterable<Type> types = const [TestPackagesRecord, _$TestPackagesRecord];
  @override
  final String wireName = 'TestPackagesRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, TestPackagesRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.packageName;
    if (value != null) {
      result
        ..add('PackageName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.price;
    if (value != null) {
      result
        ..add('Price')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.testsIncluded;
    if (value != null) {
      result
        ..add('TestsIncluded')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
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
    value = object.atHome;
    if (value != null) {
      result
        ..add('atHome')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.isAvailable;
    if (value != null) {
      result
        ..add('isAvailable')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.createStaff;
    if (value != null) {
      result
        ..add('create_Staff')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.createDate;
    if (value != null) {
      result
        ..add('create_date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
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
  TestPackagesRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TestPackagesRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'PackageName':
          result.packageName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Price':
          result.price = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'TestsIncluded':
          result.testsIncluded.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
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
        case 'atHome':
          result.atHome = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'isAvailable':
          result.isAvailable = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'create_Staff':
          result.createStaff = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'create_date':
          result.createDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
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

class _$TestPackagesRecord extends TestPackagesRecord {
  @override
  final String? packageName;
  @override
  final int? price;
  @override
  final BuiltList<DocumentReference<Object?>>? testsIncluded;
  @override
  final String? description;
  @override
  final double? duration;
  @override
  final double? durationResults;
  @override
  final String? category;
  @override
  final bool? atHome;
  @override
  final bool? isAvailable;
  @override
  final DocumentReference<Object?>? createStaff;
  @override
  final DateTime? createDate;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$TestPackagesRecord(
          [void Function(TestPackagesRecordBuilder)? updates]) =>
      (new TestPackagesRecordBuilder()..update(updates))._build();

  _$TestPackagesRecord._(
      {this.packageName,
      this.price,
      this.testsIncluded,
      this.description,
      this.duration,
      this.durationResults,
      this.category,
      this.atHome,
      this.isAvailable,
      this.createStaff,
      this.createDate,
      this.ffRef})
      : super._();

  @override
  TestPackagesRecord rebuild(
          void Function(TestPackagesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TestPackagesRecordBuilder toBuilder() =>
      new TestPackagesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TestPackagesRecord &&
        packageName == other.packageName &&
        price == other.price &&
        testsIncluded == other.testsIncluded &&
        description == other.description &&
        duration == other.duration &&
        durationResults == other.durationResults &&
        category == other.category &&
        atHome == other.atHome &&
        isAvailable == other.isAvailable &&
        createStaff == other.createStaff &&
        createDate == other.createDate &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, packageName.hashCode);
    _$hash = $jc(_$hash, price.hashCode);
    _$hash = $jc(_$hash, testsIncluded.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, duration.hashCode);
    _$hash = $jc(_$hash, durationResults.hashCode);
    _$hash = $jc(_$hash, category.hashCode);
    _$hash = $jc(_$hash, atHome.hashCode);
    _$hash = $jc(_$hash, isAvailable.hashCode);
    _$hash = $jc(_$hash, createStaff.hashCode);
    _$hash = $jc(_$hash, createDate.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TestPackagesRecord')
          ..add('packageName', packageName)
          ..add('price', price)
          ..add('testsIncluded', testsIncluded)
          ..add('description', description)
          ..add('duration', duration)
          ..add('durationResults', durationResults)
          ..add('category', category)
          ..add('atHome', atHome)
          ..add('isAvailable', isAvailable)
          ..add('createStaff', createStaff)
          ..add('createDate', createDate)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class TestPackagesRecordBuilder
    implements Builder<TestPackagesRecord, TestPackagesRecordBuilder> {
  _$TestPackagesRecord? _$v;

  String? _packageName;
  String? get packageName => _$this._packageName;
  set packageName(String? packageName) => _$this._packageName = packageName;

  int? _price;
  int? get price => _$this._price;
  set price(int? price) => _$this._price = price;

  ListBuilder<DocumentReference<Object?>>? _testsIncluded;
  ListBuilder<DocumentReference<Object?>> get testsIncluded =>
      _$this._testsIncluded ??= new ListBuilder<DocumentReference<Object?>>();
  set testsIncluded(ListBuilder<DocumentReference<Object?>>? testsIncluded) =>
      _$this._testsIncluded = testsIncluded;

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

  bool? _atHome;
  bool? get atHome => _$this._atHome;
  set atHome(bool? atHome) => _$this._atHome = atHome;

  bool? _isAvailable;
  bool? get isAvailable => _$this._isAvailable;
  set isAvailable(bool? isAvailable) => _$this._isAvailable = isAvailable;

  DocumentReference<Object?>? _createStaff;
  DocumentReference<Object?>? get createStaff => _$this._createStaff;
  set createStaff(DocumentReference<Object?>? createStaff) =>
      _$this._createStaff = createStaff;

  DateTime? _createDate;
  DateTime? get createDate => _$this._createDate;
  set createDate(DateTime? createDate) => _$this._createDate = createDate;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  TestPackagesRecordBuilder() {
    TestPackagesRecord._initializeBuilder(this);
  }

  TestPackagesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _packageName = $v.packageName;
      _price = $v.price;
      _testsIncluded = $v.testsIncluded?.toBuilder();
      _description = $v.description;
      _duration = $v.duration;
      _durationResults = $v.durationResults;
      _category = $v.category;
      _atHome = $v.atHome;
      _isAvailable = $v.isAvailable;
      _createStaff = $v.createStaff;
      _createDate = $v.createDate;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TestPackagesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TestPackagesRecord;
  }

  @override
  void update(void Function(TestPackagesRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TestPackagesRecord build() => _build();

  _$TestPackagesRecord _build() {
    _$TestPackagesRecord _$result;
    try {
      _$result = _$v ??
          new _$TestPackagesRecord._(
              packageName: packageName,
              price: price,
              testsIncluded: _testsIncluded?.build(),
              description: description,
              duration: duration,
              durationResults: durationResults,
              category: category,
              atHome: atHome,
              isAvailable: isAvailable,
              createStaff: createStaff,
              createDate: createDate,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'testsIncluded';
        _testsIncluded?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'TestPackagesRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
