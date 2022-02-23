import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'invoices_record.g.dart';

abstract class InvoicesRecord
    implements Built<InvoicesRecord, InvoicesRecordBuilder> {
  static Serializer<InvoicesRecord> get serializer =>
      _$invoicesRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'booked_tests_list')
  BuiltList<DocumentReference> get bookedTestsList;

  @nullable
  @BuiltValueField(wireName: 'created_date')
  DateTime get createdDate;

  @nullable
  @BuiltValueField(wireName: 'created_by')
  DocumentReference get createdBy;

  @nullable
  @BuiltValueField(wireName: 'is_paid')
  bool get isPaid;

  @nullable
  @BuiltValueField(wireName: 'payment_submitted')
  bool get paymentSubmitted;

  @nullable
  @BuiltValueField(wireName: 'full_amount')
  bool get fullAmount;

  @nullable
  String get labRefNum;

  @nullable
  @BuiltValueField(wireName: 'Booking_ref')
  DocumentReference get bookingRef;

  @nullable
  @BuiltValueField(wireName: 'payments_list')
  BuiltList<DocumentReference> get paymentsList;

  @nullable
  @BuiltValueField(wireName: 'Amount_due')
  double get amountDue;

  @nullable
  DocumentReference get user;

  @nullable
  @BuiltValueField(wireName: 'due_date')
  DateTime get dueDate;

  @nullable
  DateTime get updateDate;

  @nullable
  String get updateRole;

  @nullable
  @BuiltValueField(wireName: 'Invoice_amount')
  double get invoiceAmount;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(InvoicesRecordBuilder builder) => builder
    ..bookedTestsList = ListBuilder()
    ..isPaid = false
    ..paymentSubmitted = false
    ..fullAmount = false
    ..labRefNum = ''
    ..paymentsList = ListBuilder()
    ..amountDue = 0.0
    ..updateRole = ''
    ..invoiceAmount = 0.0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Invoices');

  static Stream<InvoicesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<InvoicesRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  InvoicesRecord._();
  factory InvoicesRecord([void Function(InvoicesRecordBuilder) updates]) =
      _$InvoicesRecord;

  static InvoicesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createInvoicesRecordData({
  DateTime createdDate,
  DocumentReference createdBy,
  bool isPaid,
  bool paymentSubmitted,
  bool fullAmount,
  String labRefNum,
  DocumentReference bookingRef,
  double amountDue,
  DocumentReference user,
  DateTime dueDate,
  DateTime updateDate,
  String updateRole,
  double invoiceAmount,
}) =>
    serializers.toFirestore(
        InvoicesRecord.serializer,
        InvoicesRecord((i) => i
          ..bookedTestsList = null
          ..createdDate = createdDate
          ..createdBy = createdBy
          ..isPaid = isPaid
          ..paymentSubmitted = paymentSubmitted
          ..fullAmount = fullAmount
          ..labRefNum = labRefNum
          ..bookingRef = bookingRef
          ..paymentsList = null
          ..amountDue = amountDue
          ..user = user
          ..dueDate = dueDate
          ..updateDate = updateDate
          ..updateRole = updateRole
          ..invoiceAmount = invoiceAmount));
