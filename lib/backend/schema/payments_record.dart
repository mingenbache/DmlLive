import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PaymentsRecord extends FirestoreRecord {
  PaymentsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user_ref" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "booking_ref" field.
  DocumentReference? _bookingRef;
  DocumentReference? get bookingRef => _bookingRef;
  bool hasBookingRef() => _bookingRef != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "transaction_code" field.
  String? _transactionCode;
  String get transactionCode => _transactionCode ?? '';
  bool hasTransactionCode() => _transactionCode != null;

  // "created_date" field.
  DateTime? _createdDate;
  DateTime? get createdDate => _createdDate;
  bool hasCreatedDate() => _createdDate != null;

  // "is_approved" field.
  bool? _isApproved;
  bool get isApproved => _isApproved ?? false;
  bool hasIsApproved() => _isApproved != null;

  // "invoice_ref" field.
  DocumentReference? _invoiceRef;
  DocumentReference? get invoiceRef => _invoiceRef;
  bool hasInvoiceRef() => _invoiceRef != null;

  // "amount" field.
  int? _amount;
  int get amount => _amount ?? 0;
  bool hasAmount() => _amount != null;

  // "first_name" field.
  String? _firstName;
  String get firstName => _firstName ?? '';
  bool hasFirstName() => _firstName != null;

  // "last_name" field.
  String? _lastName;
  String get lastName => _lastName ?? '';
  bool hasLastName() => _lastName != null;

  // "payment_notes" field.
  String? _paymentNotes;
  String get paymentNotes => _paymentNotes ?? '';
  bool hasPaymentNotes() => _paymentNotes != null;

  // "transaction_date" field.
  DateTime? _transactionDate;
  DateTime? get transactionDate => _transactionDate;
  bool hasTransactionDate() => _transactionDate != null;

  // "updated_date" field.
  DateTime? _updatedDate;
  DateTime? get updatedDate => _updatedDate;
  bool hasUpdatedDate() => _updatedDate != null;

  // "has_receipt" field.
  bool? _hasReceipt;
  bool get hasReceipt => _hasReceipt ?? false;
  bool hasHasReceipt() => _hasReceipt != null;

  // "updateRole" field.
  String? _updateRole;
  String get updateRole => _updateRole ?? '';
  bool hasUpdateRole() => _updateRole != null;

  void _initializeFields() {
    _userRef = snapshotData['user_ref'] as DocumentReference?;
    _bookingRef = snapshotData['booking_ref'] as DocumentReference?;
    _type = snapshotData['type'] as String?;
    _transactionCode = snapshotData['transaction_code'] as String?;
    _createdDate = snapshotData['created_date'] as DateTime?;
    _isApproved = snapshotData['is_approved'] as bool?;
    _invoiceRef = snapshotData['invoice_ref'] as DocumentReference?;
    _amount = snapshotData['amount'] as int?;
    _firstName = snapshotData['first_name'] as String?;
    _lastName = snapshotData['last_name'] as String?;
    _paymentNotes = snapshotData['payment_notes'] as String?;
    _transactionDate = snapshotData['transaction_date'] as DateTime?;
    _updatedDate = snapshotData['updated_date'] as DateTime?;
    _hasReceipt = snapshotData['has_receipt'] as bool?;
    _updateRole = snapshotData['updateRole'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('payments');

  static Stream<PaymentsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PaymentsRecord.fromSnapshot(s));

  static Future<PaymentsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PaymentsRecord.fromSnapshot(s));

  static PaymentsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PaymentsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PaymentsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PaymentsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PaymentsRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createPaymentsRecordData({
  DocumentReference? userRef,
  DocumentReference? bookingRef,
  String? type,
  String? transactionCode,
  DateTime? createdDate,
  bool? isApproved,
  DocumentReference? invoiceRef,
  int? amount,
  String? firstName,
  String? lastName,
  String? paymentNotes,
  DateTime? transactionDate,
  DateTime? updatedDate,
  bool? hasReceipt,
  String? updateRole,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user_ref': userRef,
      'booking_ref': bookingRef,
      'type': type,
      'transaction_code': transactionCode,
      'created_date': createdDate,
      'is_approved': isApproved,
      'invoice_ref': invoiceRef,
      'amount': amount,
      'first_name': firstName,
      'last_name': lastName,
      'payment_notes': paymentNotes,
      'transaction_date': transactionDate,
      'updated_date': updatedDate,
      'has_receipt': hasReceipt,
      'updateRole': updateRole,
    }.withoutNulls,
  );

  return firestoreData;
}
