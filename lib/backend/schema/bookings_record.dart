import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BookingsRecord extends FirestoreRecord {
  BookingsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "labRefNum" field.
  String? _labRefNum;
  String get labRefNum => _labRefNum ?? '';
  bool hasLabRefNum() => _labRefNum != null;

  // "created_date" field.
  DateTime? _createdDate;
  DateTime? get createdDate => _createdDate;
  bool hasCreatedDate() => _createdDate != null;

  // "scheduled_date" field.
  DateTime? _scheduledDate;
  DateTime? get scheduledDate => _scheduledDate;
  bool hasScheduledDate() => _scheduledDate != null;

  // "completed" field.
  bool? _completed;
  bool get completed => _completed ?? false;
  bool hasCompleted() => _completed != null;

  // "test_verified" field.
  bool? _testVerified;
  bool get testVerified => _testVerified ?? false;
  bool hasTestVerified() => _testVerified != null;

  // "test_notes" field.
  String? _testNotes;
  String get testNotes => _testNotes ?? '';
  bool hasTestNotes() => _testNotes != null;

  // "technologist" field.
  DocumentReference? _technologist;
  DocumentReference? get technologist => _technologist;
  bool hasTechnologist() => _technologist != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "diagnosis" field.
  String? _diagnosis;
  String get diagnosis => _diagnosis ?? '';
  bool hasDiagnosis() => _diagnosis != null;

  // "total_price" field.
  int? _totalPrice;
  int get totalPrice => _totalPrice ?? 0;
  bool hasTotalPrice() => _totalPrice != null;

  // "booking_confirmed" field.
  bool? _bookingConfirmed;
  bool get bookingConfirmed => _bookingConfirmed ?? false;
  bool hasBookingConfirmed() => _bookingConfirmed != null;

  // "firstname" field.
  String? _firstname;
  String get firstname => _firstname ?? '';
  bool hasFirstname() => _firstname != null;

  // "lastname" field.
  String? _lastname;
  String get lastname => _lastname ?? '';
  bool hasLastname() => _lastname != null;

  // "phonenumber" field.
  String? _phonenumber;
  String get phonenumber => _phonenumber ?? '';
  bool hasPhonenumber() => _phonenumber != null;

  // "sex" field.
  String? _sex;
  String get sex => _sex ?? '';
  bool hasSex() => _sex != null;

  // "emailaddress" field.
  String? _emailaddress;
  String get emailaddress => _emailaddress ?? '';
  bool hasEmailaddress() => _emailaddress != null;

  // "bookingstatus" field.
  String? _bookingstatus;
  String get bookingstatus => _bookingstatus ?? '';
  bool hasBookingstatus() => _bookingstatus != null;

  // "doc_name_address" field.
  String? _docNameAddress;
  String get docNameAddress => _docNameAddress ?? '';
  bool hasDocNameAddress() => _docNameAddress != null;

  // "tests_included" field.
  List<DocumentReference>? _testsIncluded;
  List<DocumentReference> get testsIncluded => _testsIncluded ?? const [];
  bool hasTestsIncluded() => _testsIncluded != null;

  // "is_invoiced" field.
  bool? _isInvoiced;
  bool get isInvoiced => _isInvoiced ?? false;
  bool hasIsInvoiced() => _isInvoiced != null;

  // "is_submitted" field.
  bool? _isSubmitted;
  bool get isSubmitted => _isSubmitted ?? false;
  bool hasIsSubmitted() => _isSubmitted != null;

  // "total_tests" field.
  int? _totalTests;
  int get totalTests => _totalTests ?? 0;
  bool hasTotalTests() => _totalTests != null;

  // "pathologist" field.
  String? _pathologist;
  String get pathologist => _pathologist ?? '';
  bool hasPathologist() => _pathologist != null;

  // "userPatient" field.
  bool? _userPatient;
  bool get userPatient => _userPatient ?? false;
  bool hasUserPatient() => _userPatient != null;

  // "d_o_b" field.
  DateTime? _dOB;
  DateTime? get dOB => _dOB;
  bool hasDOB() => _dOB != null;

  // "Invoice_Refs" field.
  List<DocumentReference>? _invoiceRefs;
  List<DocumentReference> get invoiceRefs => _invoiceRefs ?? const [];
  bool hasInvoiceRefs() => _invoiceRefs != null;

  // "updated_date" field.
  DateTime? _updatedDate;
  DateTime? get updatedDate => _updatedDate;
  bool hasUpdatedDate() => _updatedDate != null;

  // "paid_full" field.
  bool? _paidFull;
  bool get paidFull => _paidFull ?? false;
  bool hasPaidFull() => _paidFull != null;

  // "updateRole" field.
  String? _updateRole;
  String get updateRole => _updateRole ?? '';
  bool hasUpdateRole() => _updateRole != null;

  // "resultPublished" field.
  bool? _resultPublished;
  bool get resultPublished => _resultPublished ?? false;
  bool hasResultPublished() => _resultPublished != null;

  // "payment_balance" field.
  double? _paymentBalance;
  double get paymentBalance => _paymentBalance ?? 0.0;
  bool hasPaymentBalance() => _paymentBalance != null;

  // "updateStaff" field.
  DocumentReference? _updateStaff;
  DocumentReference? get updateStaff => _updateStaff;
  bool hasUpdateStaff() => _updateStaff != null;

  // "confirmationBegan" field.
  bool? _confirmationBegan;
  bool get confirmationBegan => _confirmationBegan ?? false;
  bool hasConfirmationBegan() => _confirmationBegan != null;

  // "bookedTests" field.
  List<DocumentReference>? _bookedTests;
  List<DocumentReference> get bookedTests => _bookedTests ?? const [];
  bool hasBookedTests() => _bookedTests != null;

  // "payments" field.
  List<DocumentReference>? _payments;
  List<DocumentReference> get payments => _payments ?? const [];
  bool hasPayments() => _payments != null;

  // "reportSent" field.
  bool? _reportSent;
  bool get reportSent => _reportSent ?? false;
  bool hasReportSent() => _reportSent != null;

  // "doc_names" field.
  String? _docNames;
  String get docNames => _docNames ?? '';
  bool hasDocNames() => _docNames != null;

  // "doctorPhoneNumber" field.
  String? _doctorPhoneNumber;
  String get doctorPhoneNumber => _doctorPhoneNumber ?? '';
  bool hasDoctorPhoneNumber() => _doctorPhoneNumber != null;

  // "doctorEmail" field.
  String? _doctorEmail;
  String get doctorEmail => _doctorEmail ?? '';
  bool hasDoctorEmail() => _doctorEmail != null;

  // "docRef" field.
  DocumentReference? _docRef;
  DocumentReference? get docRef => _docRef;
  bool hasDocRef() => _docRef != null;

  // "verifiedTests" field.
  List<DocumentReference>? _verifiedTests;
  List<DocumentReference> get verifiedTests => _verifiedTests ?? const [];
  bool hasVerifiedTests() => _verifiedTests != null;

  // "hasTestPackages" field.
  bool? _hasTestPackages;
  bool get hasTestPackages => _hasTestPackages ?? false;
  bool hasHasTestPackages() => _hasTestPackages != null;

  // "testPackages" field.
  List<DocumentReference>? _testPackages;
  List<DocumentReference> get testPackages => _testPackages ?? const [];
  bool hasTestPackagesField() => _testPackages != null;

  // "testPackTests" field.
  List<DocumentReference>? _testPackTests;
  List<DocumentReference> get testPackTests => _testPackTests ?? const [];
  bool hasTestPackTests() => _testPackTests != null;

  // "reportRef" field.
  DocumentReference? _reportRef;
  DocumentReference? get reportRef => _reportRef;
  bool hasReportRef() => _reportRef != null;

  // "flagged_tests" field.
  List<DocumentReference>? _flaggedTests;
  List<DocumentReference> get flaggedTests => _flaggedTests ?? const [];
  bool hasFlaggedTests() => _flaggedTests != null;

  // "frozenTests" field.
  List<DocumentReference>? _frozenTests;
  List<DocumentReference> get frozenTests => _frozenTests ?? const [];
  bool hasFrozenTests() => _frozenTests != null;

  // "form_images" field.
  List<String>? _formImages;
  List<String> get formImages => _formImages ?? const [];
  bool hasFormImages() => _formImages != null;

  // "bookedSpecialTests" field.
  List<DocumentReference>? _bookedSpecialTests;
  List<DocumentReference> get bookedSpecialTests =>
      _bookedSpecialTests ?? const [];
  bool hasBookedSpecialTests() => _bookedSpecialTests != null;

  // "bookedTestRefs" field.
  List<DocumentReference>? _bookedTestRefs;
  List<DocumentReference> get bookedTestRefs => _bookedTestRefs ?? const [];
  bool hasBookedTestRefs() => _bookedTestRefs != null;

  // "specialTests" field.
  List<SpecialTestTypeStruct>? _specialTests;
  List<SpecialTestTypeStruct> get specialTests => _specialTests ?? const [];
  bool hasSpecialTests() => _specialTests != null;

  void _initializeFields() {
    _labRefNum = snapshotData['labRefNum'] as String?;
    _createdDate = snapshotData['created_date'] as DateTime?;
    _scheduledDate = snapshotData['scheduled_date'] as DateTime?;
    _completed = snapshotData['completed'] as bool?;
    _testVerified = snapshotData['test_verified'] as bool?;
    _testNotes = snapshotData['test_notes'] as String?;
    _technologist = snapshotData['technologist'] as DocumentReference?;
    _user = snapshotData['user'] as DocumentReference?;
    _diagnosis = snapshotData['diagnosis'] as String?;
    _totalPrice = snapshotData['total_price'] as int?;
    _bookingConfirmed = snapshotData['booking_confirmed'] as bool?;
    _firstname = snapshotData['firstname'] as String?;
    _lastname = snapshotData['lastname'] as String?;
    _phonenumber = snapshotData['phonenumber'] as String?;
    _sex = snapshotData['sex'] as String?;
    _emailaddress = snapshotData['emailaddress'] as String?;
    _bookingstatus = snapshotData['bookingstatus'] as String?;
    _docNameAddress = snapshotData['doc_name_address'] as String?;
    _testsIncluded = getDataList(snapshotData['tests_included']);
    _isInvoiced = snapshotData['is_invoiced'] as bool?;
    _isSubmitted = snapshotData['is_submitted'] as bool?;
    _totalTests = snapshotData['total_tests'] as int?;
    _pathologist = snapshotData['pathologist'] as String?;
    _userPatient = snapshotData['userPatient'] as bool?;
    _dOB = snapshotData['d_o_b'] as DateTime?;
    _invoiceRefs = getDataList(snapshotData['Invoice_Refs']);
    _updatedDate = snapshotData['updated_date'] as DateTime?;
    _paidFull = snapshotData['paid_full'] as bool?;
    _updateRole = snapshotData['updateRole'] as String?;
    _resultPublished = snapshotData['resultPublished'] as bool?;
    _paymentBalance = castToType<double>(snapshotData['payment_balance']);
    _updateStaff = snapshotData['updateStaff'] as DocumentReference?;
    _confirmationBegan = snapshotData['confirmationBegan'] as bool?;
    _bookedTests = getDataList(snapshotData['bookedTests']);
    _payments = getDataList(snapshotData['payments']);
    _reportSent = snapshotData['reportSent'] as bool?;
    _docNames = snapshotData['doc_names'] as String?;
    _doctorPhoneNumber = snapshotData['doctorPhoneNumber'] as String?;
    _doctorEmail = snapshotData['doctorEmail'] as String?;
    _docRef = snapshotData['docRef'] as DocumentReference?;
    _verifiedTests = getDataList(snapshotData['verifiedTests']);
    _hasTestPackages = snapshotData['hasTestPackages'] as bool?;
    _testPackages = getDataList(snapshotData['testPackages']);
    _testPackTests = getDataList(snapshotData['testPackTests']);
    _reportRef = snapshotData['reportRef'] as DocumentReference?;
    _flaggedTests = getDataList(snapshotData['flagged_tests']);
    _frozenTests = getDataList(snapshotData['frozenTests']);
    _formImages = getDataList(snapshotData['form_images']);
    _bookedSpecialTests = getDataList(snapshotData['bookedSpecialTests']);
    _bookedTestRefs = getDataList(snapshotData['bookedTestRefs']);
    _specialTests = getStructList(
      snapshotData['specialTests'],
      SpecialTestTypeStruct.fromMap,
    );
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('bookings');

  static Stream<BookingsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BookingsRecord.fromSnapshot(s));

  static Future<BookingsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BookingsRecord.fromSnapshot(s));

  static BookingsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BookingsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BookingsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BookingsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BookingsRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createBookingsRecordData({
  String? labRefNum,
  DateTime? createdDate,
  DateTime? scheduledDate,
  bool? completed,
  bool? testVerified,
  String? testNotes,
  DocumentReference? technologist,
  DocumentReference? user,
  String? diagnosis,
  int? totalPrice,
  bool? bookingConfirmed,
  String? firstname,
  String? lastname,
  String? phonenumber,
  String? sex,
  String? emailaddress,
  String? bookingstatus,
  String? docNameAddress,
  bool? isInvoiced,
  bool? isSubmitted,
  int? totalTests,
  String? pathologist,
  bool? userPatient,
  DateTime? dOB,
  DateTime? updatedDate,
  bool? paidFull,
  String? updateRole,
  bool? resultPublished,
  double? paymentBalance,
  DocumentReference? updateStaff,
  bool? confirmationBegan,
  bool? reportSent,
  String? docNames,
  String? doctorPhoneNumber,
  String? doctorEmail,
  DocumentReference? docRef,
  bool? hasTestPackages,
  DocumentReference? reportRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'labRefNum': labRefNum,
      'created_date': createdDate,
      'scheduled_date': scheduledDate,
      'completed': completed,
      'test_verified': testVerified,
      'test_notes': testNotes,
      'technologist': technologist,
      'user': user,
      'diagnosis': diagnosis,
      'total_price': totalPrice,
      'booking_confirmed': bookingConfirmed,
      'firstname': firstname,
      'lastname': lastname,
      'phonenumber': phonenumber,
      'sex': sex,
      'emailaddress': emailaddress,
      'bookingstatus': bookingstatus,
      'doc_name_address': docNameAddress,
      'is_invoiced': isInvoiced,
      'is_submitted': isSubmitted,
      'total_tests': totalTests,
      'pathologist': pathologist,
      'userPatient': userPatient,
      'd_o_b': dOB,
      'updated_date': updatedDate,
      'paid_full': paidFull,
      'updateRole': updateRole,
      'resultPublished': resultPublished,
      'payment_balance': paymentBalance,
      'updateStaff': updateStaff,
      'confirmationBegan': confirmationBegan,
      'reportSent': reportSent,
      'doc_names': docNames,
      'doctorPhoneNumber': doctorPhoneNumber,
      'doctorEmail': doctorEmail,
      'docRef': docRef,
      'hasTestPackages': hasTestPackages,
      'reportRef': reportRef,
    }.withoutNulls,
  );

  return firestoreData;
}
