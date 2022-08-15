import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'bookings_record.g.dart';

abstract class BookingsRecord
    implements Built<BookingsRecord, BookingsRecordBuilder> {
  static Serializer<BookingsRecord> get serializer =>
      _$bookingsRecordSerializer;

  @nullable
  String get labRefNum;

  @nullable
  @BuiltValueField(wireName: 'created_date')
  DateTime get createdDate;

  @nullable
  @BuiltValueField(wireName: 'scheduled_date')
  DateTime get scheduledDate;

  @nullable
  bool get completed;

  @nullable
  @BuiltValueField(wireName: 'test_verified')
  bool get testVerified;

  @nullable
  @BuiltValueField(wireName: 'test_notes')
  String get testNotes;

  @nullable
  DocumentReference get technologist;

  @nullable
  DocumentReference get user;

  @nullable
  String get diagnosis;

  @nullable
  @BuiltValueField(wireName: 'total_price')
  int get totalPrice;

  @nullable
  @BuiltValueField(wireName: 'booking_confirmed')
  bool get bookingConfirmed;

  @nullable
  String get firstname;

  @nullable
  String get lastname;

  @nullable
  String get phonenumber;

  @nullable
  String get sex;

  @nullable
  String get emailaddress;

  @nullable
  String get bookingstatus;

  @nullable
  @BuiltValueField(wireName: 'doc_name_address')
  String get docNameAddress;

  @nullable
  @BuiltValueField(wireName: 'tests_included')
  BuiltList<DocumentReference> get testsIncluded;

  @nullable
  @BuiltValueField(wireName: 'is_invoiced')
  bool get isInvoiced;

  @nullable
  @BuiltValueField(wireName: 'is_submitted')
  bool get isSubmitted;

  @nullable
  @BuiltValueField(wireName: 'total_tests')
  int get totalTests;

  @nullable
  String get pathologist;

  @nullable
  bool get userPatient;

  @nullable
  @BuiltValueField(wireName: 'd_o_b')
  DateTime get dOB;

  @nullable
  @BuiltValueField(wireName: 'Invoice_Refs')
  BuiltList<DocumentReference> get invoiceRefs;

  @nullable
  @BuiltValueField(wireName: 'updated_date')
  DateTime get updatedDate;

  @nullable
  @BuiltValueField(wireName: 'paid_full')
  bool get paidFull;

  @nullable
  String get updateRole;

  @nullable
  bool get resultPublished;

  @nullable
  @BuiltValueField(wireName: 'payment_balance')
  double get paymentBalance;

  @nullable
  DocumentReference get updateStaff;

  @nullable
  bool get confirmationBegan;

  @nullable
  BuiltList<DocumentReference> get bookedTests;

  @nullable
  BuiltList<DocumentReference> get payments;

  @nullable
  bool get reportSent;

  @nullable
  @BuiltValueField(wireName: 'doc_names')
  String get docNames;

  @nullable
  String get doctorPhoneNumber;

  @nullable
  String get doctorEmail;

  @nullable
  DocumentReference get docRef;

  @nullable
  BuiltList<DocumentReference> get verifiedTests;

  @nullable
  bool get hasTestPackages;

  @nullable
  BuiltList<DocumentReference> get testPackages;

  @nullable
  BuiltList<DocumentReference> get testPackTests;

  @nullable
  DocumentReference get reportRef;

  @nullable
  @BuiltValueField(wireName: 'flagged_tests')
  BuiltList<DocumentReference> get flaggedTests;

  @nullable
  BuiltList<DocumentReference> get frozenTests;

  @nullable
  @BuiltValueField(wireName: 'form_images')
  BuiltList<String> get formImages;

  @nullable
  BuiltList<String> get specialTests;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(BookingsRecordBuilder builder) => builder
    ..labRefNum = ''
    ..completed = false
    ..testVerified = false
    ..testNotes = ''
    ..diagnosis = ''
    ..totalPrice = 0
    ..bookingConfirmed = false
    ..firstname = ''
    ..lastname = ''
    ..phonenumber = ''
    ..sex = ''
    ..emailaddress = ''
    ..bookingstatus = ''
    ..docNameAddress = ''
    ..testsIncluded = ListBuilder()
    ..isInvoiced = false
    ..isSubmitted = false
    ..totalTests = 0
    ..pathologist = ''
    ..userPatient = false
    ..invoiceRefs = ListBuilder()
    ..paidFull = false
    ..updateRole = ''
    ..resultPublished = false
    ..paymentBalance = 0.0
    ..confirmationBegan = false
    ..bookedTests = ListBuilder()
    ..payments = ListBuilder()
    ..reportSent = false
    ..docNames = ''
    ..doctorPhoneNumber = ''
    ..doctorEmail = ''
    ..verifiedTests = ListBuilder()
    ..hasTestPackages = false
    ..testPackages = ListBuilder()
    ..testPackTests = ListBuilder()
    ..flaggedTests = ListBuilder()
    ..frozenTests = ListBuilder()
    ..formImages = ListBuilder()
    ..specialTests = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('bookings');

  static Stream<BookingsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<BookingsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  BookingsRecord._();
  factory BookingsRecord([void Function(BookingsRecordBuilder) updates]) =
      _$BookingsRecord;

  static BookingsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createBookingsRecordData({
  String labRefNum,
  DateTime createdDate,
  DateTime scheduledDate,
  bool completed,
  bool testVerified,
  String testNotes,
  DocumentReference technologist,
  DocumentReference user,
  String diagnosis,
  int totalPrice,
  bool bookingConfirmed,
  String firstname,
  String lastname,
  String phonenumber,
  String sex,
  String emailaddress,
  String bookingstatus,
  String docNameAddress,
  bool isInvoiced,
  bool isSubmitted,
  int totalTests,
  String pathologist,
  bool userPatient,
  DateTime dOB,
  DateTime updatedDate,
  bool paidFull,
  String updateRole,
  bool resultPublished,
  double paymentBalance,
  DocumentReference updateStaff,
  bool confirmationBegan,
  bool reportSent,
  String docNames,
  String doctorPhoneNumber,
  String doctorEmail,
  DocumentReference docRef,
  bool hasTestPackages,
  DocumentReference reportRef,
}) =>
    serializers.toFirestore(
        BookingsRecord.serializer,
        BookingsRecord((b) => b
          ..labRefNum = labRefNum
          ..createdDate = createdDate
          ..scheduledDate = scheduledDate
          ..completed = completed
          ..testVerified = testVerified
          ..testNotes = testNotes
          ..technologist = technologist
          ..user = user
          ..diagnosis = diagnosis
          ..totalPrice = totalPrice
          ..bookingConfirmed = bookingConfirmed
          ..firstname = firstname
          ..lastname = lastname
          ..phonenumber = phonenumber
          ..sex = sex
          ..emailaddress = emailaddress
          ..bookingstatus = bookingstatus
          ..docNameAddress = docNameAddress
          ..testsIncluded = null
          ..isInvoiced = isInvoiced
          ..isSubmitted = isSubmitted
          ..totalTests = totalTests
          ..pathologist = pathologist
          ..userPatient = userPatient
          ..dOB = dOB
          ..invoiceRefs = null
          ..updatedDate = updatedDate
          ..paidFull = paidFull
          ..updateRole = updateRole
          ..resultPublished = resultPublished
          ..paymentBalance = paymentBalance
          ..updateStaff = updateStaff
          ..confirmationBegan = confirmationBegan
          ..bookedTests = null
          ..payments = null
          ..reportSent = reportSent
          ..docNames = docNames
          ..doctorPhoneNumber = doctorPhoneNumber
          ..doctorEmail = doctorEmail
          ..docRef = docRef
          ..verifiedTests = null
          ..hasTestPackages = hasTestPackages
          ..testPackages = null
          ..testPackTests = null
          ..reportRef = reportRef
          ..flaggedTests = null
          ..frozenTests = null
          ..formImages = null
          ..specialTests = null));
