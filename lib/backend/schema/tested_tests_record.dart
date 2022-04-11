import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'tested_tests_record.g.dart';

abstract class TestedTestsRecord
    implements Built<TestedTestsRecord, TestedTestsRecordBuilder> {
  static Serializer<TestedTestsRecord> get serializer =>
      _$testedTestsRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'test_ref')
  DocumentReference get testRef;

  @nullable
  @BuiltValueField(wireName: 'booking_ref')
  DocumentReference get bookingRef;

  @nullable
  @BuiltValueField(wireName: 'is_verified')
  bool get isVerified;

  @nullable
  @BuiltValueField(wireName: 'is_flagged')
  bool get isFlagged;

  @nullable
  @BuiltValueField(wireName: 'pathologist_Ref')
  DocumentReference get pathologistRef;

  @nullable
  @BuiltValueField(wireName: 'date_conducted')
  DateTime get dateConducted;

  @nullable
  @BuiltValueField(wireName: 'results_positive')
  bool get resultsPositive;

  @nullable
  @BuiltValueField(wireName: 'results_attachment')
  BuiltList<String> get resultsAttachment;

  @nullable
  @BuiltValueField(wireName: 'sample_released')
  bool get sampleReleased;

  @nullable
  @BuiltValueField(wireName: 'booked_test_Ref')
  DocumentReference get bookedTestRef;

  @nullable
  @BuiltValueField(wireName: 'machine_used')
  DocumentReference get machineUsed;

  @nullable
  @BuiltValueField(wireName: 'flagged_date')
  DateTime get flaggedDate;

  @nullable
  @BuiltValueField(wireName: 'date_sample_collected')
  DateTime get dateSampleCollected;

  @nullable
  String get labRefNum;

  @nullable
  @BuiltValueField(wireName: 'test_note')
  String get testNote;

  @nullable
  @BuiltValueField(wireName: 'pathologist_note')
  String get pathologistNote;

  @nullable
  @BuiltValueField(wireName: 'test_result')
  String get testResult;

  @nullable
  @BuiltValueField(wireName: 'flag_notes')
  String get flagNotes;

  @nullable
  bool get resultPosted;

  @nullable
  @BuiltValueField(wireName: 'staff_Reference')
  DocumentReference get staffReference;

  @nullable
  @BuiltValueField(wireName: 'verified_Date')
  DateTime get verifiedDate;

  @nullable
  String get batchNum;

  @nullable
  @BuiltValueField(wireName: 'has_test_pack')
  bool get hasTestPack;

  @nullable
  DocumentReference get testPackRef;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(TestedTestsRecordBuilder builder) => builder
    ..isVerified = false
    ..isFlagged = false
    ..resultsPositive = false
    ..resultsAttachment = ListBuilder()
    ..sampleReleased = false
    ..labRefNum = ''
    ..testNote = ''
    ..pathologistNote = ''
    ..testResult = ''
    ..flagNotes = ''
    ..resultPosted = false
    ..batchNum = ''
    ..hasTestPack = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('tested_tests');

  static Stream<TestedTestsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<TestedTestsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  TestedTestsRecord._();
  factory TestedTestsRecord([void Function(TestedTestsRecordBuilder) updates]) =
      _$TestedTestsRecord;

  static TestedTestsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createTestedTestsRecordData({
  DocumentReference testRef,
  DocumentReference bookingRef,
  bool isVerified,
  bool isFlagged,
  DocumentReference pathologistRef,
  DateTime dateConducted,
  bool resultsPositive,
  bool sampleReleased,
  DocumentReference bookedTestRef,
  DocumentReference machineUsed,
  DateTime flaggedDate,
  DateTime dateSampleCollected,
  String labRefNum,
  String testNote,
  String pathologistNote,
  String testResult,
  String flagNotes,
  bool resultPosted,
  DocumentReference staffReference,
  DateTime verifiedDate,
  String batchNum,
  bool hasTestPack,
  DocumentReference testPackRef,
}) =>
    serializers.toFirestore(
        TestedTestsRecord.serializer,
        TestedTestsRecord((t) => t
          ..testRef = testRef
          ..bookingRef = bookingRef
          ..isVerified = isVerified
          ..isFlagged = isFlagged
          ..pathologistRef = pathologistRef
          ..dateConducted = dateConducted
          ..resultsPositive = resultsPositive
          ..resultsAttachment = null
          ..sampleReleased = sampleReleased
          ..bookedTestRef = bookedTestRef
          ..machineUsed = machineUsed
          ..flaggedDate = flaggedDate
          ..dateSampleCollected = dateSampleCollected
          ..labRefNum = labRefNum
          ..testNote = testNote
          ..pathologistNote = pathologistNote
          ..testResult = testResult
          ..flagNotes = flagNotes
          ..resultPosted = resultPosted
          ..staffReference = staffReference
          ..verifiedDate = verifiedDate
          ..batchNum = batchNum
          ..hasTestPack = hasTestPack
          ..testPackRef = testPackRef));
