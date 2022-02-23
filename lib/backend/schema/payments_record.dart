import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'payments_record.g.dart';

abstract class PaymentsRecord
    implements Built<PaymentsRecord, PaymentsRecordBuilder> {
  static Serializer<PaymentsRecord> get serializer =>
      _$paymentsRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'user_ref')
  DocumentReference get userRef;

  @nullable
  @BuiltValueField(wireName: 'booking_ref')
  DocumentReference get bookingRef;

  @nullable
  String get type;

  @nullable
  @BuiltValueField(wireName: 'transaction_code')
  String get transactionCode;

  @nullable
  @BuiltValueField(wireName: 'created_date')
  DateTime get createdDate;

  @nullable
  @BuiltValueField(wireName: 'is_approved')
  bool get isApproved;

  @nullable
  @BuiltValueField(wireName: 'invoice_ref')
  DocumentReference get invoiceRef;

  @nullable
  int get amount;

  @nullable
  @BuiltValueField(wireName: 'first_name')
  String get firstName;

  @nullable
  @BuiltValueField(wireName: 'last_name')
  String get lastName;

  @nullable
  @BuiltValueField(wireName: 'payment_notes')
  String get paymentNotes;

  @nullable
  @BuiltValueField(wireName: 'transaction_date')
  DateTime get transactionDate;

  @nullable
  @BuiltValueField(wireName: 'updated_date')
  DateTime get updatedDate;

  @nullable
  @BuiltValueField(wireName: 'has_receipt')
  bool get hasReceipt;

  @nullable
  String get updateRole;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(PaymentsRecordBuilder builder) => builder
    ..type = ''
    ..transactionCode = ''
    ..isApproved = false
    ..amount = 0
    ..firstName = ''
    ..lastName = ''
    ..paymentNotes = ''
    ..hasReceipt = false
    ..updateRole = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('payments');

  static Stream<PaymentsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<PaymentsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  PaymentsRecord._();
  factory PaymentsRecord([void Function(PaymentsRecordBuilder) updates]) =
      _$PaymentsRecord;

  static PaymentsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createPaymentsRecordData({
  DocumentReference userRef,
  DocumentReference bookingRef,
  String type,
  String transactionCode,
  DateTime createdDate,
  bool isApproved,
  DocumentReference invoiceRef,
  int amount,
  String firstName,
  String lastName,
  String paymentNotes,
  DateTime transactionDate,
  DateTime updatedDate,
  bool hasReceipt,
  String updateRole,
}) =>
    serializers.toFirestore(
        PaymentsRecord.serializer,
        PaymentsRecord((p) => p
          ..userRef = userRef
          ..bookingRef = bookingRef
          ..type = type
          ..transactionCode = transactionCode
          ..createdDate = createdDate
          ..isApproved = isApproved
          ..invoiceRef = invoiceRef
          ..amount = amount
          ..firstName = firstName
          ..lastName = lastName
          ..paymentNotes = paymentNotes
          ..transactionDate = transactionDate
          ..updatedDate = updatedDate
          ..hasReceipt = hasReceipt
          ..updateRole = updateRole));
