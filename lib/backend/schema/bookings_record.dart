import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'bookings_record.g.dart';

abstract class BookingsRecord
    implements Built<BookingsRecord, BookingsRecordBuilder> {
  static Serializer<BookingsRecord> get serializer =>
      _$bookingsRecordSerializer;

  String? get labRefNum;

  @BuiltValueField(wireName: 'created_date')
  DateTime? get createdDate;

  @BuiltValueField(wireName: 'scheduled_date')
  DateTime? get scheduledDate;

  bool? get completed;

  @BuiltValueField(wireName: 'test_verified')
  bool? get testVerified;

  @BuiltValueField(wireName: 'test_notes')
  String? get testNotes;

  DocumentReference? get technologist;

  DocumentReference? get user;

  String? get diagnosis;

  @BuiltValueField(wireName: 'total_price')
  int? get totalPrice;

  @BuiltValueField(wireName: 'booking_confirmed')
  bool? get bookingConfirmed;

  String? get firstname;

  String? get lastname;

  String? get phonenumber;

  String? get sex;

  String? get emailaddress;

  String? get bookingstatus;

  @BuiltValueField(wireName: 'doc_name_address')
  String? get docNameAddress;

  @BuiltValueField(wireName: 'tests_included')
  BuiltList<DocumentReference>? get testsIncluded;

  @BuiltValueField(wireName: 'is_invoiced')
  bool? get isInvoiced;

  @BuiltValueField(wireName: 'is_submitted')
  bool? get isSubmitted;

  @BuiltValueField(wireName: 'total_tests')
  int? get totalTests;

  String? get pathologist;

  bool? get userPatient;

  @BuiltValueField(wireName: 'd_o_b')
  DateTime? get dOB;

  @BuiltValueField(wireName: 'Invoice_Refs')
  BuiltList<DocumentReference>? get invoiceRefs;

  @BuiltValueField(wireName: 'updated_date')
  DateTime? get updatedDate;

  @BuiltValueField(wireName: 'paid_full')
  bool? get paidFull;

  String? get updateRole;

  bool? get resultPublished;

  @BuiltValueField(wireName: 'payment_balance')
  double? get paymentBalance;

  DocumentReference? get updateStaff;

  bool? get confirmationBegan;

  BuiltList<DocumentReference>? get bookedTests;

  BuiltList<DocumentReference>? get payments;

  bool? get reportSent;

  @BuiltValueField(wireName: 'doc_names')
  String? get docNames;

  String? get doctorPhoneNumber;

  String? get doctorEmail;

  DocumentReference? get docRef;

  BuiltList<DocumentReference>? get verifiedTests;

  bool? get hasTestPackages;

  BuiltList<DocumentReference>? get testPackages;

  BuiltList<DocumentReference>? get testPackTests;

  DocumentReference? get reportRef;

  @BuiltValueField(wireName: 'flagged_tests')
  BuiltList<DocumentReference>? get flaggedTests;

  BuiltList<DocumentReference>? get frozenTests;

  @BuiltValueField(wireName: 'form_images')
  BuiltList<String>? get formImages;

  BuiltList<String>? get specialTests;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

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
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<BookingsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  BookingsRecord._();
  factory BookingsRecord([void Function(BookingsRecordBuilder) updates]) =
      _$BookingsRecord;

  static BookingsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
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
  final firestoreData = serializers.toFirestore(
    BookingsRecord.serializer,
    BookingsRecord(
      (b) => b
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
        ..specialTests = null,
    ),
  );

  return firestoreData;
}
