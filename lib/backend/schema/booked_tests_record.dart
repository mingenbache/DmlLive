import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'booked_tests_record.g.dart';

abstract class BookedTestsRecord
    implements Built<BookedTestsRecord, BookedTestsRecordBuilder> {
  static Serializer<BookedTestsRecord> get serializer =>
      _$bookedTestsRecordSerializer;

  @nullable
  DocumentReference get testRef;

  @nullable
  @BuiltValueField(wireName: 'scheduled_date')
  DateTime get scheduledDate;

  @nullable
  @BuiltValueField(wireName: 'booking_ref')
  DocumentReference get bookingRef;

  @nullable
  @BuiltValueField(wireName: 'sample_collected')
  bool get sampleCollected;

  @nullable
  @BuiltValueField(wireName: 'sample_slide_requested')
  bool get sampleSlideRequested;

  @nullable
  @BuiltValueField(wireName: 'sample_slide_surrendered')
  bool get sampleSlideSurrendered;

  @nullable
  DocumentReference get user;

  @nullable
  @BuiltValueField(wireName: 'test_result')
  String get testResult;

  @nullable
  @BuiltValueField(wireName: 'test_attachment')
  String get testAttachment;

  @nullable
  @BuiltValueField(wireName: 'cart_ref')
  DocumentReference get cartRef;

  @nullable
  @BuiltValueField(wireName: 'created_date')
  DateTime get createdDate;

  @nullable
  @BuiltValueField(wireName: 'has_result')
  bool get hasResult;

  @nullable
  String get labRefNum;

  @nullable
  DocumentReference get technologist;

  @nullable
  DocumentReference get createUser;

  @nullable
  @BuiltValueField(wireName: 'has_test_pack')
  bool get hasTestPack;

  @nullable
  @BuiltValueField(wireName: 'test_pack_ref')
  DocumentReference get testPackRef;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(BookedTestsRecordBuilder builder) => builder
    ..sampleCollected = false
    ..sampleSlideRequested = false
    ..sampleSlideSurrendered = false
    ..testResult = ''
    ..testAttachment = ''
    ..hasResult = false
    ..labRefNum = ''
    ..hasTestPack = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('booked_tests');

  static Stream<BookedTestsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<BookedTestsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  BookedTestsRecord._();
  factory BookedTestsRecord([void Function(BookedTestsRecordBuilder) updates]) =
      _$BookedTestsRecord;

  static BookedTestsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createBookedTestsRecordData({
  DocumentReference testRef,
  DateTime scheduledDate,
  DocumentReference bookingRef,
  bool sampleCollected,
  bool sampleSlideRequested,
  bool sampleSlideSurrendered,
  DocumentReference user,
  String testResult,
  String testAttachment,
  DocumentReference cartRef,
  DateTime createdDate,
  bool hasResult,
  String labRefNum,
  DocumentReference technologist,
  DocumentReference createUser,
  bool hasTestPack,
  DocumentReference testPackRef,
}) =>
    serializers.toFirestore(
        BookedTestsRecord.serializer,
        BookedTestsRecord((b) => b
          ..testRef = testRef
          ..scheduledDate = scheduledDate
          ..bookingRef = bookingRef
          ..sampleCollected = sampleCollected
          ..sampleSlideRequested = sampleSlideRequested
          ..sampleSlideSurrendered = sampleSlideSurrendered
          ..user = user
          ..testResult = testResult
          ..testAttachment = testAttachment
          ..cartRef = cartRef
          ..createdDate = createdDate
          ..hasResult = hasResult
          ..labRefNum = labRefNum
          ..technologist = technologist
          ..createUser = createUser
          ..hasTestPack = hasTestPack
          ..testPackRef = testPackRef));
