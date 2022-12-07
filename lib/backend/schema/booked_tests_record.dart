import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'booked_tests_record.g.dart';

abstract class BookedTestsRecord
    implements Built<BookedTestsRecord, BookedTestsRecordBuilder> {
  static Serializer<BookedTestsRecord> get serializer =>
      _$bookedTestsRecordSerializer;

  DocumentReference? get testRef;

  @BuiltValueField(wireName: 'scheduled_date')
  DateTime? get scheduledDate;

  @BuiltValueField(wireName: 'booking_ref')
  DocumentReference? get bookingRef;

  @BuiltValueField(wireName: 'sample_collected')
  bool? get sampleCollected;

  @BuiltValueField(wireName: 'sample_slide_requested')
  bool? get sampleSlideRequested;

  @BuiltValueField(wireName: 'sample_slide_surrendered')
  bool? get sampleSlideSurrendered;

  DocumentReference? get user;

  @BuiltValueField(wireName: 'test_result')
  String? get testResult;

  @BuiltValueField(wireName: 'test_attachment')
  String? get testAttachment;

  @BuiltValueField(wireName: 'created_date')
  DateTime? get createdDate;

  @BuiltValueField(wireName: 'has_result')
  bool? get hasResult;

  String? get labRefNum;

  DocumentReference? get technologist;

  DocumentReference? get createUser;

  @BuiltValueField(wireName: 'has_test_pack')
  bool? get hasTestPack;

  @BuiltValueField(wireName: 'test_pack_ref')
  DocumentReference? get testPackRef;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

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
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<BookedTestsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  BookedTestsRecord._();
  factory BookedTestsRecord([void Function(BookedTestsRecordBuilder) updates]) =
      _$BookedTestsRecord;

  static BookedTestsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createBookedTestsRecordData({
  DocumentReference? testRef,
  DateTime? scheduledDate,
  DocumentReference? bookingRef,
  bool? sampleCollected,
  bool? sampleSlideRequested,
  bool? sampleSlideSurrendered,
  DocumentReference? user,
  String? testResult,
  String? testAttachment,
  DateTime? createdDate,
  bool? hasResult,
  String? labRefNum,
  DocumentReference? technologist,
  DocumentReference? createUser,
  bool? hasTestPack,
  DocumentReference? testPackRef,
}) {
  final firestoreData = serializers.toFirestore(
    BookedTestsRecord.serializer,
    BookedTestsRecord(
      (b) => b
        ..testRef = testRef
        ..scheduledDate = scheduledDate
        ..bookingRef = bookingRef
        ..sampleCollected = sampleCollected
        ..sampleSlideRequested = sampleSlideRequested
        ..sampleSlideSurrendered = sampleSlideSurrendered
        ..user = user
        ..testResult = testResult
        ..testAttachment = testAttachment
        ..createdDate = createdDate
        ..hasResult = hasResult
        ..labRefNum = labRefNum
        ..technologist = technologist
        ..createUser = createUser
        ..hasTestPack = hasTestPack
        ..testPackRef = testPackRef,
    ),
  );

  return firestoreData;
}
