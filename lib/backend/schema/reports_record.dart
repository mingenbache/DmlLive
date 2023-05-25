import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ReportsRecord extends FirestoreRecord {
  ReportsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "booking" field.
  DocumentReference? _booking;
  DocumentReference? get booking => _booking;
  bool hasBooking() => _booking != null;

  // "testedTests" field.
  List<DocumentReference>? _testedTests;
  List<DocumentReference> get testedTests => _testedTests ?? const [];
  bool hasTestedTests() => _testedTests != null;

  // "bookinguser" field.
  DocumentReference? _bookinguser;
  DocumentReference? get bookinguser => _bookinguser;
  bool hasBookinguser() => _bookinguser != null;

  // "doctor" field.
  DocumentReference? _doctor;
  DocumentReference? get doctor => _doctor;
  bool hasDoctor() => _doctor != null;

  // "technologist" field.
  List<DocumentReference>? _technologist;
  List<DocumentReference> get technologist => _technologist ?? const [];
  bool hasTechnologist() => _technologist != null;

  // "pathologistComments" field.
  String? _pathologistComments;
  String get pathologistComments => _pathologistComments ?? '';
  bool hasPathologistComments() => _pathologistComments != null;

  // "samples_released" field.
  List<String>? _samplesReleased;
  List<String> get samplesReleased => _samplesReleased ?? const [];
  bool hasSamplesReleased() => _samplesReleased != null;

  // "createdDate" field.
  DateTime? _createdDate;
  DateTime? get createdDate => _createdDate;
  bool hasCreatedDate() => _createdDate != null;

  // "createdUser" field.
  DocumentReference? _createdUser;
  DocumentReference? get createdUser => _createdUser;
  bool hasCreatedUser() => _createdUser != null;

  // "isComplete" field.
  bool? _isComplete;
  bool get isComplete => _isComplete ?? false;
  bool hasIsComplete() => _isComplete != null;

  // "patientName" field.
  String? _patientName;
  String get patientName => _patientName ?? '';
  bool hasPatientName() => _patientName != null;

  // "patientSex" field.
  String? _patientSex;
  String get patientSex => _patientSex ?? '';
  bool hasPatientSex() => _patientSex != null;

  // "labRefNum" field.
  String? _labRefNum;
  String get labRefNum => _labRefNum ?? '';
  bool hasLabRefNum() => _labRefNum != null;

  // "pathologist" field.
  String? _pathologist;
  String get pathologist => _pathologist ?? '';
  bool hasPathologist() => _pathologist != null;

  // "DML_Email" field.
  String? _dMLEmail;
  String get dMLEmail => _dMLEmail ?? '';
  bool hasDMLEmail() => _dMLEmail != null;

  // "patientAge" field.
  int? _patientAge;
  int get patientAge => _patientAge ?? 0;
  bool hasPatientAge() => _patientAge != null;

  // "testpackageList" field.
  List<DocumentReference>? _testpackageList;
  List<DocumentReference> get testpackageList => _testpackageList ?? const [];
  bool hasTestpackageList() => _testpackageList != null;

  void _initializeFields() {
    _booking = snapshotData['booking'] as DocumentReference?;
    _testedTests = getDataList(snapshotData['testedTests']);
    _bookinguser = snapshotData['bookinguser'] as DocumentReference?;
    _doctor = snapshotData['doctor'] as DocumentReference?;
    _technologist = getDataList(snapshotData['technologist']);
    _pathologistComments = snapshotData['pathologistComments'] as String?;
    _samplesReleased = getDataList(snapshotData['samples_released']);
    _createdDate = snapshotData['createdDate'] as DateTime?;
    _createdUser = snapshotData['createdUser'] as DocumentReference?;
    _isComplete = snapshotData['isComplete'] as bool?;
    _patientName = snapshotData['patientName'] as String?;
    _patientSex = snapshotData['patientSex'] as String?;
    _labRefNum = snapshotData['labRefNum'] as String?;
    _pathologist = snapshotData['pathologist'] as String?;
    _dMLEmail = snapshotData['DML_Email'] as String?;
    _patientAge = snapshotData['patientAge'] as int?;
    _testpackageList = getDataList(snapshotData['testpackageList']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('reports');

  static Stream<ReportsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ReportsRecord.fromSnapshot(s));

  static Future<ReportsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ReportsRecord.fromSnapshot(s));

  static ReportsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ReportsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ReportsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ReportsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ReportsRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createReportsRecordData({
  DocumentReference? booking,
  DocumentReference? bookinguser,
  DocumentReference? doctor,
  String? pathologistComments,
  DateTime? createdDate,
  DocumentReference? createdUser,
  bool? isComplete,
  String? patientName,
  String? patientSex,
  String? labRefNum,
  String? pathologist,
  String? dMLEmail,
  int? patientAge,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'booking': booking,
      'bookinguser': bookinguser,
      'doctor': doctor,
      'pathologistComments': pathologistComments,
      'createdDate': createdDate,
      'createdUser': createdUser,
      'isComplete': isComplete,
      'patientName': patientName,
      'patientSex': patientSex,
      'labRefNum': labRefNum,
      'pathologist': pathologist,
      'DML_Email': dMLEmail,
      'patientAge': patientAge,
    }.withoutNulls,
  );

  return firestoreData;
}
