import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'invoices_record.g.dart';

abstract class InvoicesRecord
    implements Built<InvoicesRecord, InvoicesRecordBuilder> {
  static Serializer<InvoicesRecord> get serializer =>
      _$invoicesRecordSerializer;

  @BuiltValueField(wireName: 'booked_tests_list')
  BuiltList<DocumentReference>? get bookedTestsList;

  @BuiltValueField(wireName: 'created_date')
  DateTime? get createdDate;

  @BuiltValueField(wireName: 'created_by')
  DocumentReference? get createdBy;

  @BuiltValueField(wireName: 'is_paid')
  bool? get isPaid;

  @BuiltValueField(wireName: 'payment_submitted')
  bool? get paymentSubmitted;

  @BuiltValueField(wireName: 'full_amount')
  bool? get fullAmount;

  String? get labRefNum;

  @BuiltValueField(wireName: 'Booking_ref')
  DocumentReference? get bookingRef;

  @BuiltValueField(wireName: 'payments_list')
  BuiltList<DocumentReference>? get paymentsList;

  @BuiltValueField(wireName: 'Amount_due')
  double? get amountDue;

  DocumentReference? get user;

  @BuiltValueField(wireName: 'due_date')
  DateTime? get dueDate;

  DateTime? get updateDate;

  String? get updateRole;

  @BuiltValueField(wireName: 'Invoice_amount')
  double? get invoiceAmount;

  String? get invoiceNum;

  DocumentReference? get bookingUser;

  String? get userEmail;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(InvoicesRecordBuilder builder) => builder
    ..bookedTestsList = ListBuilder()
    ..isPaid = false
    ..paymentSubmitted = false
    ..fullAmount = false
    ..labRefNum = ''
    ..paymentsList = ListBuilder()
    ..amountDue = 0.0
    ..updateRole = ''
    ..invoiceAmount = 0.0
    ..invoiceNum = ''
    ..userEmail = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Invoices');

  static Stream<InvoicesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<InvoicesRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  InvoicesRecord._();
  factory InvoicesRecord([void Function(InvoicesRecordBuilder) updates]) =
      _$InvoicesRecord;

  static InvoicesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createInvoicesRecordData({
  DateTime? createdDate,
  DocumentReference? createdBy,
  bool? isPaid,
  bool? paymentSubmitted,
  bool? fullAmount,
  String? labRefNum,
  DocumentReference? bookingRef,
  double? amountDue,
  DocumentReference? user,
  DateTime? dueDate,
  DateTime? updateDate,
  String? updateRole,
  double? invoiceAmount,
  String? invoiceNum,
  DocumentReference? bookingUser,
  String? userEmail,
}) {
  final firestoreData = serializers.toFirestore(
    InvoicesRecord.serializer,
    InvoicesRecord(
      (i) => i
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
        ..invoiceAmount = invoiceAmount
        ..invoiceNum = invoiceNum
        ..bookingUser = bookingUser
        ..userEmail = userEmail,
    ),
  );

  return firestoreData;
}
