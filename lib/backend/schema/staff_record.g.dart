// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'staff_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<StaffRecord> _$staffRecordSerializer = new _$StaffRecordSerializer();

class _$StaffRecordSerializer implements StructuredSerializer<StaffRecord> {
  @override
  final Iterable<Type> types = const [StaffRecord, _$StaffRecord];
  @override
  final String wireName = 'StaffRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, StaffRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.email;
    if (value != null) {
      result
        ..add('email')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.firstName;
    if (value != null) {
      result
        ..add('first_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.lastName;
    if (value != null) {
      result
        ..add('last_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.role;
    if (value != null) {
      result
        ..add('role')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.userRef;
    if (value != null) {
      result
        ..add('UserRef')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    value = object.createDate;
    if (value != null) {
      result
        ..add('createDate')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.createUser;
    if (value != null) {
      result
        ..add('createUser')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    value = object.displayName;
    if (value != null) {
      result
        ..add('display_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
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
  StaffRecord deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new StaffRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'first_name':
          result.firstName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'last_name':
          result.lastName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'role':
          result.role = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'UserRef':
          result.userRef = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
        case 'createDate':
          result.createDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'createUser':
          result.createUser = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
        case 'display_name':
          result.displayName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
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

class _$StaffRecord extends StaffRecord {
  @override
  final String email;
  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String role;
  @override
  final DocumentReference<Object> userRef;
  @override
  final DateTime createDate;
  @override
  final DocumentReference<Object> createUser;
  @override
  final String displayName;
  @override
  final DocumentReference<Object> reference;

  factory _$StaffRecord([void Function(StaffRecordBuilder) updates]) =>
      (new StaffRecordBuilder()..update(updates))._build();

  _$StaffRecord._(
      {this.email,
      this.firstName,
      this.lastName,
      this.role,
      this.userRef,
      this.createDate,
      this.createUser,
      this.displayName,
      this.reference})
      : super._();

  @override
  StaffRecord rebuild(void Function(StaffRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  StaffRecordBuilder toBuilder() => new StaffRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is StaffRecord &&
        email == other.email &&
        firstName == other.firstName &&
        lastName == other.lastName &&
        role == other.role &&
        userRef == other.userRef &&
        createDate == other.createDate &&
        createUser == other.createUser &&
        displayName == other.displayName &&
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
                            $jc($jc($jc(0, email.hashCode), firstName.hashCode),
                                lastName.hashCode),
                            role.hashCode),
                        userRef.hashCode),
                    createDate.hashCode),
                createUser.hashCode),
            displayName.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'StaffRecord')
          ..add('email', email)
          ..add('firstName', firstName)
          ..add('lastName', lastName)
          ..add('role', role)
          ..add('userRef', userRef)
          ..add('createDate', createDate)
          ..add('createUser', createUser)
          ..add('displayName', displayName)
          ..add('reference', reference))
        .toString();
  }
}

class StaffRecordBuilder implements Builder<StaffRecord, StaffRecordBuilder> {
  _$StaffRecord _$v;

  String _email;
  String get email => _$this._email;
  set email(String email) => _$this._email = email;

  String _firstName;
  String get firstName => _$this._firstName;
  set firstName(String firstName) => _$this._firstName = firstName;

  String _lastName;
  String get lastName => _$this._lastName;
  set lastName(String lastName) => _$this._lastName = lastName;

  String _role;
  String get role => _$this._role;
  set role(String role) => _$this._role = role;

  DocumentReference<Object> _userRef;
  DocumentReference<Object> get userRef => _$this._userRef;
  set userRef(DocumentReference<Object> userRef) => _$this._userRef = userRef;

  DateTime _createDate;
  DateTime get createDate => _$this._createDate;
  set createDate(DateTime createDate) => _$this._createDate = createDate;

  DocumentReference<Object> _createUser;
  DocumentReference<Object> get createUser => _$this._createUser;
  set createUser(DocumentReference<Object> createUser) =>
      _$this._createUser = createUser;

  String _displayName;
  String get displayName => _$this._displayName;
  set displayName(String displayName) => _$this._displayName = displayName;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  StaffRecordBuilder() {
    StaffRecord._initializeBuilder(this);
  }

  StaffRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _email = $v.email;
      _firstName = $v.firstName;
      _lastName = $v.lastName;
      _role = $v.role;
      _userRef = $v.userRef;
      _createDate = $v.createDate;
      _createUser = $v.createUser;
      _displayName = $v.displayName;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(StaffRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$StaffRecord;
  }

  @override
  void update(void Function(StaffRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  StaffRecord build() => _build();

  _$StaffRecord _build() {
    final _$result = _$v ??
        new _$StaffRecord._(
            email: email,
            firstName: firstName,
            lastName: lastName,
            role: role,
            userRef: userRef,
            createDate: createDate,
            createUser: createUser,
            displayName: displayName,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
