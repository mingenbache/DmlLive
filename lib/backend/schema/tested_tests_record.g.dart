// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tested_tests_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TestedTestsRecord> _$testedTestsRecordSerializer =
    new _$TestedTestsRecordSerializer();

class _$TestedTestsRecordSerializer
    implements StructuredSerializer<TestedTestsRecord> {
  @override
  final Iterable<Type> types = const [TestedTestsRecord, _$TestedTestsRecord];
  @override
  final String wireName = 'TestedTestsRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, TestedTestsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.testRef;
    if (value != null) {
      result
        ..add('test_ref')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    value = object.bookingRef;
    if (value != null) {
      result
        ..add('booking_ref')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    value = object.isVerified;
    if (value != null) {
      result
        ..add('is_verified')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.isFlagged;
    if (value != null) {
      result
        ..add('is_flagged')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.pathologistRef;
    if (value != null) {
      result
        ..add('pathologist_Ref')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    value = object.dateConducted;
    if (value != null) {
      result
        ..add('date_conducted')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.resultsPositive;
    if (value != null) {
      result
        ..add('results_positive')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.resultsAttachment;
    if (value != null) {
      result
        ..add('results_attachment')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.sampleReleased;
    if (value != null) {
      result
        ..add('sample_released')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.bookedTestRef;
    if (value != null) {
      result
        ..add('booked_test_Ref')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    value = object.machineUsed;
    if (value != null) {
      result
        ..add('machine_used')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    value = object.flaggedDate;
    if (value != null) {
      result
        ..add('flagged_date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.dateSampleCollected;
    if (value != null) {
      result
        ..add('date_sample_collected')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.labRefNum;
    if (value != null) {
      result
        ..add('labRefNum')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.testNote;
    if (value != null) {
      result
        ..add('test_note')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.pathologistNote;
    if (value != null) {
      result
        ..add('pathologist_note')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.testResult;
    if (value != null) {
      result
        ..add('test_result')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.flagNotes;
    if (value != null) {
      result
        ..add('flag_notes')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.resultPosted;
    if (value != null) {
      result
        ..add('resultPosted')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.staffReference;
    if (value != null) {
      result
        ..add('staff_Reference')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    value = object.verifiedDate;
    if (value != null) {
      result
        ..add('verified_Date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.batchNum;
    if (value != null) {
      result
        ..add('batchNum')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
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
        ..add('testPackRef')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
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
  TestedTestsRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TestedTestsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'test_ref':
          result.testRef = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
        case 'booking_ref':
          result.bookingRef = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
        case 'is_verified':
          result.isVerified = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'is_flagged':
          result.isFlagged = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'pathologist_Ref':
          result.pathologistRef = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
        case 'date_conducted':
          result.dateConducted = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'results_positive':
          result.resultsPositive = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'results_attachment':
          result.resultsAttachment.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
        case 'sample_released':
          result.sampleReleased = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'booked_test_Ref':
          result.bookedTestRef = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
        case 'machine_used':
          result.machineUsed = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
        case 'flagged_date':
          result.flaggedDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'date_sample_collected':
          result.dateSampleCollected = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'labRefNum':
          result.labRefNum = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'test_note':
          result.testNote = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'pathologist_note':
          result.pathologistNote = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'test_result':
          result.testResult = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'flag_notes':
          result.flagNotes = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'resultPosted':
          result.resultPosted = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'staff_Reference':
          result.staffReference = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
        case 'verified_Date':
          result.verifiedDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'batchNum':
          result.batchNum = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'has_test_pack':
          result.hasTestPack = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'testPackRef':
          result.testPackRef = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
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

class _$TestedTestsRecord extends TestedTestsRecord {
  @override
  final DocumentReference<Object> testRef;
  @override
  final DocumentReference<Object> bookingRef;
  @override
  final bool isVerified;
  @override
  final bool isFlagged;
  @override
  final DocumentReference<Object> pathologistRef;
  @override
  final DateTime dateConducted;
  @override
  final bool resultsPositive;
  @override
  final BuiltList<String> resultsAttachment;
  @override
  final bool sampleReleased;
  @override
  final DocumentReference<Object> bookedTestRef;
  @override
  final DocumentReference<Object> machineUsed;
  @override
  final DateTime flaggedDate;
  @override
  final DateTime dateSampleCollected;
  @override
  final String labRefNum;
  @override
  final String testNote;
  @override
  final String pathologistNote;
  @override
  final String testResult;
  @override
  final String flagNotes;
  @override
  final bool resultPosted;
  @override
  final DocumentReference<Object> staffReference;
  @override
  final DateTime verifiedDate;
  @override
  final String batchNum;
  @override
  final bool hasTestPack;
  @override
  final DocumentReference<Object> testPackRef;
  @override
  final DocumentReference<Object> reference;

  factory _$TestedTestsRecord(
          [void Function(TestedTestsRecordBuilder) updates]) =>
      (new TestedTestsRecordBuilder()..update(updates))._build();

  _$TestedTestsRecord._(
      {this.testRef,
      this.bookingRef,
      this.isVerified,
      this.isFlagged,
      this.pathologistRef,
      this.dateConducted,
      this.resultsPositive,
      this.resultsAttachment,
      this.sampleReleased,
      this.bookedTestRef,
      this.machineUsed,
      this.flaggedDate,
      this.dateSampleCollected,
      this.labRefNum,
      this.testNote,
      this.pathologistNote,
      this.testResult,
      this.flagNotes,
      this.resultPosted,
      this.staffReference,
      this.verifiedDate,
      this.batchNum,
      this.hasTestPack,
      this.testPackRef,
      this.reference})
      : super._();

  @override
  TestedTestsRecord rebuild(void Function(TestedTestsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TestedTestsRecordBuilder toBuilder() =>
      new TestedTestsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TestedTestsRecord &&
        testRef == other.testRef &&
        bookingRef == other.bookingRef &&
        isVerified == other.isVerified &&
        isFlagged == other.isFlagged &&
        pathologistRef == other.pathologistRef &&
        dateConducted == other.dateConducted &&
        resultsPositive == other.resultsPositive &&
        resultsAttachment == other.resultsAttachment &&
        sampleReleased == other.sampleReleased &&
        bookedTestRef == other.bookedTestRef &&
        machineUsed == other.machineUsed &&
        flaggedDate == other.flaggedDate &&
        dateSampleCollected == other.dateSampleCollected &&
        labRefNum == other.labRefNum &&
        testNote == other.testNote &&
        pathologistNote == other.pathologistNote &&
        testResult == other.testResult &&
        flagNotes == other.flagNotes &&
        resultPosted == other.resultPosted &&
        staffReference == other.staffReference &&
        verifiedDate == other.verifiedDate &&
        batchNum == other.batchNum &&
        hasTestPack == other.hasTestPack &&
        testPackRef == other.testPackRef &&
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
                                            $jc(
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                $jc(
                                                                    $jc(
                                                                        $jc(
                                                                            $jc($jc($jc($jc($jc($jc($jc(0, testRef.hashCode), bookingRef.hashCode), isVerified.hashCode), isFlagged.hashCode), pathologistRef.hashCode), dateConducted.hashCode),
                                                                                resultsPositive.hashCode),
                                                                            resultsAttachment.hashCode),
                                                                        sampleReleased.hashCode),
                                                                    bookedTestRef.hashCode),
                                                                machineUsed.hashCode),
                                                            flaggedDate.hashCode),
                                                        dateSampleCollected.hashCode),
                                                    labRefNum.hashCode),
                                                testNote.hashCode),
                                            pathologistNote.hashCode),
                                        testResult.hashCode),
                                    flagNotes.hashCode),
                                resultPosted.hashCode),
                            staffReference.hashCode),
                        verifiedDate.hashCode),
                    batchNum.hashCode),
                hasTestPack.hashCode),
            testPackRef.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TestedTestsRecord')
          ..add('testRef', testRef)
          ..add('bookingRef', bookingRef)
          ..add('isVerified', isVerified)
          ..add('isFlagged', isFlagged)
          ..add('pathologistRef', pathologistRef)
          ..add('dateConducted', dateConducted)
          ..add('resultsPositive', resultsPositive)
          ..add('resultsAttachment', resultsAttachment)
          ..add('sampleReleased', sampleReleased)
          ..add('bookedTestRef', bookedTestRef)
          ..add('machineUsed', machineUsed)
          ..add('flaggedDate', flaggedDate)
          ..add('dateSampleCollected', dateSampleCollected)
          ..add('labRefNum', labRefNum)
          ..add('testNote', testNote)
          ..add('pathologistNote', pathologistNote)
          ..add('testResult', testResult)
          ..add('flagNotes', flagNotes)
          ..add('resultPosted', resultPosted)
          ..add('staffReference', staffReference)
          ..add('verifiedDate', verifiedDate)
          ..add('batchNum', batchNum)
          ..add('hasTestPack', hasTestPack)
          ..add('testPackRef', testPackRef)
          ..add('reference', reference))
        .toString();
  }
}

class TestedTestsRecordBuilder
    implements Builder<TestedTestsRecord, TestedTestsRecordBuilder> {
  _$TestedTestsRecord _$v;

  DocumentReference<Object> _testRef;
  DocumentReference<Object> get testRef => _$this._testRef;
  set testRef(DocumentReference<Object> testRef) => _$this._testRef = testRef;

  DocumentReference<Object> _bookingRef;
  DocumentReference<Object> get bookingRef => _$this._bookingRef;
  set bookingRef(DocumentReference<Object> bookingRef) =>
      _$this._bookingRef = bookingRef;

  bool _isVerified;
  bool get isVerified => _$this._isVerified;
  set isVerified(bool isVerified) => _$this._isVerified = isVerified;

  bool _isFlagged;
  bool get isFlagged => _$this._isFlagged;
  set isFlagged(bool isFlagged) => _$this._isFlagged = isFlagged;

  DocumentReference<Object> _pathologistRef;
  DocumentReference<Object> get pathologistRef => _$this._pathologistRef;
  set pathologistRef(DocumentReference<Object> pathologistRef) =>
      _$this._pathologistRef = pathologistRef;

  DateTime _dateConducted;
  DateTime get dateConducted => _$this._dateConducted;
  set dateConducted(DateTime dateConducted) =>
      _$this._dateConducted = dateConducted;

  bool _resultsPositive;
  bool get resultsPositive => _$this._resultsPositive;
  set resultsPositive(bool resultsPositive) =>
      _$this._resultsPositive = resultsPositive;

  ListBuilder<String> _resultsAttachment;
  ListBuilder<String> get resultsAttachment =>
      _$this._resultsAttachment ??= new ListBuilder<String>();
  set resultsAttachment(ListBuilder<String> resultsAttachment) =>
      _$this._resultsAttachment = resultsAttachment;

  bool _sampleReleased;
  bool get sampleReleased => _$this._sampleReleased;
  set sampleReleased(bool sampleReleased) =>
      _$this._sampleReleased = sampleReleased;

  DocumentReference<Object> _bookedTestRef;
  DocumentReference<Object> get bookedTestRef => _$this._bookedTestRef;
  set bookedTestRef(DocumentReference<Object> bookedTestRef) =>
      _$this._bookedTestRef = bookedTestRef;

  DocumentReference<Object> _machineUsed;
  DocumentReference<Object> get machineUsed => _$this._machineUsed;
  set machineUsed(DocumentReference<Object> machineUsed) =>
      _$this._machineUsed = machineUsed;

  DateTime _flaggedDate;
  DateTime get flaggedDate => _$this._flaggedDate;
  set flaggedDate(DateTime flaggedDate) => _$this._flaggedDate = flaggedDate;

  DateTime _dateSampleCollected;
  DateTime get dateSampleCollected => _$this._dateSampleCollected;
  set dateSampleCollected(DateTime dateSampleCollected) =>
      _$this._dateSampleCollected = dateSampleCollected;

  String _labRefNum;
  String get labRefNum => _$this._labRefNum;
  set labRefNum(String labRefNum) => _$this._labRefNum = labRefNum;

  String _testNote;
  String get testNote => _$this._testNote;
  set testNote(String testNote) => _$this._testNote = testNote;

  String _pathologistNote;
  String get pathologistNote => _$this._pathologistNote;
  set pathologistNote(String pathologistNote) =>
      _$this._pathologistNote = pathologistNote;

  String _testResult;
  String get testResult => _$this._testResult;
  set testResult(String testResult) => _$this._testResult = testResult;

  String _flagNotes;
  String get flagNotes => _$this._flagNotes;
  set flagNotes(String flagNotes) => _$this._flagNotes = flagNotes;

  bool _resultPosted;
  bool get resultPosted => _$this._resultPosted;
  set resultPosted(bool resultPosted) => _$this._resultPosted = resultPosted;

  DocumentReference<Object> _staffReference;
  DocumentReference<Object> get staffReference => _$this._staffReference;
  set staffReference(DocumentReference<Object> staffReference) =>
      _$this._staffReference = staffReference;

  DateTime _verifiedDate;
  DateTime get verifiedDate => _$this._verifiedDate;
  set verifiedDate(DateTime verifiedDate) =>
      _$this._verifiedDate = verifiedDate;

  String _batchNum;
  String get batchNum => _$this._batchNum;
  set batchNum(String batchNum) => _$this._batchNum = batchNum;

  bool _hasTestPack;
  bool get hasTestPack => _$this._hasTestPack;
  set hasTestPack(bool hasTestPack) => _$this._hasTestPack = hasTestPack;

  DocumentReference<Object> _testPackRef;
  DocumentReference<Object> get testPackRef => _$this._testPackRef;
  set testPackRef(DocumentReference<Object> testPackRef) =>
      _$this._testPackRef = testPackRef;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  TestedTestsRecordBuilder() {
    TestedTestsRecord._initializeBuilder(this);
  }

  TestedTestsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _testRef = $v.testRef;
      _bookingRef = $v.bookingRef;
      _isVerified = $v.isVerified;
      _isFlagged = $v.isFlagged;
      _pathologistRef = $v.pathologistRef;
      _dateConducted = $v.dateConducted;
      _resultsPositive = $v.resultsPositive;
      _resultsAttachment = $v.resultsAttachment?.toBuilder();
      _sampleReleased = $v.sampleReleased;
      _bookedTestRef = $v.bookedTestRef;
      _machineUsed = $v.machineUsed;
      _flaggedDate = $v.flaggedDate;
      _dateSampleCollected = $v.dateSampleCollected;
      _labRefNum = $v.labRefNum;
      _testNote = $v.testNote;
      _pathologistNote = $v.pathologistNote;
      _testResult = $v.testResult;
      _flagNotes = $v.flagNotes;
      _resultPosted = $v.resultPosted;
      _staffReference = $v.staffReference;
      _verifiedDate = $v.verifiedDate;
      _batchNum = $v.batchNum;
      _hasTestPack = $v.hasTestPack;
      _testPackRef = $v.testPackRef;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TestedTestsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TestedTestsRecord;
  }

  @override
  void update(void Function(TestedTestsRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  TestedTestsRecord build() => _build();

  _$TestedTestsRecord _build() {
    _$TestedTestsRecord _$result;
    try {
      _$result = _$v ??
          new _$TestedTestsRecord._(
              testRef: testRef,
              bookingRef: bookingRef,
              isVerified: isVerified,
              isFlagged: isFlagged,
              pathologistRef: pathologistRef,
              dateConducted: dateConducted,
              resultsPositive: resultsPositive,
              resultsAttachment: _resultsAttachment?.build(),
              sampleReleased: sampleReleased,
              bookedTestRef: bookedTestRef,
              machineUsed: machineUsed,
              flaggedDate: flaggedDate,
              dateSampleCollected: dateSampleCollected,
              labRefNum: labRefNum,
              testNote: testNote,
              pathologistNote: pathologistNote,
              testResult: testResult,
              flagNotes: flagNotes,
              resultPosted: resultPosted,
              staffReference: staffReference,
              verifiedDate: verifiedDate,
              batchNum: batchNum,
              hasTestPack: hasTestPack,
              testPackRef: testPackRef,
              reference: reference);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'resultsAttachment';
        _resultsAttachment?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'TestedTestsRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
