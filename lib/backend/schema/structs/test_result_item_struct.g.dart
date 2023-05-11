// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test_result_item_struct.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TestResultItemStruct> _$testResultItemStructSerializer =
    new _$TestResultItemStructSerializer();

class _$TestResultItemStructSerializer
    implements StructuredSerializer<TestResultItemStruct> {
  @override
  final Iterable<Type> types = const [
    TestResultItemStruct,
    _$TestResultItemStruct
  ];
  @override
  final String wireName = 'TestResultItemStruct';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, TestResultItemStruct object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'firestoreUtilData',
      serializers.serialize(object.firestoreUtilData,
          specifiedType: const FullType(FirestoreUtilData)),
    ];
    Object? value;
    value = object.testName;
    if (value != null) {
      result
        ..add('test_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.pathologistNote;
    if (value != null) {
      result
        ..add('pathologistNote')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.type;
    if (value != null) {
      result
        ..add('type')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.specialTestRef;
    if (value != null) {
      result
        ..add('specialTestRef')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.bookedTestRef;
    if (value != null) {
      result
        ..add('bookedTestRef')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  TestResultItemStruct deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TestResultItemStructBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'test_name':
          result.testName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'pathologistNote':
          result.pathologistNote = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'specialTestRef':
          result.specialTestRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'bookedTestRef':
          result.bookedTestRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'firestoreUtilData':
          result.firestoreUtilData = serializers.deserialize(value,
                  specifiedType: const FullType(FirestoreUtilData))!
              as FirestoreUtilData;
          break;
      }
    }

    return result.build();
  }
}

class _$TestResultItemStruct extends TestResultItemStruct {
  @override
  final String? testName;
  @override
  final String? pathologistNote;
  @override
  final String? type;
  @override
  final DocumentReference<Object?>? specialTestRef;
  @override
  final DocumentReference<Object?>? bookedTestRef;
  @override
  final FirestoreUtilData firestoreUtilData;

  factory _$TestResultItemStruct(
          [void Function(TestResultItemStructBuilder)? updates]) =>
      (new TestResultItemStructBuilder()..update(updates))._build();

  _$TestResultItemStruct._(
      {this.testName,
      this.pathologistNote,
      this.type,
      this.specialTestRef,
      this.bookedTestRef,
      required this.firestoreUtilData})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        firestoreUtilData, r'TestResultItemStruct', 'firestoreUtilData');
  }

  @override
  TestResultItemStruct rebuild(
          void Function(TestResultItemStructBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TestResultItemStructBuilder toBuilder() =>
      new TestResultItemStructBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TestResultItemStruct &&
        testName == other.testName &&
        pathologistNote == other.pathologistNote &&
        type == other.type &&
        specialTestRef == other.specialTestRef &&
        bookedTestRef == other.bookedTestRef &&
        firestoreUtilData == other.firestoreUtilData;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, testName.hashCode);
    _$hash = $jc(_$hash, pathologistNote.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, specialTestRef.hashCode);
    _$hash = $jc(_$hash, bookedTestRef.hashCode);
    _$hash = $jc(_$hash, firestoreUtilData.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TestResultItemStruct')
          ..add('testName', testName)
          ..add('pathologistNote', pathologistNote)
          ..add('type', type)
          ..add('specialTestRef', specialTestRef)
          ..add('bookedTestRef', bookedTestRef)
          ..add('firestoreUtilData', firestoreUtilData))
        .toString();
  }
}

class TestResultItemStructBuilder
    implements Builder<TestResultItemStruct, TestResultItemStructBuilder> {
  _$TestResultItemStruct? _$v;

  String? _testName;
  String? get testName => _$this._testName;
  set testName(String? testName) => _$this._testName = testName;

  String? _pathologistNote;
  String? get pathologistNote => _$this._pathologistNote;
  set pathologistNote(String? pathologistNote) =>
      _$this._pathologistNote = pathologistNote;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  DocumentReference<Object?>? _specialTestRef;
  DocumentReference<Object?>? get specialTestRef => _$this._specialTestRef;
  set specialTestRef(DocumentReference<Object?>? specialTestRef) =>
      _$this._specialTestRef = specialTestRef;

  DocumentReference<Object?>? _bookedTestRef;
  DocumentReference<Object?>? get bookedTestRef => _$this._bookedTestRef;
  set bookedTestRef(DocumentReference<Object?>? bookedTestRef) =>
      _$this._bookedTestRef = bookedTestRef;

  FirestoreUtilData? _firestoreUtilData;
  FirestoreUtilData? get firestoreUtilData => _$this._firestoreUtilData;
  set firestoreUtilData(FirestoreUtilData? firestoreUtilData) =>
      _$this._firestoreUtilData = firestoreUtilData;

  TestResultItemStructBuilder() {
    TestResultItemStruct._initializeBuilder(this);
  }

  TestResultItemStructBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _testName = $v.testName;
      _pathologistNote = $v.pathologistNote;
      _type = $v.type;
      _specialTestRef = $v.specialTestRef;
      _bookedTestRef = $v.bookedTestRef;
      _firestoreUtilData = $v.firestoreUtilData;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TestResultItemStruct other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TestResultItemStruct;
  }

  @override
  void update(void Function(TestResultItemStructBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TestResultItemStruct build() => _build();

  _$TestResultItemStruct _build() {
    final _$result = _$v ??
        new _$TestResultItemStruct._(
            testName: testName,
            pathologistNote: pathologistNote,
            type: type,
            specialTestRef: specialTestRef,
            bookedTestRef: bookedTestRef,
            firestoreUtilData: BuiltValueNullFieldError.checkNotNull(
                firestoreUtilData,
                r'TestResultItemStruct',
                'firestoreUtilData'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
