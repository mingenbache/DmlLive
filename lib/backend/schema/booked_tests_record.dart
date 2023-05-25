import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BookedTestsRecord extends FirestoreRecord {
  BookedTestsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "testRef" field.
  DocumentReference? _testRef;
  DocumentReference? get testRef => _testRef;
  bool hasTestRef() => _testRef != null;

  // "scheduled_date" field.
  DateTime? _scheduledDate;
  DateTime? get scheduledDate => _scheduledDate;
  bool hasScheduledDate() => _scheduledDate != null;

  // "booking_ref" field.
  DocumentReference? _bookingRef;
  DocumentReference? get bookingRef => _bookingRef;
  bool hasBookingRef() => _bookingRef != null;

  // "sample_collected" field.
  bool? _sampleCollected;
  bool get sampleCollected => _sampleCollected ?? false;
  bool hasSampleCollected() => _sampleCollected != null;

  // "sample_slide_requested" field.
  bool? _sampleSlideRequested;
  bool get sampleSlideRequested => _sampleSlideRequested ?? false;
  bool hasSampleSlideRequested() => _sampleSlideRequested != null;

  // "sample_slide_surrendered" field.
  bool? _sampleSlideSurrendered;
  bool get sampleSlideSurrendered => _sampleSlideSurrendered ?? false;
  bool hasSampleSlideSurrendered() => _sampleSlideSurrendered != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "test_result" field.
  String? _testResult;
  String get testResult => _testResult ?? '';
  bool hasTestResult() => _testResult != null;

  // "test_attachment" field.
  String? _testAttachment;
  String get testAttachment => _testAttachment ?? '';
  bool hasTestAttachment() => _testAttachment != null;

  // "created_date" field.
  DateTime? _createdDate;
  DateTime? get createdDate => _createdDate;
  bool hasCreatedDate() => _createdDate != null;

  // "has_result" field.
  bool? _hasResult;
  bool get hasResult => _hasResult ?? false;
  bool hasHasResult() => _hasResult != null;

  // "labRefNum" field.
  String? _labRefNum;
  String get labRefNum => _labRefNum ?? '';
  bool hasLabRefNum() => _labRefNum != null;

  // "technologist" field.
  DocumentReference? _technologist;
  DocumentReference? get technologist => _technologist;
  bool hasTechnologist() => _technologist != null;

  // "createUser" field.
  DocumentReference? _createUser;
  DocumentReference? get createUser => _createUser;
  bool hasCreateUser() => _createUser != null;

  // "has_test_pack" field.
  bool? _hasTestPack;
  bool get hasTestPack => _hasTestPack ?? false;
  bool hasHasTestPack() => _hasTestPack != null;

  // "test_pack_ref" field.
  DocumentReference? _testPackRef;
  DocumentReference? get testPackRef => _testPackRef;
  bool hasTestPackRef() => _testPackRef != null;

  // "tested_test_Ref" field.
  DocumentReference? _testedTestRef;
  DocumentReference? get testedTestRef => _testedTestRef;
  bool hasTestedTestRef() => _testedTestRef != null;

  void _initializeFields() {
    _testRef = snapshotData['testRef'] as DocumentReference?;
    _scheduledDate = snapshotData['scheduled_date'] as DateTime?;
    _bookingRef = snapshotData['booking_ref'] as DocumentReference?;
    _sampleCollected = snapshotData['sample_collected'] as bool?;
    _sampleSlideRequested = snapshotData['sample_slide_requested'] as bool?;
    _sampleSlideSurrendered = snapshotData['sample_slide_surrendered'] as bool?;
    _user = snapshotData['user'] as DocumentReference?;
    _testResult = snapshotData['test_result'] as String?;
    _testAttachment = snapshotData['test_attachment'] as String?;
    _createdDate = snapshotData['created_date'] as DateTime?;
    _hasResult = snapshotData['has_result'] as bool?;
    _labRefNum = snapshotData['labRefNum'] as String?;
    _technologist = snapshotData['technologist'] as DocumentReference?;
    _createUser = snapshotData['createUser'] as DocumentReference?;
    _hasTestPack = snapshotData['has_test_pack'] as bool?;
    _testPackRef = snapshotData['test_pack_ref'] as DocumentReference?;
    _testedTestRef = snapshotData['tested_test_Ref'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('booked_tests');

  static Stream<BookedTestsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BookedTestsRecord.fromSnapshot(s));

  static Future<BookedTestsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BookedTestsRecord.fromSnapshot(s));

  static BookedTestsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BookedTestsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BookedTestsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BookedTestsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BookedTestsRecord(reference: ${reference.path}, data: $snapshotData)';
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
  DocumentReference? testedTestRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'testRef': testRef,
      'scheduled_date': scheduledDate,
      'booking_ref': bookingRef,
      'sample_collected': sampleCollected,
      'sample_slide_requested': sampleSlideRequested,
      'sample_slide_surrendered': sampleSlideSurrendered,
      'user': user,
      'test_result': testResult,
      'test_attachment': testAttachment,
      'created_date': createdDate,
      'has_result': hasResult,
      'labRefNum': labRefNum,
      'technologist': technologist,
      'createUser': createUser,
      'has_test_pack': hasTestPack,
      'test_pack_ref': testPackRef,
      'tested_test_Ref': testedTestRef,
    }.withoutNulls,
  );

  return firestoreData;
}
