// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booked_tests_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<BookedTestsRecord> _$bookedTestsRecordSerializer =
    new _$BookedTestsRecordSerializer();

class _$BookedTestsRecordSerializer
    implements StructuredSerializer<BookedTestsRecord> {
  @override
  final Iterable<Type> types = const [BookedTestsRecord, _$BookedTestsRecord];
  @override
  final String wireName = 'BookedTestsRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, BookedTestsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.testRef;
    if (value != null) {
      result
        ..add('testRef')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.scheduledDate;
    if (value != null) {
      result
        ..add('scheduled_date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.bookingRef;
    if (value != null) {
      result
        ..add('booking_ref')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.sampleCollected;
    if (value != null) {
      result
        ..add('sample_collected')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.sampleSlideRequested;
    if (value != null) {
      result
        ..add('sample_slide_requested')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.sampleSlideSurrendered;
    if (value != null) {
      result
        ..add('sample_slide_surrendered')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.user;
    if (value != null) {
      result
        ..add('user')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.testResult;
    if (value != null) {
      result
        ..add('test_result')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.testAttachment;
    if (value != null) {
      result
        ..add('test_attachment')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.createdDate;
    if (value != null) {
      result
        ..add('created_date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.hasResult;
    if (value != null) {
      result
        ..add('has_result')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.labRefNum;
    if (value != null) {
      result
        ..add('labRefNum')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.technologist;
    if (value != null) {
      result
        ..add('technologist')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.createUser;
    if (value != null) {
      result
        ..add('createUser')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.hasTestPack;
    if (value != null) {
      result
        ..add('has_test_pack')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.testPackRef;
    if (value != null) {
      result
        ..add('test_pack_ref')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.testedTestRef;
    if (value != null) {
      result
        ..add('tested_test_Ref')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
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
  BookedTestsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new BookedTestsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'testRef':
          result.testRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'scheduled_date':
          result.scheduledDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'booking_ref':
          result.bookingRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'sample_collected':
          result.sampleCollected = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'sample_slide_requested':
          result.sampleSlideRequested = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'sample_slide_surrendered':
          result.sampleSlideSurrendered = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'user':
          result.user = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'test_result':
          result.testResult = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'test_attachment':
          result.testAttachment = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'created_date':
          result.createdDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'has_result':
          result.hasResult = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'labRefNum':
          result.labRefNum = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'technologist':
          result.technologist = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'createUser':
          result.createUser = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'has_test_pack':
          result.hasTestPack = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'test_pack_ref':
          result.testPackRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'tested_test_Ref':
          result.testedTestRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
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

class _$BookedTestsRecord extends BookedTestsRecord {
  @override
  final DocumentReference<Object?>? testRef;
  @override
  final DateTime? scheduledDate;
  @override
  final DocumentReference<Object?>? bookingRef;
  @override
  final bool? sampleCollected;
  @override
  final bool? sampleSlideRequested;
  @override
  final bool? sampleSlideSurrendered;
  @override
  final DocumentReference<Object?>? user;
  @override
  final String? testResult;
  @override
  final String? testAttachment;
  @override
  final DateTime? createdDate;
  @override
  final bool? hasResult;
  @override
  final String? labRefNum;
  @override
  final DocumentReference<Object?>? technologist;
  @override
  final DocumentReference<Object?>? createUser;
  @override
  final bool? hasTestPack;
  @override
  final DocumentReference<Object?>? testPackRef;
  @override
  final DocumentReference<Object?>? testedTestRef;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$BookedTestsRecord(
          [void Function(BookedTestsRecordBuilder)? updates]) =>
      (new BookedTestsRecordBuilder()..update(updates))._build();

  _$BookedTestsRecord._(
      {this.testRef,
      this.scheduledDate,
      this.bookingRef,
      this.sampleCollected,
      this.sampleSlideRequested,
      this.sampleSlideSurrendered,
      this.user,
      this.testResult,
      this.testAttachment,
      this.createdDate,
      this.hasResult,
      this.labRefNum,
      this.technologist,
      this.createUser,
      this.hasTestPack,
      this.testPackRef,
      this.testedTestRef,
      this.ffRef})
      : super._();

  @override
  BookedTestsRecord rebuild(void Function(BookedTestsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BookedTestsRecordBuilder toBuilder() =>
      new BookedTestsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BookedTestsRecord &&
        testRef == other.testRef &&
        scheduledDate == other.scheduledDate &&
        bookingRef == other.bookingRef &&
        sampleCollected == other.sampleCollected &&
        sampleSlideRequested == other.sampleSlideRequested &&
        sampleSlideSurrendered == other.sampleSlideSurrendered &&
        user == other.user &&
        testResult == other.testResult &&
        testAttachment == other.testAttachment &&
        createdDate == other.createdDate &&
        hasResult == other.hasResult &&
        labRefNum == other.labRefNum &&
        technologist == other.technologist &&
        createUser == other.createUser &&
        hasTestPack == other.hasTestPack &&
        testPackRef == other.testPackRef &&
        testedTestRef == other.testedTestRef &&
        ffRef == other.ffRef;
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
                                            $jc(
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                $jc(
                                                                    $jc(
                                                                        $jc(
                                                                            0,
                                                                            testRef
                                                                                .hashCode),
                                                                        scheduledDate
                                                                            .hashCode),
                                                                    bookingRef
                                                                        .hashCode),
                                                                sampleCollected
                                                                    .hashCode),
                                                            sampleSlideRequested
                                                                .hashCode),
                                                        sampleSlideSurrendered
                                                            .hashCode),
                                                    user.hashCode),
                                                testResult.hashCode),
                                            testAttachment.hashCode),
                                        createdDate.hashCode),
                                    hasResult.hashCode),
                                labRefNum.hashCode),
                            technologist.hashCode),
                        createUser.hashCode),
                    hasTestPack.hashCode),
                testPackRef.hashCode),
            testedTestRef.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'BookedTestsRecord')
          ..add('testRef', testRef)
          ..add('scheduledDate', scheduledDate)
          ..add('bookingRef', bookingRef)
          ..add('sampleCollected', sampleCollected)
          ..add('sampleSlideRequested', sampleSlideRequested)
          ..add('sampleSlideSurrendered', sampleSlideSurrendered)
          ..add('user', user)
          ..add('testResult', testResult)
          ..add('testAttachment', testAttachment)
          ..add('createdDate', createdDate)
          ..add('hasResult', hasResult)
          ..add('labRefNum', labRefNum)
          ..add('technologist', technologist)
          ..add('createUser', createUser)
          ..add('hasTestPack', hasTestPack)
          ..add('testPackRef', testPackRef)
          ..add('testedTestRef', testedTestRef)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class BookedTestsRecordBuilder
    implements Builder<BookedTestsRecord, BookedTestsRecordBuilder> {
  _$BookedTestsRecord? _$v;

  DocumentReference<Object?>? _testRef;
  DocumentReference<Object?>? get testRef => _$this._testRef;
  set testRef(DocumentReference<Object?>? testRef) => _$this._testRef = testRef;

  DateTime? _scheduledDate;
  DateTime? get scheduledDate => _$this._scheduledDate;
  set scheduledDate(DateTime? scheduledDate) =>
      _$this._scheduledDate = scheduledDate;

  DocumentReference<Object?>? _bookingRef;
  DocumentReference<Object?>? get bookingRef => _$this._bookingRef;
  set bookingRef(DocumentReference<Object?>? bookingRef) =>
      _$this._bookingRef = bookingRef;

  bool? _sampleCollected;
  bool? get sampleCollected => _$this._sampleCollected;
  set sampleCollected(bool? sampleCollected) =>
      _$this._sampleCollected = sampleCollected;

  bool? _sampleSlideRequested;
  bool? get sampleSlideRequested => _$this._sampleSlideRequested;
  set sampleSlideRequested(bool? sampleSlideRequested) =>
      _$this._sampleSlideRequested = sampleSlideRequested;

  bool? _sampleSlideSurrendered;
  bool? get sampleSlideSurrendered => _$this._sampleSlideSurrendered;
  set sampleSlideSurrendered(bool? sampleSlideSurrendered) =>
      _$this._sampleSlideSurrendered = sampleSlideSurrendered;

  DocumentReference<Object?>? _user;
  DocumentReference<Object?>? get user => _$this._user;
  set user(DocumentReference<Object?>? user) => _$this._user = user;

  String? _testResult;
  String? get testResult => _$this._testResult;
  set testResult(String? testResult) => _$this._testResult = testResult;

  String? _testAttachment;
  String? get testAttachment => _$this._testAttachment;
  set testAttachment(String? testAttachment) =>
      _$this._testAttachment = testAttachment;

  DateTime? _createdDate;
  DateTime? get createdDate => _$this._createdDate;
  set createdDate(DateTime? createdDate) => _$this._createdDate = createdDate;

  bool? _hasResult;
  bool? get hasResult => _$this._hasResult;
  set hasResult(bool? hasResult) => _$this._hasResult = hasResult;

  String? _labRefNum;
  String? get labRefNum => _$this._labRefNum;
  set labRefNum(String? labRefNum) => _$this._labRefNum = labRefNum;

  DocumentReference<Object?>? _technologist;
  DocumentReference<Object?>? get technologist => _$this._technologist;
  set technologist(DocumentReference<Object?>? technologist) =>
      _$this._technologist = technologist;

  DocumentReference<Object?>? _createUser;
  DocumentReference<Object?>? get createUser => _$this._createUser;
  set createUser(DocumentReference<Object?>? createUser) =>
      _$this._createUser = createUser;

  bool? _hasTestPack;
  bool? get hasTestPack => _$this._hasTestPack;
  set hasTestPack(bool? hasTestPack) => _$this._hasTestPack = hasTestPack;

  DocumentReference<Object?>? _testPackRef;
  DocumentReference<Object?>? get testPackRef => _$this._testPackRef;
  set testPackRef(DocumentReference<Object?>? testPackRef) =>
      _$this._testPackRef = testPackRef;

  DocumentReference<Object?>? _testedTestRef;
  DocumentReference<Object?>? get testedTestRef => _$this._testedTestRef;
  set testedTestRef(DocumentReference<Object?>? testedTestRef) =>
      _$this._testedTestRef = testedTestRef;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  BookedTestsRecordBuilder() {
    BookedTestsRecord._initializeBuilder(this);
  }

  BookedTestsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _testRef = $v.testRef;
      _scheduledDate = $v.scheduledDate;
      _bookingRef = $v.bookingRef;
      _sampleCollected = $v.sampleCollected;
      _sampleSlideRequested = $v.sampleSlideRequested;
      _sampleSlideSurrendered = $v.sampleSlideSurrendered;
      _user = $v.user;
      _testResult = $v.testResult;
      _testAttachment = $v.testAttachment;
      _createdDate = $v.createdDate;
      _hasResult = $v.hasResult;
      _labRefNum = $v.labRefNum;
      _technologist = $v.technologist;
      _createUser = $v.createUser;
      _hasTestPack = $v.hasTestPack;
      _testPackRef = $v.testPackRef;
      _testedTestRef = $v.testedTestRef;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BookedTestsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$BookedTestsRecord;
  }

  @override
  void update(void Function(BookedTestsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  BookedTestsRecord build() => _build();

  _$BookedTestsRecord _build() {
    final _$result = _$v ??
        new _$BookedTestsRecord._(
            testRef: testRef,
            scheduledDate: scheduledDate,
            bookingRef: bookingRef,
            sampleCollected: sampleCollected,
            sampleSlideRequested: sampleSlideRequested,
            sampleSlideSurrendered: sampleSlideSurrendered,
            user: user,
            testResult: testResult,
            testAttachment: testAttachment,
            createdDate: createdDate,
            hasResult: hasResult,
            labRefNum: labRefNum,
            technologist: technologist,
            createUser: createUser,
            hasTestPack: hasTestPack,
            testPackRef: testPackRef,
            testedTestRef: testedTestRef,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
