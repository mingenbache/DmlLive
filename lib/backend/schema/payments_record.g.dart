// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payments_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PaymentsRecord> _$paymentsRecordSerializer =
    new _$PaymentsRecordSerializer();

class _$PaymentsRecordSerializer
    implements StructuredSerializer<PaymentsRecord> {
  @override
  final Iterable<Type> types = const [PaymentsRecord, _$PaymentsRecord];
  @override
  final String wireName = 'PaymentsRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, PaymentsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.userRef;
    if (value != null) {
      result
        ..add('user_ref')
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
    value = object.type;
    if (value != null) {
      result
        ..add('type')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.transactionCode;
    if (value != null) {
      result
        ..add('transaction_code')
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
    value = object.isApproved;
    if (value != null) {
      result
        ..add('is_approved')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.invoiceRef;
    if (value != null) {
      result
        ..add('invoice_ref')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    value = object.amount;
    if (value != null) {
      result
        ..add('amount')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
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
    value = object.paymentNotes;
    if (value != null) {
      result
        ..add('payment_notes')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.transactionDate;
    if (value != null) {
      result
        ..add('transaction_date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.updatedDate;
    if (value != null) {
      result
        ..add('updated_date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.hasReceipt;
    if (value != null) {
      result
        ..add('has_receipt')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.updateRole;
    if (value != null) {
      result
        ..add('updateRole')
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
  PaymentsRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PaymentsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'user_ref':
          result.userRef = serializers.deserialize(value,
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
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'transaction_code':
          result.transactionCode = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'created_date':
          result.createdDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'is_approved':
          result.isApproved = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'invoice_ref':
          result.invoiceRef = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
        case 'amount':
          result.amount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'first_name':
          result.firstName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'last_name':
          result.lastName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'payment_notes':
          result.paymentNotes = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'transaction_date':
          result.transactionDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'updated_date':
          result.updatedDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'has_receipt':
          result.hasReceipt = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'updateRole':
          result.updateRole = serializers.deserialize(value,
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

class _$PaymentsRecord extends PaymentsRecord {
  @override
  final DocumentReference<Object> userRef;
  @override
  final DocumentReference<Object> bookingRef;
  @override
  final String type;
  @override
  final String transactionCode;
  @override
  final DateTime createdDate;
  @override
  final bool isApproved;
  @override
  final DocumentReference<Object> invoiceRef;
  @override
  final int amount;
  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String paymentNotes;
  @override
  final DateTime transactionDate;
  @override
  final DateTime updatedDate;
  @override
  final bool hasReceipt;
  @override
  final String updateRole;
  @override
  final DocumentReference<Object> reference;

  factory _$PaymentsRecord([void Function(PaymentsRecordBuilder) updates]) =>
      (new PaymentsRecordBuilder()..update(updates)).build();

  _$PaymentsRecord._(
      {this.userRef,
      this.bookingRef,
      this.type,
      this.transactionCode,
      this.createdDate,
      this.isApproved,
      this.invoiceRef,
      this.amount,
      this.firstName,
      this.lastName,
      this.paymentNotes,
      this.transactionDate,
      this.updatedDate,
      this.hasReceipt,
      this.updateRole,
      this.reference})
      : super._();

  @override
  PaymentsRecord rebuild(void Function(PaymentsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PaymentsRecordBuilder toBuilder() =>
      new PaymentsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PaymentsRecord &&
        userRef == other.userRef &&
        bookingRef == other.bookingRef &&
        type == other.type &&
        transactionCode == other.transactionCode &&
        createdDate == other.createdDate &&
        isApproved == other.isApproved &&
        invoiceRef == other.invoiceRef &&
        amount == other.amount &&
        firstName == other.firstName &&
        lastName == other.lastName &&
        paymentNotes == other.paymentNotes &&
        transactionDate == other.transactionDate &&
        updatedDate == other.updatedDate &&
        hasReceipt == other.hasReceipt &&
        updateRole == other.updateRole &&
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
                                                                    0,
                                                                    userRef
                                                                        .hashCode),
                                                                bookingRef
                                                                    .hashCode),
                                                            type.hashCode),
                                                        transactionCode
                                                            .hashCode),
                                                    createdDate.hashCode),
                                                isApproved.hashCode),
                                            invoiceRef.hashCode),
                                        amount.hashCode),
                                    firstName.hashCode),
                                lastName.hashCode),
                            paymentNotes.hashCode),
                        transactionDate.hashCode),
                    updatedDate.hashCode),
                hasReceipt.hashCode),
            updateRole.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PaymentsRecord')
          ..add('userRef', userRef)
          ..add('bookingRef', bookingRef)
          ..add('type', type)
          ..add('transactionCode', transactionCode)
          ..add('createdDate', createdDate)
          ..add('isApproved', isApproved)
          ..add('invoiceRef', invoiceRef)
          ..add('amount', amount)
          ..add('firstName', firstName)
          ..add('lastName', lastName)
          ..add('paymentNotes', paymentNotes)
          ..add('transactionDate', transactionDate)
          ..add('updatedDate', updatedDate)
          ..add('hasReceipt', hasReceipt)
          ..add('updateRole', updateRole)
          ..add('reference', reference))
        .toString();
  }
}

class PaymentsRecordBuilder
    implements Builder<PaymentsRecord, PaymentsRecordBuilder> {
  _$PaymentsRecord _$v;

  DocumentReference<Object> _userRef;
  DocumentReference<Object> get userRef => _$this._userRef;
  set userRef(DocumentReference<Object> userRef) => _$this._userRef = userRef;

  DocumentReference<Object> _bookingRef;
  DocumentReference<Object> get bookingRef => _$this._bookingRef;
  set bookingRef(DocumentReference<Object> bookingRef) =>
      _$this._bookingRef = bookingRef;

  String _type;
  String get type => _$this._type;
  set type(String type) => _$this._type = type;

  String _transactionCode;
  String get transactionCode => _$this._transactionCode;
  set transactionCode(String transactionCode) =>
      _$this._transactionCode = transactionCode;

  DateTime _createdDate;
  DateTime get createdDate => _$this._createdDate;
  set createdDate(DateTime createdDate) => _$this._createdDate = createdDate;

  bool _isApproved;
  bool get isApproved => _$this._isApproved;
  set isApproved(bool isApproved) => _$this._isApproved = isApproved;

  DocumentReference<Object> _invoiceRef;
  DocumentReference<Object> get invoiceRef => _$this._invoiceRef;
  set invoiceRef(DocumentReference<Object> invoiceRef) =>
      _$this._invoiceRef = invoiceRef;

  int _amount;
  int get amount => _$this._amount;
  set amount(int amount) => _$this._amount = amount;

  String _firstName;
  String get firstName => _$this._firstName;
  set firstName(String firstName) => _$this._firstName = firstName;

  String _lastName;
  String get lastName => _$this._lastName;
  set lastName(String lastName) => _$this._lastName = lastName;

  String _paymentNotes;
  String get paymentNotes => _$this._paymentNotes;
  set paymentNotes(String paymentNotes) => _$this._paymentNotes = paymentNotes;

  DateTime _transactionDate;
  DateTime get transactionDate => _$this._transactionDate;
  set transactionDate(DateTime transactionDate) =>
      _$this._transactionDate = transactionDate;

  DateTime _updatedDate;
  DateTime get updatedDate => _$this._updatedDate;
  set updatedDate(DateTime updatedDate) => _$this._updatedDate = updatedDate;

  bool _hasReceipt;
  bool get hasReceipt => _$this._hasReceipt;
  set hasReceipt(bool hasReceipt) => _$this._hasReceipt = hasReceipt;

  String _updateRole;
  String get updateRole => _$this._updateRole;
  set updateRole(String updateRole) => _$this._updateRole = updateRole;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  PaymentsRecordBuilder() {
    PaymentsRecord._initializeBuilder(this);
  }

  PaymentsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _userRef = $v.userRef;
      _bookingRef = $v.bookingRef;
      _type = $v.type;
      _transactionCode = $v.transactionCode;
      _createdDate = $v.createdDate;
      _isApproved = $v.isApproved;
      _invoiceRef = $v.invoiceRef;
      _amount = $v.amount;
      _firstName = $v.firstName;
      _lastName = $v.lastName;
      _paymentNotes = $v.paymentNotes;
      _transactionDate = $v.transactionDate;
      _updatedDate = $v.updatedDate;
      _hasReceipt = $v.hasReceipt;
      _updateRole = $v.updateRole;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PaymentsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PaymentsRecord;
  }

  @override
  void update(void Function(PaymentsRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PaymentsRecord build() {
    final _$result = _$v ??
        new _$PaymentsRecord._(
            userRef: userRef,
            bookingRef: bookingRef,
            type: type,
            transactionCode: transactionCode,
            createdDate: createdDate,
            isApproved: isApproved,
            invoiceRef: invoiceRef,
            amount: amount,
            firstName: firstName,
            lastName: lastName,
            paymentNotes: paymentNotes,
            transactionDate: transactionDate,
            updatedDate: updatedDate,
            hasReceipt: hasReceipt,
            updateRole: updateRole,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
