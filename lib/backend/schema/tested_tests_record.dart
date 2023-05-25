import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TestedTestsRecord extends FirestoreRecord {
  TestedTestsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "test_ref" field.
  DocumentReference? _testRef;
  DocumentReference? get testRef => _testRef;
  bool hasTestRef() => _testRef != null;

  // "booking_ref" field.
  DocumentReference? _bookingRef;
  DocumentReference? get bookingRef => _bookingRef;
  bool hasBookingRef() => _bookingRef != null;

  // "is_verified" field.
  bool? _isVerified;
  bool get isVerified => _isVerified ?? false;
  bool hasIsVerified() => _isVerified != null;

  // "is_flagged" field.
  bool? _isFlagged;
  bool get isFlagged => _isFlagged ?? false;
  bool hasIsFlagged() => _isFlagged != null;

  // "pathologist_Ref" field.
  DocumentReference? _pathologistRef;
  DocumentReference? get pathologistRef => _pathologistRef;
  bool hasPathologistRef() => _pathologistRef != null;

  // "date_conducted" field.
  DateTime? _dateConducted;
  DateTime? get dateConducted => _dateConducted;
  bool hasDateConducted() => _dateConducted != null;

  // "results_positive" field.
  bool? _resultsPositive;
  bool get resultsPositive => _resultsPositive ?? false;
  bool hasResultsPositive() => _resultsPositive != null;

  // "results_attachment" field.
  List<String>? _resultsAttachment;
  List<String> get resultsAttachment => _resultsAttachment ?? const [];
  bool hasResultsAttachment() => _resultsAttachment != null;

  // "sample_released" field.
  bool? _sampleReleased;
  bool get sampleReleased => _sampleReleased ?? false;
  bool hasSampleReleased() => _sampleReleased != null;

  // "booked_test_Ref" field.
  DocumentReference? _bookedTestRef;
  DocumentReference? get bookedTestRef => _bookedTestRef;
  bool hasBookedTestRef() => _bookedTestRef != null;

  // "machine_used" field.
  DocumentReference? _machineUsed;
  DocumentReference? get machineUsed => _machineUsed;
  bool hasMachineUsed() => _machineUsed != null;

  // "flagged_date" field.
  DateTime? _flaggedDate;
  DateTime? get flaggedDate => _flaggedDate;
  bool hasFlaggedDate() => _flaggedDate != null;

  // "date_sample_collected" field.
  DateTime? _dateSampleCollected;
  DateTime? get dateSampleCollected => _dateSampleCollected;
  bool hasDateSampleCollected() => _dateSampleCollected != null;

  // "labRefNum" field.
  String? _labRefNum;
  String get labRefNum => _labRefNum ?? '';
  bool hasLabRefNum() => _labRefNum != null;

  // "test_note" field.
  String? _testNote;
  String get testNote => _testNote ?? '';
  bool hasTestNote() => _testNote != null;

  // "pathologist_note" field.
  String? _pathologistNote;
  String get pathologistNote => _pathologistNote ?? '';
  bool hasPathologistNote() => _pathologistNote != null;

  // "test_result" field.
  String? _testResult;
  String get testResult => _testResult ?? '';
  bool hasTestResult() => _testResult != null;

  // "flag_notes" field.
  String? _flagNotes;
  String get flagNotes => _flagNotes ?? '';
  bool hasFlagNotes() => _flagNotes != null;

  // "resultPosted" field.
  bool? _resultPosted;
  bool get resultPosted => _resultPosted ?? false;
  bool hasResultPosted() => _resultPosted != null;

  // "staff_Reference" field.
  DocumentReference? _staffReference;
  DocumentReference? get staffReference => _staffReference;
  bool hasStaffReference() => _staffReference != null;

  // "verified_Date" field.
  DateTime? _verifiedDate;
  DateTime? get verifiedDate => _verifiedDate;
  bool hasVerifiedDate() => _verifiedDate != null;

  // "batchNum" field.
  String? _batchNum;
  String get batchNum => _batchNum ?? '';
  bool hasBatchNum() => _batchNum != null;

  // "has_test_pack" field.
  bool? _hasTestPack;
  bool get hasTestPack => _hasTestPack ?? false;
  bool hasHasTestPack() => _hasTestPack != null;

  // "testPackRef" field.
  DocumentReference? _testPackRef;
  DocumentReference? get testPackRef => _testPackRef;
  bool hasTestPackRef() => _testPackRef != null;

  void _initializeFields() {
    _testRef = snapshotData['test_ref'] as DocumentReference?;
    _bookingRef = snapshotData['booking_ref'] as DocumentReference?;
    _isVerified = snapshotData['is_verified'] as bool?;
    _isFlagged = snapshotData['is_flagged'] as bool?;
    _pathologistRef = snapshotData['pathologist_Ref'] as DocumentReference?;
    _dateConducted = snapshotData['date_conducted'] as DateTime?;
    _resultsPositive = snapshotData['results_positive'] as bool?;
    _resultsAttachment = getDataList(snapshotData['results_attachment']);
    _sampleReleased = snapshotData['sample_released'] as bool?;
    _bookedTestRef = snapshotData['booked_test_Ref'] as DocumentReference?;
    _machineUsed = snapshotData['machine_used'] as DocumentReference?;
    _flaggedDate = snapshotData['flagged_date'] as DateTime?;
    _dateSampleCollected = snapshotData['date_sample_collected'] as DateTime?;
    _labRefNum = snapshotData['labRefNum'] as String?;
    _testNote = snapshotData['test_note'] as String?;
    _pathologistNote = snapshotData['pathologist_note'] as String?;
    _testResult = snapshotData['test_result'] as String?;
    _flagNotes = snapshotData['flag_notes'] as String?;
    _resultPosted = snapshotData['resultPosted'] as bool?;
    _staffReference = snapshotData['staff_Reference'] as DocumentReference?;
    _verifiedDate = snapshotData['verified_Date'] as DateTime?;
    _batchNum = snapshotData['batchNum'] as String?;
    _hasTestPack = snapshotData['has_test_pack'] as bool?;
    _testPackRef = snapshotData['testPackRef'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('tested_tests');

  static Stream<TestedTestsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TestedTestsRecord.fromSnapshot(s));

  static Future<TestedTestsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TestedTestsRecord.fromSnapshot(s));

  static TestedTestsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TestedTestsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TestedTestsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TestedTestsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TestedTestsRecord(reference: ${reference.path}, data: $snapshotData)';
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
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'test_ref': testRef,
      'booking_ref': bookingRef,
      'is_verified': isVerified,
      'is_flagged': isFlagged,
      'pathologist_Ref': pathologistRef,
      'date_conducted': dateConducted,
      'results_positive': resultsPositive,
      'sample_released': sampleReleased,
      'booked_test_Ref': bookedTestRef,
      'machine_used': machineUsed,
      'flagged_date': flaggedDate,
      'date_sample_collected': dateSampleCollected,
      'labRefNum': labRefNum,
      'test_note': testNote,
      'pathologist_note': pathologistNote,
      'test_result': testResult,
      'flag_notes': flagNotes,
      'resultPosted': resultPosted,
      'staff_Reference': staffReference,
      'verified_Date': verifiedDate,
      'batchNum': batchNum,
      'has_test_pack': hasTestPack,
      'testPackRef': testPackRef,
    }.withoutNulls,
  );

  return firestoreData;
}
