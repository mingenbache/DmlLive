import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'tested_tests_record.g.dart';

abstract class TestedTestsRecord
    implements Built<TestedTestsRecord, TestedTestsRecordBuilder> {
  static Serializer<TestedTestsRecord> get serializer =>
      _$testedTestsRecordSerializer;

  @BuiltValueField(wireName: 'test_ref')
  DocumentReference? get testRef;

  @BuiltValueField(wireName: 'booking_ref')
  DocumentReference? get bookingRef;

  @BuiltValueField(wireName: 'is_verified')
  bool? get isVerified;

  @BuiltValueField(wireName: 'is_flagged')
  bool? get isFlagged;

  @BuiltValueField(wireName: 'pathologist_Ref')
  DocumentReference? get pathologistRef;

  @BuiltValueField(wireName: 'date_conducted')
  DateTime? get dateConducted;

  @BuiltValueField(wireName: 'results_positive')
  bool? get resultsPositive;

  @BuiltValueField(wireName: 'results_attachment')
  BuiltList<String>? get resultsAttachment;

  @BuiltValueField(wireName: 'sample_released')
  bool? get sampleReleased;

  @BuiltValueField(wireName: 'booked_test_Ref')
  DocumentReference? get bookedTestRef;

  @BuiltValueField(wireName: 'machine_used')
  DocumentReference? get machineUsed;

  @BuiltValueField(wireName: 'flagged_date')
  DateTime? get flaggedDate;

  @BuiltValueField(wireName: 'date_sample_collected')
  DateTime? get dateSampleCollected;

  String? get labRefNum;

  @BuiltValueField(wireName: 'test_note')
  String? get testNote;

  @BuiltValueField(wireName: 'pathologist_note')
  String? get pathologistNote;

  @BuiltValueField(wireName: 'test_result')
  String? get testResult;

  @BuiltValueField(wireName: 'flag_notes')
  String? get flagNotes;

  bool? get resultPosted;

  @BuiltValueField(wireName: 'staff_Reference')
  DocumentReference? get staffReference;

  @BuiltValueField(wireName: 'verified_Date')
  DateTime? get verifiedDate;

  String? get batchNum;

  @BuiltValueField(wireName: 'has_test_pack')
  bool? get hasTestPack;

  DocumentReference? get testPackRef;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

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
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<TestedTestsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  TestedTestsRecord._();
  factory TestedTestsRecord([void Function(TestedTestsRecordBuilder) updates]) =
      _$TestedTestsRecord;

  static TestedTestsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createTestedTestsRecordData({
  DocumentReference? testRef,
  DocumentReference? bookingRef,
  bool? isVerified,
  bool? isFlagged,
  DocumentReference? pathologistRef,
  DateTime? dateConducted,
  bool? resultsPositive,
  bool? sampleReleased,
  DocumentReference? bookedTestRef,
  DocumentReference? machineUsed,
  DateTime? flaggedDate,
  DateTime? dateSampleCollected,
  String? labRefNum,
  String? testNote,
  String? pathologistNote,
  String? testResult,
  String? flagNotes,
  bool? resultPosted,
  DocumentReference? staffReference,
  DateTime? verifiedDate,
  String? batchNum,
  bool? hasTestPack,
  DocumentReference? testPackRef,
}) {
  final firestoreData = serializers.toFirestore(
    TestedTestsRecord.serializer,
    TestedTestsRecord(
      (t) => t
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
        ..testPackRef = testPackRef,
    ),
  );

  return firestoreData;
}
