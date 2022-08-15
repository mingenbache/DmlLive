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
  Iterable<Object> serialize(Serializers serializers, TestPackagesRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
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
              const FullType(DocumentReference, const [const FullType(Object)])
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
                DocumentReference, const [const FullType(Object)])));
    }
    value = object.createDate;
    if (value != null) {
      result
        ..add('create_date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
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
  TestPackagesRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TestPackagesRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'PackageName':
          result.packageName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'Price':
          result.price = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'TestsIncluded':
          result.testsIncluded.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType(Object)])
              ])) as BuiltList<Object>);
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'duration':
          result.duration = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'duration_results':
          result.durationResults = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'category':
          result.category = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'atHome':
          result.atHome = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'isAvailable':
          result.isAvailable = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'create_Staff':
          result.createStaff = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
        case 'create_date':
          result.createDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
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

class _$TestPackagesRecord extends TestPackagesRecord {
  @override
  final String packageName;
  @override
  final int price;
  @override
  final BuiltList<DocumentReference<Object>> testsIncluded;
  @override
  final String description;
  @override
  final double duration;
  @override
  final double durationResults;
  @override
  final String category;
  @override
  final bool atHome;
  @override
  final bool isAvailable;
  @override
  final DocumentReference<Object> createStaff;
  @override
  final DateTime createDate;
  @override
  final DocumentReference<Object> reference;

  factory _$TestPackagesRecord(
          [void Function(TestPackagesRecordBuilder) updates]) =>
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
      this.reference})
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
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc($jc(0, packageName.hashCode),
                                                price.hashCode),
                                            testsIncluded.hashCode),
                                        description.hashCode),
                                    duration.hashCode),
                                durationResults.hashCode),
                            category.hashCode),
                        atHome.hashCode),
                    isAvailable.hashCode),
                createStaff.hashCode),
            createDate.hashCode),
        reference.hashCode));
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
          ..add('reference', reference))
        .toString();
  }
}

class TestPackagesRecordBuilder
    implements Builder<TestPackagesRecord, TestPackagesRecordBuilder> {
  _$TestPackagesRecord _$v;

  String _packageName;
  String get packageName => _$this._packageName;
  set packageName(String packageName) => _$this._packageName = packageName;

  int _price;
  int get price => _$this._price;
  set price(int price) => _$this._price = price;

  ListBuilder<DocumentReference<Object>> _testsIncluded;
  ListBuilder<DocumentReference<Object>> get testsIncluded =>
      _$this._testsIncluded ??= new ListBuilder<DocumentReference<Object>>();
  set testsIncluded(ListBuilder<DocumentReference<Object>> testsIncluded) =>
      _$this._testsIncluded = testsIncluded;

  String _description;
  String get description => _$this._description;
  set description(String description) => _$this._description = description;

  double _duration;
  double get duration => _$this._duration;
  set duration(double duration) => _$this._duration = duration;

  double _durationResults;
  double get durationResults => _$this._durationResults;
  set durationResults(double durationResults) =>
      _$this._durationResults = durationResults;

  String _category;
  String get category => _$this._category;
  set category(String category) => _$this._category = category;

  bool _atHome;
  bool get atHome => _$this._atHome;
  set atHome(bool atHome) => _$this._atHome = atHome;

  bool _isAvailable;
  bool get isAvailable => _$this._isAvailable;
  set isAvailable(bool isAvailable) => _$this._isAvailable = isAvailable;

  DocumentReference<Object> _createStaff;
  DocumentReference<Object> get createStaff => _$this._createStaff;
  set createStaff(DocumentReference<Object> createStaff) =>
      _$this._createStaff = createStaff;

  DateTime _createDate;
  DateTime get createDate => _$this._createDate;
  set createDate(DateTime createDate) => _$this._createDate = createDate;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

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
      _reference = $v.reference;
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
  void update(void Function(TestPackagesRecordBuilder) updates) {
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
              reference: reference);
    } catch (_) {
      String _$failedField;
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

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
