// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notifications_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<NotificationsRecord> _$notificationsRecordSerializer =
    new _$NotificationsRecordSerializer();

class _$NotificationsRecordSerializer
    implements StructuredSerializer<NotificationsRecord> {
  @override
  final Iterable<Type> types = const [
    NotificationsRecord,
    _$NotificationsRecord
  ];
  @override
  final String wireName = 'NotificationsRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, NotificationsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.userRole;
    if (value != null) {
      result
        ..add('user_role')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.message;
    if (value != null) {
      result
        ..add('message')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.usersReceiving;
    if (value != null) {
      result
        ..add('users_receiving')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.createdDate;
    if (value != null) {
      result
        ..add('created_date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.isSeen;
    if (value != null) {
      result
        ..add('isSeen')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.usersSeen;
    if (value != null) {
      result
        ..add('usersSeen')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.isBooking;
    if (value != null) {
      result
        ..add('isBooking')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.isTest;
    if (value != null) {
      result
        ..add('isTest')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.type;
    if (value != null) {
      result
        ..add('type')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.bookingRef;
    if (value != null) {
      result
        ..add('bookingRef')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.userRef;
    if (value != null) {
      result
        ..add('userRef')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.testedtestref;
    if (value != null) {
      result
        ..add('testedtestref')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.staffref;
    if (value != null) {
      result
        ..add('staffref')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.reportref;
    if (value != null) {
      result
        ..add('reportref')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.testref;
    if (value != null) {
      result
        ..add('testref')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.testpackageref;
    if (value != null) {
      result
        ..add('testpackageref')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.actionstaffuser;
    if (value != null) {
      result
        ..add('actionstaffuser')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.istestedtest;
    if (value != null) {
      result
        ..add('istestedtest')
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
  NotificationsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new NotificationsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'user_role':
          result.userRole = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'message':
          result.message = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'users_receiving':
          result.usersReceiving.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'created_date':
          result.createdDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'isSeen':
          result.isSeen = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'usersSeen':
          result.usersSeen.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'isBooking':
          result.isBooking = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'isTest':
          result.isTest = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'bookingRef':
          result.bookingRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'userRef':
          result.userRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'testedtestref':
          result.testedtestref = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'staffref':
          result.staffref = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'reportref':
          result.reportref = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'testref':
          result.testref = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'testpackageref':
          result.testpackageref = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'actionstaffuser':
          result.actionstaffuser = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'istestedtest':
          result.istestedtest = serializers.deserialize(value,
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

class _$NotificationsRecord extends NotificationsRecord {
  @override
  final String? userRole;
  @override
  final String? message;
  @override
  final BuiltList<DocumentReference<Object?>>? usersReceiving;
  @override
  final DateTime? createdDate;
  @override
  final bool? isSeen;
  @override
  final BuiltList<DocumentReference<Object?>>? usersSeen;
  @override
  final bool? isBooking;
  @override
  final bool? isTest;
  @override
  final String? type;
  @override
  final DocumentReference<Object?>? bookingRef;
  @override
  final DocumentReference<Object?>? userRef;
  @override
  final DocumentReference<Object?>? testedtestref;
  @override
  final DocumentReference<Object?>? staffref;
  @override
  final DocumentReference<Object?>? reportref;
  @override
  final DocumentReference<Object?>? testref;
  @override
  final DocumentReference<Object?>? testpackageref;
  @override
  final DocumentReference<Object?>? actionstaffuser;
  @override
  final bool? istestedtest;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$NotificationsRecord(
          [void Function(NotificationsRecordBuilder)? updates]) =>
      (new NotificationsRecordBuilder()..update(updates))._build();

  _$NotificationsRecord._(
      {this.userRole,
      this.message,
      this.usersReceiving,
      this.createdDate,
      this.isSeen,
      this.usersSeen,
      this.isBooking,
      this.isTest,
      this.type,
      this.bookingRef,
      this.userRef,
      this.testedtestref,
      this.staffref,
      this.reportref,
      this.testref,
      this.testpackageref,
      this.actionstaffuser,
      this.istestedtest,
      this.ffRef})
      : super._();

  @override
  NotificationsRecord rebuild(
          void Function(NotificationsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NotificationsRecordBuilder toBuilder() =>
      new NotificationsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NotificationsRecord &&
        userRole == other.userRole &&
        message == other.message &&
        usersReceiving == other.usersReceiving &&
        createdDate == other.createdDate &&
        isSeen == other.isSeen &&
        usersSeen == other.usersSeen &&
        isBooking == other.isBooking &&
        isTest == other.isTest &&
        type == other.type &&
        bookingRef == other.bookingRef &&
        userRef == other.userRef &&
        testedtestref == other.testedtestref &&
        staffref == other.staffref &&
        reportref == other.reportref &&
        testref == other.testref &&
        testpackageref == other.testpackageref &&
        actionstaffuser == other.actionstaffuser &&
        istestedtest == other.istestedtest &&
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
                                                                            $jc(
                                                                                0,
                                                                                userRole
                                                                                    .hashCode),
                                                                            message
                                                                                .hashCode),
                                                                        usersReceiving
                                                                            .hashCode),
                                                                    createdDate
                                                                        .hashCode),
                                                                isSeen
                                                                    .hashCode),
                                                            usersSeen.hashCode),
                                                        isBooking.hashCode),
                                                    isTest.hashCode),
                                                type.hashCode),
                                            bookingRef.hashCode),
                                        userRef.hashCode),
                                    testedtestref.hashCode),
                                staffref.hashCode),
                            reportref.hashCode),
                        testref.hashCode),
                    testpackageref.hashCode),
                actionstaffuser.hashCode),
            istestedtest.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NotificationsRecord')
          ..add('userRole', userRole)
          ..add('message', message)
          ..add('usersReceiving', usersReceiving)
          ..add('createdDate', createdDate)
          ..add('isSeen', isSeen)
          ..add('usersSeen', usersSeen)
          ..add('isBooking', isBooking)
          ..add('isTest', isTest)
          ..add('type', type)
          ..add('bookingRef', bookingRef)
          ..add('userRef', userRef)
          ..add('testedtestref', testedtestref)
          ..add('staffref', staffref)
          ..add('reportref', reportref)
          ..add('testref', testref)
          ..add('testpackageref', testpackageref)
          ..add('actionstaffuser', actionstaffuser)
          ..add('istestedtest', istestedtest)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class NotificationsRecordBuilder
    implements Builder<NotificationsRecord, NotificationsRecordBuilder> {
  _$NotificationsRecord? _$v;

  String? _userRole;
  String? get userRole => _$this._userRole;
  set userRole(String? userRole) => _$this._userRole = userRole;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  ListBuilder<DocumentReference<Object?>>? _usersReceiving;
  ListBuilder<DocumentReference<Object?>> get usersReceiving =>
      _$this._usersReceiving ??= new ListBuilder<DocumentReference<Object?>>();
  set usersReceiving(ListBuilder<DocumentReference<Object?>>? usersReceiving) =>
      _$this._usersReceiving = usersReceiving;

  DateTime? _createdDate;
  DateTime? get createdDate => _$this._createdDate;
  set createdDate(DateTime? createdDate) => _$this._createdDate = createdDate;

  bool? _isSeen;
  bool? get isSeen => _$this._isSeen;
  set isSeen(bool? isSeen) => _$this._isSeen = isSeen;

  ListBuilder<DocumentReference<Object?>>? _usersSeen;
  ListBuilder<DocumentReference<Object?>> get usersSeen =>
      _$this._usersSeen ??= new ListBuilder<DocumentReference<Object?>>();
  set usersSeen(ListBuilder<DocumentReference<Object?>>? usersSeen) =>
      _$this._usersSeen = usersSeen;

  bool? _isBooking;
  bool? get isBooking => _$this._isBooking;
  set isBooking(bool? isBooking) => _$this._isBooking = isBooking;

  bool? _isTest;
  bool? get isTest => _$this._isTest;
  set isTest(bool? isTest) => _$this._isTest = isTest;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  DocumentReference<Object?>? _bookingRef;
  DocumentReference<Object?>? get bookingRef => _$this._bookingRef;
  set bookingRef(DocumentReference<Object?>? bookingRef) =>
      _$this._bookingRef = bookingRef;

  DocumentReference<Object?>? _userRef;
  DocumentReference<Object?>? get userRef => _$this._userRef;
  set userRef(DocumentReference<Object?>? userRef) => _$this._userRef = userRef;

  DocumentReference<Object?>? _testedtestref;
  DocumentReference<Object?>? get testedtestref => _$this._testedtestref;
  set testedtestref(DocumentReference<Object?>? testedtestref) =>
      _$this._testedtestref = testedtestref;

  DocumentReference<Object?>? _staffref;
  DocumentReference<Object?>? get staffref => _$this._staffref;
  set staffref(DocumentReference<Object?>? staffref) =>
      _$this._staffref = staffref;

  DocumentReference<Object?>? _reportref;
  DocumentReference<Object?>? get reportref => _$this._reportref;
  set reportref(DocumentReference<Object?>? reportref) =>
      _$this._reportref = reportref;

  DocumentReference<Object?>? _testref;
  DocumentReference<Object?>? get testref => _$this._testref;
  set testref(DocumentReference<Object?>? testref) => _$this._testref = testref;

  DocumentReference<Object?>? _testpackageref;
  DocumentReference<Object?>? get testpackageref => _$this._testpackageref;
  set testpackageref(DocumentReference<Object?>? testpackageref) =>
      _$this._testpackageref = testpackageref;

  DocumentReference<Object?>? _actionstaffuser;
  DocumentReference<Object?>? get actionstaffuser => _$this._actionstaffuser;
  set actionstaffuser(DocumentReference<Object?>? actionstaffuser) =>
      _$this._actionstaffuser = actionstaffuser;

  bool? _istestedtest;
  bool? get istestedtest => _$this._istestedtest;
  set istestedtest(bool? istestedtest) => _$this._istestedtest = istestedtest;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  NotificationsRecordBuilder() {
    NotificationsRecord._initializeBuilder(this);
  }

  NotificationsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _userRole = $v.userRole;
      _message = $v.message;
      _usersReceiving = $v.usersReceiving?.toBuilder();
      _createdDate = $v.createdDate;
      _isSeen = $v.isSeen;
      _usersSeen = $v.usersSeen?.toBuilder();
      _isBooking = $v.isBooking;
      _isTest = $v.isTest;
      _type = $v.type;
      _bookingRef = $v.bookingRef;
      _userRef = $v.userRef;
      _testedtestref = $v.testedtestref;
      _staffref = $v.staffref;
      _reportref = $v.reportref;
      _testref = $v.testref;
      _testpackageref = $v.testpackageref;
      _actionstaffuser = $v.actionstaffuser;
      _istestedtest = $v.istestedtest;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NotificationsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NotificationsRecord;
  }

  @override
  void update(void Function(NotificationsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NotificationsRecord build() => _build();

  _$NotificationsRecord _build() {
    _$NotificationsRecord _$result;
    try {
      _$result = _$v ??
          new _$NotificationsRecord._(
              userRole: userRole,
              message: message,
              usersReceiving: _usersReceiving?.build(),
              createdDate: createdDate,
              isSeen: isSeen,
              usersSeen: _usersSeen?.build(),
              isBooking: isBooking,
              isTest: isTest,
              type: type,
              bookingRef: bookingRef,
              userRef: userRef,
              testedtestref: testedtestref,
              staffref: staffref,
              reportref: reportref,
              testref: testref,
              testpackageref: testpackageref,
              actionstaffuser: actionstaffuser,
              istestedtest: istestedtest,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'usersReceiving';
        _usersReceiving?.build();

        _$failedField = 'usersSeen';
        _usersSeen?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'NotificationsRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
