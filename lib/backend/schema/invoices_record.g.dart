// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoices_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<InvoicesRecord> _$invoicesRecordSerializer =
    new _$InvoicesRecordSerializer();

class _$InvoicesRecordSerializer
    implements StructuredSerializer<InvoicesRecord> {
  @override
  final Iterable<Type> types = const [InvoicesRecord, _$InvoicesRecord];
  @override
  final String wireName = 'InvoicesRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, InvoicesRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.bookedTestsList;
    if (value != null) {
      result
        ..add('booked_tests_list')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(DocumentReference, const [const FullType(Object)])
            ])));
    }
    value = object.createdDate;
    if (value != null) {
      result
        ..add('created_date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.createdBy;
    if (value != null) {
      result
        ..add('created_by')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    value = object.isPaid;
    if (value != null) {
      result
        ..add('is_paid')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.paymentSubmitted;
    if (value != null) {
      result
        ..add('payment_submitted')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.fullAmount;
    if (value != null) {
      result
        ..add('full_amount')
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
    value = object.bookingRef;
    if (value != null) {
      result
        ..add('Booking_ref')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    value = object.paymentsList;
    if (value != null) {
      result
        ..add('payments_list')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(DocumentReference, const [const FullType(Object)])
            ])));
    }
    value = object.amountDue;
    if (value != null) {
      result
        ..add('Amount_due')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.user;
    if (value != null) {
      result
        ..add('user')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    value = object.dueDate;
    if (value != null) {
      result
        ..add('due_date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.updateDate;
    if (value != null) {
      result
        ..add('updateDate')
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
    value = object.invoiceAmount;
    if (value != null) {
      result
        ..add('Invoice_amount')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.invoiceNum;
    if (value != null) {
      result
        ..add('invoiceNum')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.bookingUser;
    if (value != null) {
      result
        ..add('bookingUser')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    value = object.userEmail;
    if (value != null) {
      result
        ..add('userEmail')
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
  InvoicesRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new InvoicesRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'booked_tests_list':
          result.bookedTestsList.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType(Object)])
              ])) as BuiltList<Object>);
          break;
        case 'created_date':
          result.createdDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'created_by':
          result.createdBy = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
        case 'is_paid':
          result.isPaid = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'payment_submitted':
          result.paymentSubmitted = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'full_amount':
          result.fullAmount = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'labRefNum':
          result.labRefNum = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'Booking_ref':
          result.bookingRef = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
        case 'payments_list':
          result.paymentsList.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType(Object)])
              ])) as BuiltList<Object>);
          break;
        case 'Amount_due':
          result.amountDue = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'user':
          result.user = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
        case 'due_date':
          result.dueDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'updateDate':
          result.updateDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'updateRole':
          result.updateRole = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'Invoice_amount':
          result.invoiceAmount = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'invoiceNum':
          result.invoiceNum = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'bookingUser':
          result.bookingUser = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
        case 'userEmail':
          result.userEmail = serializers.deserialize(value,
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

class _$InvoicesRecord extends InvoicesRecord {
  @override
  final BuiltList<DocumentReference<Object>> bookedTestsList;
  @override
  final DateTime createdDate;
  @override
  final DocumentReference<Object> createdBy;
  @override
  final bool isPaid;
  @override
  final bool paymentSubmitted;
  @override
  final bool fullAmount;
  @override
  final String labRefNum;
  @override
  final DocumentReference<Object> bookingRef;
  @override
  final BuiltList<DocumentReference<Object>> paymentsList;
  @override
  final double amountDue;
  @override
  final DocumentReference<Object> user;
  @override
  final DateTime dueDate;
  @override
  final DateTime updateDate;
  @override
  final String updateRole;
  @override
  final double invoiceAmount;
  @override
  final String invoiceNum;
  @override
  final DocumentReference<Object> bookingUser;
  @override
  final String userEmail;
  @override
  final DocumentReference<Object> reference;

  factory _$InvoicesRecord([void Function(InvoicesRecordBuilder) updates]) =>
      (new InvoicesRecordBuilder()..update(updates))._build();

  _$InvoicesRecord._(
      {this.bookedTestsList,
      this.createdDate,
      this.createdBy,
      this.isPaid,
      this.paymentSubmitted,
      this.fullAmount,
      this.labRefNum,
      this.bookingRef,
      this.paymentsList,
      this.amountDue,
      this.user,
      this.dueDate,
      this.updateDate,
      this.updateRole,
      this.invoiceAmount,
      this.invoiceNum,
      this.bookingUser,
      this.userEmail,
      this.reference})
      : super._();

  @override
  InvoicesRecord rebuild(void Function(InvoicesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  InvoicesRecordBuilder toBuilder() =>
      new InvoicesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is InvoicesRecord &&
        bookedTestsList == other.bookedTestsList &&
        createdDate == other.createdDate &&
        createdBy == other.createdBy &&
        isPaid == other.isPaid &&
        paymentSubmitted == other.paymentSubmitted &&
        fullAmount == other.fullAmount &&
        labRefNum == other.labRefNum &&
        bookingRef == other.bookingRef &&
        paymentsList == other.paymentsList &&
        amountDue == other.amountDue &&
        user == other.user &&
        dueDate == other.dueDate &&
        updateDate == other.updateDate &&
        updateRole == other.updateRole &&
        invoiceAmount == other.invoiceAmount &&
        invoiceNum == other.invoiceNum &&
        bookingUser == other.bookingUser &&
        userEmail == other.userEmail &&
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
                                                                            $jc(
                                                                                0,
                                                                                bookedTestsList
                                                                                    .hashCode),
                                                                            createdDate
                                                                                .hashCode),
                                                                        createdBy
                                                                            .hashCode),
                                                                    isPaid
                                                                        .hashCode),
                                                                paymentSubmitted
                                                                    .hashCode),
                                                            fullAmount
                                                                .hashCode),
                                                        labRefNum.hashCode),
                                                    bookingRef.hashCode),
                                                paymentsList.hashCode),
                                            amountDue.hashCode),
                                        user.hashCode),
                                    dueDate.hashCode),
                                updateDate.hashCode),
                            updateRole.hashCode),
                        invoiceAmount.hashCode),
                    invoiceNum.hashCode),
                bookingUser.hashCode),
            userEmail.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'InvoicesRecord')
          ..add('bookedTestsList', bookedTestsList)
          ..add('createdDate', createdDate)
          ..add('createdBy', createdBy)
          ..add('isPaid', isPaid)
          ..add('paymentSubmitted', paymentSubmitted)
          ..add('fullAmount', fullAmount)
          ..add('labRefNum', labRefNum)
          ..add('bookingRef', bookingRef)
          ..add('paymentsList', paymentsList)
          ..add('amountDue', amountDue)
          ..add('user', user)
          ..add('dueDate', dueDate)
          ..add('updateDate', updateDate)
          ..add('updateRole', updateRole)
          ..add('invoiceAmount', invoiceAmount)
          ..add('invoiceNum', invoiceNum)
          ..add('bookingUser', bookingUser)
          ..add('userEmail', userEmail)
          ..add('reference', reference))
        .toString();
  }
}

class InvoicesRecordBuilder
    implements Builder<InvoicesRecord, InvoicesRecordBuilder> {
  _$InvoicesRecord _$v;

  ListBuilder<DocumentReference<Object>> _bookedTestsList;
  ListBuilder<DocumentReference<Object>> get bookedTestsList =>
      _$this._bookedTestsList ??= new ListBuilder<DocumentReference<Object>>();
  set bookedTestsList(ListBuilder<DocumentReference<Object>> bookedTestsList) =>
      _$this._bookedTestsList = bookedTestsList;

  DateTime _createdDate;
  DateTime get createdDate => _$this._createdDate;
  set createdDate(DateTime createdDate) => _$this._createdDate = createdDate;

  DocumentReference<Object> _createdBy;
  DocumentReference<Object> get createdBy => _$this._createdBy;
  set createdBy(DocumentReference<Object> createdBy) =>
      _$this._createdBy = createdBy;

  bool _isPaid;
  bool get isPaid => _$this._isPaid;
  set isPaid(bool isPaid) => _$this._isPaid = isPaid;

  bool _paymentSubmitted;
  bool get paymentSubmitted => _$this._paymentSubmitted;
  set paymentSubmitted(bool paymentSubmitted) =>
      _$this._paymentSubmitted = paymentSubmitted;

  bool _fullAmount;
  bool get fullAmount => _$this._fullAmount;
  set fullAmount(bool fullAmount) => _$this._fullAmount = fullAmount;

  String _labRefNum;
  String get labRefNum => _$this._labRefNum;
  set labRefNum(String labRefNum) => _$this._labRefNum = labRefNum;

  DocumentReference<Object> _bookingRef;
  DocumentReference<Object> get bookingRef => _$this._bookingRef;
  set bookingRef(DocumentReference<Object> bookingRef) =>
      _$this._bookingRef = bookingRef;

  ListBuilder<DocumentReference<Object>> _paymentsList;
  ListBuilder<DocumentReference<Object>> get paymentsList =>
      _$this._paymentsList ??= new ListBuilder<DocumentReference<Object>>();
  set paymentsList(ListBuilder<DocumentReference<Object>> paymentsList) =>
      _$this._paymentsList = paymentsList;

  double _amountDue;
  double get amountDue => _$this._amountDue;
  set amountDue(double amountDue) => _$this._amountDue = amountDue;

  DocumentReference<Object> _user;
  DocumentReference<Object> get user => _$this._user;
  set user(DocumentReference<Object> user) => _$this._user = user;

  DateTime _dueDate;
  DateTime get dueDate => _$this._dueDate;
  set dueDate(DateTime dueDate) => _$this._dueDate = dueDate;

  DateTime _updateDate;
  DateTime get updateDate => _$this._updateDate;
  set updateDate(DateTime updateDate) => _$this._updateDate = updateDate;

  String _updateRole;
  String get updateRole => _$this._updateRole;
  set updateRole(String updateRole) => _$this._updateRole = updateRole;

  double _invoiceAmount;
  double get invoiceAmount => _$this._invoiceAmount;
  set invoiceAmount(double invoiceAmount) =>
      _$this._invoiceAmount = invoiceAmount;

  String _invoiceNum;
  String get invoiceNum => _$this._invoiceNum;
  set invoiceNum(String invoiceNum) => _$this._invoiceNum = invoiceNum;

  DocumentReference<Object> _bookingUser;
  DocumentReference<Object> get bookingUser => _$this._bookingUser;
  set bookingUser(DocumentReference<Object> bookingUser) =>
      _$this._bookingUser = bookingUser;

  String _userEmail;
  String get userEmail => _$this._userEmail;
  set userEmail(String userEmail) => _$this._userEmail = userEmail;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  InvoicesRecordBuilder() {
    InvoicesRecord._initializeBuilder(this);
  }

  InvoicesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _bookedTestsList = $v.bookedTestsList?.toBuilder();
      _createdDate = $v.createdDate;
      _createdBy = $v.createdBy;
      _isPaid = $v.isPaid;
      _paymentSubmitted = $v.paymentSubmitted;
      _fullAmount = $v.fullAmount;
      _labRefNum = $v.labRefNum;
      _bookingRef = $v.bookingRef;
      _paymentsList = $v.paymentsList?.toBuilder();
      _amountDue = $v.amountDue;
      _user = $v.user;
      _dueDate = $v.dueDate;
      _updateDate = $v.updateDate;
      _updateRole = $v.updateRole;
      _invoiceAmount = $v.invoiceAmount;
      _invoiceNum = $v.invoiceNum;
      _bookingUser = $v.bookingUser;
      _userEmail = $v.userEmail;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(InvoicesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$InvoicesRecord;
  }

  @override
  void update(void Function(InvoicesRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  InvoicesRecord build() => _build();

  _$InvoicesRecord _build() {
    _$InvoicesRecord _$result;
    try {
      _$result = _$v ??
          new _$InvoicesRecord._(
              bookedTestsList: _bookedTestsList?.build(),
              createdDate: createdDate,
              createdBy: createdBy,
              isPaid: isPaid,
              paymentSubmitted: paymentSubmitted,
              fullAmount: fullAmount,
              labRefNum: labRefNum,
              bookingRef: bookingRef,
              paymentsList: _paymentsList?.build(),
              amountDue: amountDue,
              user: user,
              dueDate: dueDate,
              updateDate: updateDate,
              updateRole: updateRole,
              invoiceAmount: invoiceAmount,
              invoiceNum: invoiceNum,
              bookingUser: bookingUser,
              userEmail: userEmail,
              reference: reference);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'bookedTestsList';
        _bookedTestsList?.build();

        _$failedField = 'paymentsList';
        _paymentsList?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'InvoicesRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
