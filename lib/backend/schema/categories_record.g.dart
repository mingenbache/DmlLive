// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CategoriesRecord> _$categoriesRecordSerializer =
    new _$CategoriesRecordSerializer();

class _$CategoriesRecordSerializer
    implements StructuredSerializer<CategoriesRecord> {
  @override
  final Iterable<Type> types = const [CategoriesRecord, _$CategoriesRecord];
  @override
  final String wireName = 'CategoriesRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, CategoriesRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.categories;
    if (value != null) {
      result
        ..add('categories')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.ispackageCategory;
    if (value != null) {
      result
        ..add('ispackage_Category')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.istestCategory;
    if (value != null) {
      result
        ..add('istest_Category')
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
  CategoriesRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CategoriesRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'categories':
          result.categories.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'ispackage_Category':
          result.ispackageCategory = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'istest_Category':
          result.istestCategory = serializers.deserialize(value,
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

class _$CategoriesRecord extends CategoriesRecord {
  @override
  final BuiltList<String>? categories;
  @override
  final String? name;
  @override
  final bool? ispackageCategory;
  @override
  final bool? istestCategory;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$CategoriesRecord(
          [void Function(CategoriesRecordBuilder)? updates]) =>
      (new CategoriesRecordBuilder()..update(updates))._build();

  _$CategoriesRecord._(
      {this.categories,
      this.name,
      this.ispackageCategory,
      this.istestCategory,
      this.ffRef})
      : super._();

  @override
  CategoriesRecord rebuild(void Function(CategoriesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CategoriesRecordBuilder toBuilder() =>
      new CategoriesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CategoriesRecord &&
        categories == other.categories &&
        name == other.name &&
        ispackageCategory == other.ispackageCategory &&
        istestCategory == other.istestCategory &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, categories.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, ispackageCategory.hashCode);
    _$hash = $jc(_$hash, istestCategory.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CategoriesRecord')
          ..add('categories', categories)
          ..add('name', name)
          ..add('ispackageCategory', ispackageCategory)
          ..add('istestCategory', istestCategory)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class CategoriesRecordBuilder
    implements Builder<CategoriesRecord, CategoriesRecordBuilder> {
  _$CategoriesRecord? _$v;

  ListBuilder<String>? _categories;
  ListBuilder<String> get categories =>
      _$this._categories ??= new ListBuilder<String>();
  set categories(ListBuilder<String>? categories) =>
      _$this._categories = categories;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  bool? _ispackageCategory;
  bool? get ispackageCategory => _$this._ispackageCategory;
  set ispackageCategory(bool? ispackageCategory) =>
      _$this._ispackageCategory = ispackageCategory;

  bool? _istestCategory;
  bool? get istestCategory => _$this._istestCategory;
  set istestCategory(bool? istestCategory) =>
      _$this._istestCategory = istestCategory;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  CategoriesRecordBuilder() {
    CategoriesRecord._initializeBuilder(this);
  }

  CategoriesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _categories = $v.categories?.toBuilder();
      _name = $v.name;
      _ispackageCategory = $v.ispackageCategory;
      _istestCategory = $v.istestCategory;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CategoriesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CategoriesRecord;
  }

  @override
  void update(void Function(CategoriesRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CategoriesRecord build() => _build();

  _$CategoriesRecord _build() {
    _$CategoriesRecord _$result;
    try {
      _$result = _$v ??
          new _$CategoriesRecord._(
              categories: _categories?.build(),
              name: name,
              ispackageCategory: ispackageCategory,
              istestCategory: istestCategory,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'categories';
        _categories?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'CategoriesRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
