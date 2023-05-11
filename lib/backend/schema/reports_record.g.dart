// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reports_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ReportsRecord> _$reportsRecordSerializer =
    new _$ReportsRecordSerializer();

class _$ReportsRecordSerializer implements StructuredSerializer<ReportsRecord> {
  @override
  final Iterable<Type> types = const [ReportsRecord, _$ReportsRecord];
  @override
  final String wireName = 'ReportsRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, ReportsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.booking;
    if (value != null) {
      result
        ..add('booking')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.testedTests;
    if (value != null) {
      result
        ..add('testedTests')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.bookinguser;
    if (value != null) {
      result
        ..add('bookinguser')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.doctor;
    if (value != null) {
      result
        ..add('doctor')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.technologist;
    if (value != null) {
      result
        ..add('technologist')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.pathologistComments;
    if (value != null) {
      result
        ..add('pathologistComments')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.samplesReleased;
    if (value != null) {
      result
        ..add('samples_released')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.createdDate;
    if (value != null) {
      result
        ..add('createdDate')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.createdUser;
    if (value != null) {
      result
        ..add('createdUser')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.isComplete;
    if (value != null) {
      result
        ..add('isComplete')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.patientName;
    if (value != null) {
      result
        ..add('patientName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.patientSex;
    if (value != null) {
      result
        ..add('patientSex')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.labRefNum;
    if (value != null) {
      result
        ..add('labRefNum')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.pathologist;
    if (value != null) {
      result
        ..add('pathologist')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.dMLEmail;
    if (value != null) {
      result
        ..add('DML_Email')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.patientAge;
    if (value != null) {
      result
        ..add('patientAge')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.testpackageList;
    if (value != null) {
      result
        ..add('testpackageList')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
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
  ReportsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ReportsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'booking':
          result.booking = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'testedTests':
          result.testedTests.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'bookinguser':
          result.bookinguser = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'doctor':
          result.doctor = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'technologist':
          result.technologist.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'pathologistComments':
          result.pathologistComments = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'samples_released':
          result.samplesReleased.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'createdDate':
          result.createdDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'createdUser':
          result.createdUser = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'isComplete':
          result.isComplete = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'patientName':
          result.patientName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'patientSex':
          result.patientSex = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'labRefNum':
          result.labRefNum = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'pathologist':
          result.pathologist = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'DML_Email':
          result.dMLEmail = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'patientAge':
          result.patientAge = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'testpackageList':
          result.testpackageList.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
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

class _$ReportsRecord extends ReportsRecord {
  @override
  final DocumentReference<Object?>? booking;
  @override
  final BuiltList<DocumentReference<Object?>>? testedTests;
  @override
  final DocumentReference<Object?>? bookinguser;
  @override
  final DocumentReference<Object?>? doctor;
  @override
  final BuiltList<DocumentReference<Object?>>? technologist;
  @override
  final String? pathologistComments;
  @override
  final BuiltList<String>? samplesReleased;
  @override
  final DateTime? createdDate;
  @override
  final DocumentReference<Object?>? createdUser;
  @override
  final bool? isComplete;
  @override
  final String? patientName;
  @override
  final String? patientSex;
  @override
  final String? labRefNum;
  @override
  final String? pathologist;
  @override
  final String? dMLEmail;
  @override
  final int? patientAge;
  @override
  final BuiltList<DocumentReference<Object?>>? testpackageList;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$ReportsRecord([void Function(ReportsRecordBuilder)? updates]) =>
      (new ReportsRecordBuilder()..update(updates))._build();

  _$ReportsRecord._(
      {this.booking,
      this.testedTests,
      this.bookinguser,
      this.doctor,
      this.technologist,
      this.pathologistComments,
      this.samplesReleased,
      this.createdDate,
      this.createdUser,
      this.isComplete,
      this.patientName,
      this.patientSex,
      this.labRefNum,
      this.pathologist,
      this.dMLEmail,
      this.patientAge,
      this.testpackageList,
      this.ffRef})
      : super._();

  @override
  ReportsRecord rebuild(void Function(ReportsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ReportsRecordBuilder toBuilder() => new ReportsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ReportsRecord &&
        booking == other.booking &&
        testedTests == other.testedTests &&
        bookinguser == other.bookinguser &&
        doctor == other.doctor &&
        technologist == other.technologist &&
        pathologistComments == other.pathologistComments &&
        samplesReleased == other.samplesReleased &&
        createdDate == other.createdDate &&
        createdUser == other.createdUser &&
        isComplete == other.isComplete &&
        patientName == other.patientName &&
        patientSex == other.patientSex &&
        labRefNum == other.labRefNum &&
        pathologist == other.pathologist &&
        dMLEmail == other.dMLEmail &&
        patientAge == other.patientAge &&
        testpackageList == other.testpackageList &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, booking.hashCode);
    _$hash = $jc(_$hash, testedTests.hashCode);
    _$hash = $jc(_$hash, bookinguser.hashCode);
    _$hash = $jc(_$hash, doctor.hashCode);
    _$hash = $jc(_$hash, technologist.hashCode);
    _$hash = $jc(_$hash, pathologistComments.hashCode);
    _$hash = $jc(_$hash, samplesReleased.hashCode);
    _$hash = $jc(_$hash, createdDate.hashCode);
    _$hash = $jc(_$hash, createdUser.hashCode);
    _$hash = $jc(_$hash, isComplete.hashCode);
    _$hash = $jc(_$hash, patientName.hashCode);
    _$hash = $jc(_$hash, patientSex.hashCode);
    _$hash = $jc(_$hash, labRefNum.hashCode);
    _$hash = $jc(_$hash, pathologist.hashCode);
    _$hash = $jc(_$hash, dMLEmail.hashCode);
    _$hash = $jc(_$hash, patientAge.hashCode);
    _$hash = $jc(_$hash, testpackageList.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ReportsRecord')
          ..add('booking', booking)
          ..add('testedTests', testedTests)
          ..add('bookinguser', bookinguser)
          ..add('doctor', doctor)
          ..add('technologist', technologist)
          ..add('pathologistComments', pathologistComments)
          ..add('samplesReleased', samplesReleased)
          ..add('createdDate', createdDate)
          ..add('createdUser', createdUser)
          ..add('isComplete', isComplete)
          ..add('patientName', patientName)
          ..add('patientSex', patientSex)
          ..add('labRefNum', labRefNum)
          ..add('pathologist', pathologist)
          ..add('dMLEmail', dMLEmail)
          ..add('patientAge', patientAge)
          ..add('testpackageList', testpackageList)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class ReportsRecordBuilder
    implements Builder<ReportsRecord, ReportsRecordBuilder> {
  _$ReportsRecord? _$v;

  DocumentReference<Object?>? _booking;
  DocumentReference<Object?>? get booking => _$this._booking;
  set booking(DocumentReference<Object?>? booking) => _$this._booking = booking;

  ListBuilder<DocumentReference<Object?>>? _testedTests;
  ListBuilder<DocumentReference<Object?>> get testedTests =>
      _$this._testedTests ??= new ListBuilder<DocumentReference<Object?>>();
  set testedTests(ListBuilder<DocumentReference<Object?>>? testedTests) =>
      _$this._testedTests = testedTests;

  DocumentReference<Object?>? _bookinguser;
  DocumentReference<Object?>? get bookinguser => _$this._bookinguser;
  set bookinguser(DocumentReference<Object?>? bookinguser) =>
      _$this._bookinguser = bookinguser;

  DocumentReference<Object?>? _doctor;
  DocumentReference<Object?>? get doctor => _$this._doctor;
  set doctor(DocumentReference<Object?>? doctor) => _$this._doctor = doctor;

  ListBuilder<DocumentReference<Object?>>? _technologist;
  ListBuilder<DocumentReference<Object?>> get technologist =>
      _$this._technologist ??= new ListBuilder<DocumentReference<Object?>>();
  set technologist(ListBuilder<DocumentReference<Object?>>? technologist) =>
      _$this._technologist = technologist;

  String? _pathologistComments;
  String? get pathologistComments => _$this._pathologistComments;
  set pathologistComments(String? pathologistComments) =>
      _$this._pathologistComments = pathologistComments;

  ListBuilder<String>? _samplesReleased;
  ListBuilder<String> get samplesReleased =>
      _$this._samplesReleased ??= new ListBuilder<String>();
  set samplesReleased(ListBuilder<String>? samplesReleased) =>
      _$this._samplesReleased = samplesReleased;

  DateTime? _createdDate;
  DateTime? get createdDate => _$this._createdDate;
  set createdDate(DateTime? createdDate) => _$this._createdDate = createdDate;

  DocumentReference<Object?>? _createdUser;
  DocumentReference<Object?>? get createdUser => _$this._createdUser;
  set createdUser(DocumentReference<Object?>? createdUser) =>
      _$this._createdUser = createdUser;

  bool? _isComplete;
  bool? get isComplete => _$this._isComplete;
  set isComplete(bool? isComplete) => _$this._isComplete = isComplete;

  String? _patientName;
  String? get patientName => _$this._patientName;
  set patientName(String? patientName) => _$this._patientName = patientName;

  String? _patientSex;
  String? get patientSex => _$this._patientSex;
  set patientSex(String? patientSex) => _$this._patientSex = patientSex;

  String? _labRefNum;
  String? get labRefNum => _$this._labRefNum;
  set labRefNum(String? labRefNum) => _$this._labRefNum = labRefNum;

  String? _pathologist;
  String? get pathologist => _$this._pathologist;
  set pathologist(String? pathologist) => _$this._pathologist = pathologist;

  String? _dMLEmail;
  String? get dMLEmail => _$this._dMLEmail;
  set dMLEmail(String? dMLEmail) => _$this._dMLEmail = dMLEmail;

  int? _patientAge;
  int? get patientAge => _$this._patientAge;
  set patientAge(int? patientAge) => _$this._patientAge = patientAge;

  ListBuilder<DocumentReference<Object?>>? _testpackageList;
  ListBuilder<DocumentReference<Object?>> get testpackageList =>
      _$this._testpackageList ??= new ListBuilder<DocumentReference<Object?>>();
  set testpackageList(
          ListBuilder<DocumentReference<Object?>>? testpackageList) =>
      _$this._testpackageList = testpackageList;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  ReportsRecordBuilder() {
    ReportsRecord._initializeBuilder(this);
  }

  ReportsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _booking = $v.booking;
      _testedTests = $v.testedTests?.toBuilder();
      _bookinguser = $v.bookinguser;
      _doctor = $v.doctor;
      _technologist = $v.technologist?.toBuilder();
      _pathologistComments = $v.pathologistComments;
      _samplesReleased = $v.samplesReleased?.toBuilder();
      _createdDate = $v.createdDate;
      _createdUser = $v.createdUser;
      _isComplete = $v.isComplete;
      _patientName = $v.patientName;
      _patientSex = $v.patientSex;
      _labRefNum = $v.labRefNum;
      _pathologist = $v.pathologist;
      _dMLEmail = $v.dMLEmail;
      _patientAge = $v.patientAge;
      _testpackageList = $v.testpackageList?.toBuilder();
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ReportsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ReportsRecord;
  }

  @override
  void update(void Function(ReportsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ReportsRecord build() => _build();

  _$ReportsRecord _build() {
    _$ReportsRecord _$result;
    try {
      _$result = _$v ??
          new _$ReportsRecord._(
              booking: booking,
              testedTests: _testedTests?.build(),
              bookinguser: bookinguser,
              doctor: doctor,
              technologist: _technologist?.build(),
              pathologistComments: pathologistComments,
              samplesReleased: _samplesReleased?.build(),
              createdDate: createdDate,
              createdUser: createdUser,
              isComplete: isComplete,
              patientName: patientName,
              patientSex: patientSex,
              labRefNum: labRefNum,
              pathologist: pathologist,
              dMLEmail: dMLEmail,
              patientAge: patientAge,
              testpackageList: _testpackageList?.build(),
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'testedTests';
        _testedTests?.build();

        _$failedField = 'technologist';
        _technologist?.build();

        _$failedField = 'samplesReleased';
        _samplesReleased?.build();

        _$failedField = 'testpackageList';
        _testpackageList?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ReportsRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
