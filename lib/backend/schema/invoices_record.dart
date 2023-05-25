import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class InvoicesRecord extends FirestoreRecord {
  InvoicesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "booked_tests_list" field.
  List<DocumentReference>? _bookedTestsList;
  List<DocumentReference> get bookedTestsList => _bookedTestsList ?? const [];
  bool hasBookedTestsList() => _bookedTestsList != null;

  // "created_date" field.
  DateTime? _createdDate;
  DateTime? get createdDate => _createdDate;
  bool hasCreatedDate() => _createdDate != null;

  // "created_by" field.
  DocumentReference? _createdBy;
  DocumentReference? get createdBy => _createdBy;
  bool hasCreatedBy() => _createdBy != null;

  // "is_paid" field.
  bool? _isPaid;
  bool get isPaid => _isPaid ?? false;
  bool hasIsPaid() => _isPaid != null;

  // "payment_submitted" field.
  bool? _paymentSubmitted;
  bool get paymentSubmitted => _paymentSubmitted ?? false;
  bool hasPaymentSubmitted() => _paymentSubmitted != null;

  // "full_amount" field.
  bool? _fullAmount;
  bool get fullAmount => _fullAmount ?? false;
  bool hasFullAmount() => _fullAmount != null;

  // "labRefNum" field.
  String? _labRefNum;
  String get labRefNum => _labRefNum ?? '';
  bool hasLabRefNum() => _labRefNum != null;

  // "Booking_ref" field.
  DocumentReference? _bookingRef;
  DocumentReference? get bookingRef => _bookingRef;
  bool hasBookingRef() => _bookingRef != null;

  // "payments_list" field.
  List<DocumentReference>? _paymentsList;
  List<DocumentReference> get paymentsList => _paymentsList ?? const [];
  bool hasPaymentsList() => _paymentsList != null;

  // "Amount_due" field.
  double? _amountDue;
  double get amountDue => _amountDue ?? 0.0;
  bool hasAmountDue() => _amountDue != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "due_date" field.
  DateTime? _dueDate;
  DateTime? get dueDate => _dueDate;
  bool hasDueDate() => _dueDate != null;

  // "updateDate" field.
  DateTime? _updateDate;
  DateTime? get updateDate => _updateDate;
  bool hasUpdateDate() => _updateDate != null;

  // "updateRole" field.
  String? _updateRole;
  String get updateRole => _updateRole ?? '';
  bool hasUpdateRole() => _updateRole != null;

  // "Invoice_amount" field.
  double? _invoiceAmount;
  double get invoiceAmount => _invoiceAmount ?? 0.0;
  bool hasInvoiceAmount() => _invoiceAmount != null;

  // "invoiceNum" field.
  String? _invoiceNum;
  String get invoiceNum => _invoiceNum ?? '';
  bool hasInvoiceNum() => _invoiceNum != null;

  // "bookingUser" field.
  DocumentReference? _bookingUser;
  DocumentReference? get bookingUser => _bookingUser;
  bool hasBookingUser() => _bookingUser != null;

  // "userEmail" field.
  String? _userEmail;
  String get userEmail => _userEmail ?? '';
  bool hasUserEmail() => _userEmail != null;

  void _initializeFields() {
    _bookedTestsList = getDataList(snapshotData['booked_tests_list']);
    _createdDate = snapshotData['created_date'] as DateTime?;
    _createdBy = snapshotData['created_by'] as DocumentReference?;
    _isPaid = snapshotData['is_paid'] as bool?;
    _paymentSubmitted = snapshotData['payment_submitted'] as bool?;
    _fullAmount = snapshotData['full_amount'] as bool?;
    _labRefNum = snapshotData['labRefNum'] as String?;
    _bookingRef = snapshotData['Booking_ref'] as DocumentReference?;
    _paymentsList = getDataList(snapshotData['payments_list']);
    _amountDue = castToType<double>(snapshotData['Amount_due']);
    _user = snapshotData['user'] as DocumentReference?;
    _dueDate = snapshotData['due_date'] as DateTime?;
    _updateDate = snapshotData['updateDate'] as DateTime?;
    _updateRole = snapshotData['updateRole'] as String?;
    _invoiceAmount = castToType<double>(snapshotData['Invoice_amount']);
    _invoiceNum = snapshotData['invoiceNum'] as String?;
    _bookingUser = snapshotData['bookingUser'] as DocumentReference?;
    _userEmail = snapshotData['userEmail'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Invoices');

  static Stream<InvoicesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => InvoicesRecord.fromSnapshot(s));

  static Future<InvoicesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => InvoicesRecord.fromSnapshot(s));

  static InvoicesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      InvoicesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static InvoicesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      InvoicesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'InvoicesRecord(reference: ${reference.path}, data: $snapshotData)';
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
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_date': createdDate,
      'created_by': createdBy,
      'is_paid': isPaid,
      'payment_submitted': paymentSubmitted,
      'full_amount': fullAmount,
      'labRefNum': labRefNum,
      'Booking_ref': bookingRef,
      'Amount_due': amountDue,
      'user': user,
      'due_date': dueDate,
      'updateDate': updateDate,
      'updateRole': updateRole,
      'Invoice_amount': invoiceAmount,
      'invoiceNum': invoiceNum,
      'bookingUser': bookingUser,
      'userEmail': userEmail,
    }.withoutNulls,
  );

  return firestoreData;
}
