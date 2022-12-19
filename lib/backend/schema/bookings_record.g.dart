// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookings_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<BookingsRecord> _$bookingsRecordSerializer =
    new _$BookingsRecordSerializer();

class _$BookingsRecordSerializer
    implements StructuredSerializer<BookingsRecord> {
  @override
  final Iterable<Type> types = const [BookingsRecord, _$BookingsRecord];
  @override
  final String wireName = 'BookingsRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, BookingsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.labRefNum;
    if (value != null) {
      result
        ..add('labRefNum')
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
    value = object.scheduledDate;
    if (value != null) {
      result
        ..add('scheduled_date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.completed;
    if (value != null) {
      result
        ..add('completed')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.testVerified;
    if (value != null) {
      result
        ..add('test_verified')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.testNotes;
    if (value != null) {
      result
        ..add('test_notes')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.technologist;
    if (value != null) {
      result
        ..add('technologist')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.user;
    if (value != null) {
      result
        ..add('user')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.diagnosis;
    if (value != null) {
      result
        ..add('diagnosis')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.totalPrice;
    if (value != null) {
      result
        ..add('total_price')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.bookingConfirmed;
    if (value != null) {
      result
        ..add('booking_confirmed')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.firstname;
    if (value != null) {
      result
        ..add('firstname')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.lastname;
    if (value != null) {
      result
        ..add('lastname')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.phonenumber;
    if (value != null) {
      result
        ..add('phonenumber')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.sex;
    if (value != null) {
      result
        ..add('sex')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.emailaddress;
    if (value != null) {
      result
        ..add('emailaddress')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.bookingstatus;
    if (value != null) {
      result
        ..add('bookingstatus')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.docNameAddress;
    if (value != null) {
      result
        ..add('doc_name_address')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.testsIncluded;
    if (value != null) {
      result
        ..add('tests_included')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.isInvoiced;
    if (value != null) {
      result
        ..add('is_invoiced')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.isSubmitted;
    if (value != null) {
      result
        ..add('is_submitted')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.totalTests;
    if (value != null) {
      result
        ..add('total_tests')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.pathologist;
    if (value != null) {
      result
        ..add('pathologist')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.userPatient;
    if (value != null) {
      result
        ..add('userPatient')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.dOB;
    if (value != null) {
      result
        ..add('d_o_b')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.invoiceRefs;
    if (value != null) {
      result
        ..add('Invoice_Refs')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.updatedDate;
    if (value != null) {
      result
        ..add('updated_date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.paidFull;
    if (value != null) {
      result
        ..add('paid_full')
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
    value = object.resultPublished;
    if (value != null) {
      result
        ..add('resultPublished')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.paymentBalance;
    if (value != null) {
      result
        ..add('payment_balance')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.updateStaff;
    if (value != null) {
      result
        ..add('updateStaff')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.confirmationBegan;
    if (value != null) {
      result
        ..add('confirmationBegan')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.bookedTests;
    if (value != null) {
      result
        ..add('bookedTests')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.payments;
    if (value != null) {
      result
        ..add('payments')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.reportSent;
    if (value != null) {
      result
        ..add('reportSent')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.docNames;
    if (value != null) {
      result
        ..add('doc_names')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.doctorPhoneNumber;
    if (value != null) {
      result
        ..add('doctorPhoneNumber')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.doctorEmail;
    if (value != null) {
      result
        ..add('doctorEmail')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.docRef;
    if (value != null) {
      result
        ..add('docRef')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.verifiedTests;
    if (value != null) {
      result
        ..add('verifiedTests')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.hasTestPackages;
    if (value != null) {
      result
        ..add('hasTestPackages')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.testPackages;
    if (value != null) {
      result
        ..add('testPackages')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.testPackTests;
    if (value != null) {
      result
        ..add('testPackTests')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.reportRef;
    if (value != null) {
      result
        ..add('reportRef')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.flaggedTests;
    if (value != null) {
      result
        ..add('flagged_tests')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.frozenTests;
    if (value != null) {
      result
        ..add('frozenTests')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.formImages;
    if (value != null) {
      result
        ..add('form_images')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.specialTests;
    if (value != null) {
      result
        ..add('specialTests')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.bookedSpecialTests;
    if (value != null) {
      result
        ..add('bookedSpecialTests')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  BookingsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new BookingsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'labRefNum':
          result.labRefNum = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'created_date':
          result.createdDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'scheduled_date':
          result.scheduledDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'completed':
          result.completed = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'test_verified':
          result.testVerified = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'test_notes':
          result.testNotes = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'technologist':
          result.technologist = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'user':
          result.user = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'diagnosis':
          result.diagnosis = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'total_price':
          result.totalPrice = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'booking_confirmed':
          result.bookingConfirmed = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'firstname':
          result.firstname = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'lastname':
          result.lastname = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'phonenumber':
          result.phonenumber = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'sex':
          result.sex = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'emailaddress':
          result.emailaddress = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'bookingstatus':
          result.bookingstatus = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'doc_name_address':
          result.docNameAddress = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'tests_included':
          result.testsIncluded.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'is_invoiced':
          result.isInvoiced = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'is_submitted':
          result.isSubmitted = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'total_tests':
          result.totalTests = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'pathologist':
          result.pathologist = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'userPatient':
          result.userPatient = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'd_o_b':
          result.dOB = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'Invoice_Refs':
          result.invoiceRefs.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'updated_date':
          result.updatedDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'paid_full':
          result.paidFull = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'updateRole':
          result.updateRole = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'resultPublished':
          result.resultPublished = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'payment_balance':
          result.paymentBalance = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'updateStaff':
          result.updateStaff = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'confirmationBegan':
          result.confirmationBegan = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'bookedTests':
          result.bookedTests.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'payments':
          result.payments.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'reportSent':
          result.reportSent = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'doc_names':
          result.docNames = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'doctorPhoneNumber':
          result.doctorPhoneNumber = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'doctorEmail':
          result.doctorEmail = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'docRef':
          result.docRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'verifiedTests':
          result.verifiedTests.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'hasTestPackages':
          result.hasTestPackages = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'testPackages':
          result.testPackages.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'testPackTests':
          result.testPackTests.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'reportRef':
          result.reportRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'flagged_tests':
          result.flaggedTests.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'frozenTests':
          result.frozenTests.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'form_images':
          result.formImages.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'specialTests':
          result.specialTests.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'bookedSpecialTests':
          result.bookedSpecialTests.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$BookingsRecord extends BookingsRecord {
  @override
  final String? labRefNum;
  @override
  final DateTime? createdDate;
  @override
  final DateTime? scheduledDate;
  @override
  final bool? completed;
  @override
  final bool? testVerified;
  @override
  final String? testNotes;
  @override
  final DocumentReference<Object?>? technologist;
  @override
  final DocumentReference<Object?>? user;
  @override
  final String? diagnosis;
  @override
  final int? totalPrice;
  @override
  final bool? bookingConfirmed;
  @override
  final String? firstname;
  @override
  final String? lastname;
  @override
  final String? phonenumber;
  @override
  final String? sex;
  @override
  final String? emailaddress;
  @override
  final String? bookingstatus;
  @override
  final String? docNameAddress;
  @override
  final BuiltList<DocumentReference<Object?>>? testsIncluded;
  @override
  final bool? isInvoiced;
  @override
  final bool? isSubmitted;
  @override
  final int? totalTests;
  @override
  final String? pathologist;
  @override
  final bool? userPatient;
  @override
  final DateTime? dOB;
  @override
  final BuiltList<DocumentReference<Object?>>? invoiceRefs;
  @override
  final DateTime? updatedDate;
  @override
  final bool? paidFull;
  @override
  final String? updateRole;
  @override
  final bool? resultPublished;
  @override
  final double? paymentBalance;
  @override
  final DocumentReference<Object?>? updateStaff;
  @override
  final bool? confirmationBegan;
  @override
  final BuiltList<DocumentReference<Object?>>? bookedTests;
  @override
  final BuiltList<DocumentReference<Object?>>? payments;
  @override
  final bool? reportSent;
  @override
  final String? docNames;
  @override
  final String? doctorPhoneNumber;
  @override
  final String? doctorEmail;
  @override
  final DocumentReference<Object?>? docRef;
  @override
  final BuiltList<DocumentReference<Object?>>? verifiedTests;
  @override
  final bool? hasTestPackages;
  @override
  final BuiltList<DocumentReference<Object?>>? testPackages;
  @override
  final BuiltList<DocumentReference<Object?>>? testPackTests;
  @override
  final DocumentReference<Object?>? reportRef;
  @override
  final BuiltList<DocumentReference<Object?>>? flaggedTests;
  @override
  final BuiltList<DocumentReference<Object?>>? frozenTests;
  @override
  final BuiltList<String>? formImages;
  @override
  final BuiltList<String>? specialTests;
  @override
  final BuiltList<DocumentReference<Object?>>? bookedSpecialTests;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$BookingsRecord([void Function(BookingsRecordBuilder)? updates]) =>
      (new BookingsRecordBuilder()..update(updates))._build();

  _$BookingsRecord._(
      {this.labRefNum,
      this.createdDate,
      this.scheduledDate,
      this.completed,
      this.testVerified,
      this.testNotes,
      this.technologist,
      this.user,
      this.diagnosis,
      this.totalPrice,
      this.bookingConfirmed,
      this.firstname,
      this.lastname,
      this.phonenumber,
      this.sex,
      this.emailaddress,
      this.bookingstatus,
      this.docNameAddress,
      this.testsIncluded,
      this.isInvoiced,
      this.isSubmitted,
      this.totalTests,
      this.pathologist,
      this.userPatient,
      this.dOB,
      this.invoiceRefs,
      this.updatedDate,
      this.paidFull,
      this.updateRole,
      this.resultPublished,
      this.paymentBalance,
      this.updateStaff,
      this.confirmationBegan,
      this.bookedTests,
      this.payments,
      this.reportSent,
      this.docNames,
      this.doctorPhoneNumber,
      this.doctorEmail,
      this.docRef,
      this.verifiedTests,
      this.hasTestPackages,
      this.testPackages,
      this.testPackTests,
      this.reportRef,
      this.flaggedTests,
      this.frozenTests,
      this.formImages,
      this.specialTests,
      this.bookedSpecialTests,
      this.ffRef})
      : super._();

  @override
  BookingsRecord rebuild(void Function(BookingsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BookingsRecordBuilder toBuilder() =>
      new BookingsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BookingsRecord &&
        labRefNum == other.labRefNum &&
        createdDate == other.createdDate &&
        scheduledDate == other.scheduledDate &&
        completed == other.completed &&
        testVerified == other.testVerified &&
        testNotes == other.testNotes &&
        technologist == other.technologist &&
        user == other.user &&
        diagnosis == other.diagnosis &&
        totalPrice == other.totalPrice &&
        bookingConfirmed == other.bookingConfirmed &&
        firstname == other.firstname &&
        lastname == other.lastname &&
        phonenumber == other.phonenumber &&
        sex == other.sex &&
        emailaddress == other.emailaddress &&
        bookingstatus == other.bookingstatus &&
        docNameAddress == other.docNameAddress &&
        testsIncluded == other.testsIncluded &&
        isInvoiced == other.isInvoiced &&
        isSubmitted == other.isSubmitted &&
        totalTests == other.totalTests &&
        pathologist == other.pathologist &&
        userPatient == other.userPatient &&
        dOB == other.dOB &&
        invoiceRefs == other.invoiceRefs &&
        updatedDate == other.updatedDate &&
        paidFull == other.paidFull &&
        updateRole == other.updateRole &&
        resultPublished == other.resultPublished &&
        paymentBalance == other.paymentBalance &&
        updateStaff == other.updateStaff &&
        confirmationBegan == other.confirmationBegan &&
        bookedTests == other.bookedTests &&
        payments == other.payments &&
        reportSent == other.reportSent &&
        docNames == other.docNames &&
        doctorPhoneNumber == other.doctorPhoneNumber &&
        doctorEmail == other.doctorEmail &&
        docRef == other.docRef &&
        verifiedTests == other.verifiedTests &&
        hasTestPackages == other.hasTestPackages &&
        testPackages == other.testPackages &&
        testPackTests == other.testPackTests &&
        reportRef == other.reportRef &&
        flaggedTests == other.flaggedTests &&
        frozenTests == other.frozenTests &&
        formImages == other.formImages &&
        specialTests == other.specialTests &&
        bookedSpecialTests == other.bookedSpecialTests &&
        ffRef == other.ffRef;
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
                                                                            $jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc(0, labRefNum.hashCode), createdDate.hashCode), scheduledDate.hashCode), completed.hashCode), testVerified.hashCode), testNotes.hashCode), technologist.hashCode), user.hashCode), diagnosis.hashCode), totalPrice.hashCode), bookingConfirmed.hashCode), firstname.hashCode), lastname.hashCode), phonenumber.hashCode), sex.hashCode), emailaddress.hashCode), bookingstatus.hashCode), docNameAddress.hashCode), testsIncluded.hashCode), isInvoiced.hashCode), isSubmitted.hashCode), totalTests.hashCode), pathologist.hashCode), userPatient.hashCode), dOB.hashCode), invoiceRefs.hashCode), updatedDate.hashCode), paidFull.hashCode), updateRole.hashCode), resultPublished.hashCode), paymentBalance.hashCode), updateStaff.hashCode),
                                                                                confirmationBegan.hashCode),
                                                                            bookedTests.hashCode),
                                                                        payments.hashCode),
                                                                    reportSent.hashCode),
                                                                docNames.hashCode),
                                                            doctorPhoneNumber.hashCode),
                                                        doctorEmail.hashCode),
                                                    docRef.hashCode),
                                                verifiedTests.hashCode),
                                            hasTestPackages.hashCode),
                                        testPackages.hashCode),
                                    testPackTests.hashCode),
                                reportRef.hashCode),
                            flaggedTests.hashCode),
                        frozenTests.hashCode),
                    formImages.hashCode),
                specialTests.hashCode),
            bookedSpecialTests.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'BookingsRecord')
          ..add('labRefNum', labRefNum)
          ..add('createdDate', createdDate)
          ..add('scheduledDate', scheduledDate)
          ..add('completed', completed)
          ..add('testVerified', testVerified)
          ..add('testNotes', testNotes)
          ..add('technologist', technologist)
          ..add('user', user)
          ..add('diagnosis', diagnosis)
          ..add('totalPrice', totalPrice)
          ..add('bookingConfirmed', bookingConfirmed)
          ..add('firstname', firstname)
          ..add('lastname', lastname)
          ..add('phonenumber', phonenumber)
          ..add('sex', sex)
          ..add('emailaddress', emailaddress)
          ..add('bookingstatus', bookingstatus)
          ..add('docNameAddress', docNameAddress)
          ..add('testsIncluded', testsIncluded)
          ..add('isInvoiced', isInvoiced)
          ..add('isSubmitted', isSubmitted)
          ..add('totalTests', totalTests)
          ..add('pathologist', pathologist)
          ..add('userPatient', userPatient)
          ..add('dOB', dOB)
          ..add('invoiceRefs', invoiceRefs)
          ..add('updatedDate', updatedDate)
          ..add('paidFull', paidFull)
          ..add('updateRole', updateRole)
          ..add('resultPublished', resultPublished)
          ..add('paymentBalance', paymentBalance)
          ..add('updateStaff', updateStaff)
          ..add('confirmationBegan', confirmationBegan)
          ..add('bookedTests', bookedTests)
          ..add('payments', payments)
          ..add('reportSent', reportSent)
          ..add('docNames', docNames)
          ..add('doctorPhoneNumber', doctorPhoneNumber)
          ..add('doctorEmail', doctorEmail)
          ..add('docRef', docRef)
          ..add('verifiedTests', verifiedTests)
          ..add('hasTestPackages', hasTestPackages)
          ..add('testPackages', testPackages)
          ..add('testPackTests', testPackTests)
          ..add('reportRef', reportRef)
          ..add('flaggedTests', flaggedTests)
          ..add('frozenTests', frozenTests)
          ..add('formImages', formImages)
          ..add('specialTests', specialTests)
          ..add('bookedSpecialTests', bookedSpecialTests)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class BookingsRecordBuilder
    implements Builder<BookingsRecord, BookingsRecordBuilder> {
  _$BookingsRecord? _$v;

  String? _labRefNum;
  String? get labRefNum => _$this._labRefNum;
  set labRefNum(String? labRefNum) => _$this._labRefNum = labRefNum;

  DateTime? _createdDate;
  DateTime? get createdDate => _$this._createdDate;
  set createdDate(DateTime? createdDate) => _$this._createdDate = createdDate;

  DateTime? _scheduledDate;
  DateTime? get scheduledDate => _$this._scheduledDate;
  set scheduledDate(DateTime? scheduledDate) =>
      _$this._scheduledDate = scheduledDate;

  bool? _completed;
  bool? get completed => _$this._completed;
  set completed(bool? completed) => _$this._completed = completed;

  bool? _testVerified;
  bool? get testVerified => _$this._testVerified;
  set testVerified(bool? testVerified) => _$this._testVerified = testVerified;

  String? _testNotes;
  String? get testNotes => _$this._testNotes;
  set testNotes(String? testNotes) => _$this._testNotes = testNotes;

  DocumentReference<Object?>? _technologist;
  DocumentReference<Object?>? get technologist => _$this._technologist;
  set technologist(DocumentReference<Object?>? technologist) =>
      _$this._technologist = technologist;

  DocumentReference<Object?>? _user;
  DocumentReference<Object?>? get user => _$this._user;
  set user(DocumentReference<Object?>? user) => _$this._user = user;

  String? _diagnosis;
  String? get diagnosis => _$this._diagnosis;
  set diagnosis(String? diagnosis) => _$this._diagnosis = diagnosis;

  int? _totalPrice;
  int? get totalPrice => _$this._totalPrice;
  set totalPrice(int? totalPrice) => _$this._totalPrice = totalPrice;

  bool? _bookingConfirmed;
  bool? get bookingConfirmed => _$this._bookingConfirmed;
  set bookingConfirmed(bool? bookingConfirmed) =>
      _$this._bookingConfirmed = bookingConfirmed;

  String? _firstname;
  String? get firstname => _$this._firstname;
  set firstname(String? firstname) => _$this._firstname = firstname;

  String? _lastname;
  String? get lastname => _$this._lastname;
  set lastname(String? lastname) => _$this._lastname = lastname;

  String? _phonenumber;
  String? get phonenumber => _$this._phonenumber;
  set phonenumber(String? phonenumber) => _$this._phonenumber = phonenumber;

  String? _sex;
  String? get sex => _$this._sex;
  set sex(String? sex) => _$this._sex = sex;

  String? _emailaddress;
  String? get emailaddress => _$this._emailaddress;
  set emailaddress(String? emailaddress) => _$this._emailaddress = emailaddress;

  String? _bookingstatus;
  String? get bookingstatus => _$this._bookingstatus;
  set bookingstatus(String? bookingstatus) =>
      _$this._bookingstatus = bookingstatus;

  String? _docNameAddress;
  String? get docNameAddress => _$this._docNameAddress;
  set docNameAddress(String? docNameAddress) =>
      _$this._docNameAddress = docNameAddress;

  ListBuilder<DocumentReference<Object?>>? _testsIncluded;
  ListBuilder<DocumentReference<Object?>> get testsIncluded =>
      _$this._testsIncluded ??= new ListBuilder<DocumentReference<Object?>>();
  set testsIncluded(ListBuilder<DocumentReference<Object?>>? testsIncluded) =>
      _$this._testsIncluded = testsIncluded;

  bool? _isInvoiced;
  bool? get isInvoiced => _$this._isInvoiced;
  set isInvoiced(bool? isInvoiced) => _$this._isInvoiced = isInvoiced;

  bool? _isSubmitted;
  bool? get isSubmitted => _$this._isSubmitted;
  set isSubmitted(bool? isSubmitted) => _$this._isSubmitted = isSubmitted;

  int? _totalTests;
  int? get totalTests => _$this._totalTests;
  set totalTests(int? totalTests) => _$this._totalTests = totalTests;

  String? _pathologist;
  String? get pathologist => _$this._pathologist;
  set pathologist(String? pathologist) => _$this._pathologist = pathologist;

  bool? _userPatient;
  bool? get userPatient => _$this._userPatient;
  set userPatient(bool? userPatient) => _$this._userPatient = userPatient;

  DateTime? _dOB;
  DateTime? get dOB => _$this._dOB;
  set dOB(DateTime? dOB) => _$this._dOB = dOB;

  ListBuilder<DocumentReference<Object?>>? _invoiceRefs;
  ListBuilder<DocumentReference<Object?>> get invoiceRefs =>
      _$this._invoiceRefs ??= new ListBuilder<DocumentReference<Object?>>();
  set invoiceRefs(ListBuilder<DocumentReference<Object?>>? invoiceRefs) =>
      _$this._invoiceRefs = invoiceRefs;

  DateTime? _updatedDate;
  DateTime? get updatedDate => _$this._updatedDate;
  set updatedDate(DateTime? updatedDate) => _$this._updatedDate = updatedDate;

  bool? _paidFull;
  bool? get paidFull => _$this._paidFull;
  set paidFull(bool? paidFull) => _$this._paidFull = paidFull;

  String? _updateRole;
  String? get updateRole => _$this._updateRole;
  set updateRole(String? updateRole) => _$this._updateRole = updateRole;

  bool? _resultPublished;
  bool? get resultPublished => _$this._resultPublished;
  set resultPublished(bool? resultPublished) =>
      _$this._resultPublished = resultPublished;

  double? _paymentBalance;
  double? get paymentBalance => _$this._paymentBalance;
  set paymentBalance(double? paymentBalance) =>
      _$this._paymentBalance = paymentBalance;

  DocumentReference<Object?>? _updateStaff;
  DocumentReference<Object?>? get updateStaff => _$this._updateStaff;
  set updateStaff(DocumentReference<Object?>? updateStaff) =>
      _$this._updateStaff = updateStaff;

  bool? _confirmationBegan;
  bool? get confirmationBegan => _$this._confirmationBegan;
  set confirmationBegan(bool? confirmationBegan) =>
      _$this._confirmationBegan = confirmationBegan;

  ListBuilder<DocumentReference<Object?>>? _bookedTests;
  ListBuilder<DocumentReference<Object?>> get bookedTests =>
      _$this._bookedTests ??= new ListBuilder<DocumentReference<Object?>>();
  set bookedTests(ListBuilder<DocumentReference<Object?>>? bookedTests) =>
      _$this._bookedTests = bookedTests;

  ListBuilder<DocumentReference<Object?>>? _payments;
  ListBuilder<DocumentReference<Object?>> get payments =>
      _$this._payments ??= new ListBuilder<DocumentReference<Object?>>();
  set payments(ListBuilder<DocumentReference<Object?>>? payments) =>
      _$this._payments = payments;

  bool? _reportSent;
  bool? get reportSent => _$this._reportSent;
  set reportSent(bool? reportSent) => _$this._reportSent = reportSent;

  String? _docNames;
  String? get docNames => _$this._docNames;
  set docNames(String? docNames) => _$this._docNames = docNames;

  String? _doctorPhoneNumber;
  String? get doctorPhoneNumber => _$this._doctorPhoneNumber;
  set doctorPhoneNumber(String? doctorPhoneNumber) =>
      _$this._doctorPhoneNumber = doctorPhoneNumber;

  String? _doctorEmail;
  String? get doctorEmail => _$this._doctorEmail;
  set doctorEmail(String? doctorEmail) => _$this._doctorEmail = doctorEmail;

  DocumentReference<Object?>? _docRef;
  DocumentReference<Object?>? get docRef => _$this._docRef;
  set docRef(DocumentReference<Object?>? docRef) => _$this._docRef = docRef;

  ListBuilder<DocumentReference<Object?>>? _verifiedTests;
  ListBuilder<DocumentReference<Object?>> get verifiedTests =>
      _$this._verifiedTests ??= new ListBuilder<DocumentReference<Object?>>();
  set verifiedTests(ListBuilder<DocumentReference<Object?>>? verifiedTests) =>
      _$this._verifiedTests = verifiedTests;

  bool? _hasTestPackages;
  bool? get hasTestPackages => _$this._hasTestPackages;
  set hasTestPackages(bool? hasTestPackages) =>
      _$this._hasTestPackages = hasTestPackages;

  ListBuilder<DocumentReference<Object?>>? _testPackages;
  ListBuilder<DocumentReference<Object?>> get testPackages =>
      _$this._testPackages ??= new ListBuilder<DocumentReference<Object?>>();
  set testPackages(ListBuilder<DocumentReference<Object?>>? testPackages) =>
      _$this._testPackages = testPackages;

  ListBuilder<DocumentReference<Object?>>? _testPackTests;
  ListBuilder<DocumentReference<Object?>> get testPackTests =>
      _$this._testPackTests ??= new ListBuilder<DocumentReference<Object?>>();
  set testPackTests(ListBuilder<DocumentReference<Object?>>? testPackTests) =>
      _$this._testPackTests = testPackTests;

  DocumentReference<Object?>? _reportRef;
  DocumentReference<Object?>? get reportRef => _$this._reportRef;
  set reportRef(DocumentReference<Object?>? reportRef) =>
      _$this._reportRef = reportRef;

  ListBuilder<DocumentReference<Object?>>? _flaggedTests;
  ListBuilder<DocumentReference<Object?>> get flaggedTests =>
      _$this._flaggedTests ??= new ListBuilder<DocumentReference<Object?>>();
  set flaggedTests(ListBuilder<DocumentReference<Object?>>? flaggedTests) =>
      _$this._flaggedTests = flaggedTests;

  ListBuilder<DocumentReference<Object?>>? _frozenTests;
  ListBuilder<DocumentReference<Object?>> get frozenTests =>
      _$this._frozenTests ??= new ListBuilder<DocumentReference<Object?>>();
  set frozenTests(ListBuilder<DocumentReference<Object?>>? frozenTests) =>
      _$this._frozenTests = frozenTests;

  ListBuilder<String>? _formImages;
  ListBuilder<String> get formImages =>
      _$this._formImages ??= new ListBuilder<String>();
  set formImages(ListBuilder<String>? formImages) =>
      _$this._formImages = formImages;

  ListBuilder<String>? _specialTests;
  ListBuilder<String> get specialTests =>
      _$this._specialTests ??= new ListBuilder<String>();
  set specialTests(ListBuilder<String>? specialTests) =>
      _$this._specialTests = specialTests;

  ListBuilder<DocumentReference<Object?>>? _bookedSpecialTests;
  ListBuilder<DocumentReference<Object?>> get bookedSpecialTests =>
      _$this._bookedSpecialTests ??=
          new ListBuilder<DocumentReference<Object?>>();
  set bookedSpecialTests(
          ListBuilder<DocumentReference<Object?>>? bookedSpecialTests) =>
      _$this._bookedSpecialTests = bookedSpecialTests;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  BookingsRecordBuilder() {
    BookingsRecord._initializeBuilder(this);
  }

  BookingsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _labRefNum = $v.labRefNum;
      _createdDate = $v.createdDate;
      _scheduledDate = $v.scheduledDate;
      _completed = $v.completed;
      _testVerified = $v.testVerified;
      _testNotes = $v.testNotes;
      _technologist = $v.technologist;
      _user = $v.user;
      _diagnosis = $v.diagnosis;
      _totalPrice = $v.totalPrice;
      _bookingConfirmed = $v.bookingConfirmed;
      _firstname = $v.firstname;
      _lastname = $v.lastname;
      _phonenumber = $v.phonenumber;
      _sex = $v.sex;
      _emailaddress = $v.emailaddress;
      _bookingstatus = $v.bookingstatus;
      _docNameAddress = $v.docNameAddress;
      _testsIncluded = $v.testsIncluded?.toBuilder();
      _isInvoiced = $v.isInvoiced;
      _isSubmitted = $v.isSubmitted;
      _totalTests = $v.totalTests;
      _pathologist = $v.pathologist;
      _userPatient = $v.userPatient;
      _dOB = $v.dOB;
      _invoiceRefs = $v.invoiceRefs?.toBuilder();
      _updatedDate = $v.updatedDate;
      _paidFull = $v.paidFull;
      _updateRole = $v.updateRole;
      _resultPublished = $v.resultPublished;
      _paymentBalance = $v.paymentBalance;
      _updateStaff = $v.updateStaff;
      _confirmationBegan = $v.confirmationBegan;
      _bookedTests = $v.bookedTests?.toBuilder();
      _payments = $v.payments?.toBuilder();
      _reportSent = $v.reportSent;
      _docNames = $v.docNames;
      _doctorPhoneNumber = $v.doctorPhoneNumber;
      _doctorEmail = $v.doctorEmail;
      _docRef = $v.docRef;
      _verifiedTests = $v.verifiedTests?.toBuilder();
      _hasTestPackages = $v.hasTestPackages;
      _testPackages = $v.testPackages?.toBuilder();
      _testPackTests = $v.testPackTests?.toBuilder();
      _reportRef = $v.reportRef;
      _flaggedTests = $v.flaggedTests?.toBuilder();
      _frozenTests = $v.frozenTests?.toBuilder();
      _formImages = $v.formImages?.toBuilder();
      _specialTests = $v.specialTests?.toBuilder();
      _bookedSpecialTests = $v.bookedSpecialTests?.toBuilder();
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BookingsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$BookingsRecord;
  }

  @override
  void update(void Function(BookingsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  BookingsRecord build() => _build();

  _$BookingsRecord _build() {
    _$BookingsRecord _$result;
    try {
      _$result = _$v ??
          new _$BookingsRecord._(
              labRefNum: labRefNum,
              createdDate: createdDate,
              scheduledDate: scheduledDate,
              completed: completed,
              testVerified: testVerified,
              testNotes: testNotes,
              technologist: technologist,
              user: user,
              diagnosis: diagnosis,
              totalPrice: totalPrice,
              bookingConfirmed: bookingConfirmed,
              firstname: firstname,
              lastname: lastname,
              phonenumber: phonenumber,
              sex: sex,
              emailaddress: emailaddress,
              bookingstatus: bookingstatus,
              docNameAddress: docNameAddress,
              testsIncluded: _testsIncluded?.build(),
              isInvoiced: isInvoiced,
              isSubmitted: isSubmitted,
              totalTests: totalTests,
              pathologist: pathologist,
              userPatient: userPatient,
              dOB: dOB,
              invoiceRefs: _invoiceRefs?.build(),
              updatedDate: updatedDate,
              paidFull: paidFull,
              updateRole: updateRole,
              resultPublished: resultPublished,
              paymentBalance: paymentBalance,
              updateStaff: updateStaff,
              confirmationBegan: confirmationBegan,
              bookedTests: _bookedTests?.build(),
              payments: _payments?.build(),
              reportSent: reportSent,
              docNames: docNames,
              doctorPhoneNumber: doctorPhoneNumber,
              doctorEmail: doctorEmail,
              docRef: docRef,
              verifiedTests: _verifiedTests?.build(),
              hasTestPackages: hasTestPackages,
              testPackages: _testPackages?.build(),
              testPackTests: _testPackTests?.build(),
              reportRef: reportRef,
              flaggedTests: _flaggedTests?.build(),
              frozenTests: _frozenTests?.build(),
              formImages: _formImages?.build(),
              specialTests: _specialTests?.build(),
              bookedSpecialTests: _bookedSpecialTests?.build(),
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'testsIncluded';
        _testsIncluded?.build();

        _$failedField = 'invoiceRefs';
        _invoiceRefs?.build();

        _$failedField = 'bookedTests';
        _bookedTests?.build();
        _$failedField = 'payments';
        _payments?.build();

        _$failedField = 'verifiedTests';
        _verifiedTests?.build();

        _$failedField = 'testPackages';
        _testPackages?.build();
        _$failedField = 'testPackTests';
        _testPackTests?.build();

        _$failedField = 'flaggedTests';
        _flaggedTests?.build();
        _$failedField = 'frozenTests';
        _frozenTests?.build();
        _$failedField = 'formImages';
        _formImages?.build();
        _$failedField = 'specialTests';
        _specialTests?.build();
        _$failedField = 'bookedSpecialTests';
        _bookedSpecialTests?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'BookingsRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
