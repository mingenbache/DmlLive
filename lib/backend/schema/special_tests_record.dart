import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SpecialTestsRecord extends FirestoreRecord {
  SpecialTestsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "vendor_name" field.
  String? _vendorName;
  String get vendorName => _vendorName ?? '';
  bool hasVendorName() => _vendorName != null;

  // "vendor_contact" field.
  String? _vendorContact;
  String get vendorContact => _vendorContact ?? '';
  bool hasVendorContact() => _vendorContact != null;

  // "cost" field.
  int? _cost;
  int get cost => _cost ?? 0;
  bool hasCost() => _cost != null;

  // "duration_results" field.
  DateTime? _durationResults;
  DateTime? get durationResults => _durationResults;
  bool hasDurationResults() => _durationResults != null;

  // "scheduled_date" field.
  DateTime? _scheduledDate;
  DateTime? get scheduledDate => _scheduledDate;
  bool hasScheduledDate() => _scheduledDate != null;

  // "technologist_Assigned" field.
  DocumentReference? _technologistAssigned;
  DocumentReference? get technologistAssigned => _technologistAssigned;
  bool hasTechnologistAssigned() => _technologistAssigned != null;

  // "booking_ref" field.
  DocumentReference? _bookingRef;
  DocumentReference? get bookingRef => _bookingRef;
  bool hasBookingRef() => _bookingRef != null;

  // "sample_collected" field.
  bool? _sampleCollected;
  bool get sampleCollected => _sampleCollected ?? false;
  bool hasSampleCollected() => _sampleCollected != null;

  // "result_submitted" field.
  bool? _resultSubmitted;
  bool get resultSubmitted => _resultSubmitted ?? false;
  bool hasResultSubmitted() => _resultSubmitted != null;

  // "created_by" field.
  DocumentReference? _createdBy;
  DocumentReference? get createdBy => _createdBy;
  bool hasCreatedBy() => _createdBy != null;

  // "created_date" field.
  DateTime? _createdDate;
  DateTime? get createdDate => _createdDate;
  bool hasCreatedDate() => _createdDate != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "test_at_home" field.
  bool? _testAtHome;
  bool get testAtHome => _testAtHome ?? false;
  bool hasTestAtHome() => _testAtHome != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  // "stringListIndex" field.
  int? _stringListIndex;
  int get stringListIndex => _stringListIndex ?? 0;
  bool hasStringListIndex() => _stringListIndex != null;

  // "isVerified" field.
  bool? _isVerified;
  bool get isVerified => _isVerified ?? false;
  bool hasIsVerified() => _isVerified != null;

  // "pathologistNotes" field.
  String? _pathologistNotes;
  String get pathologistNotes => _pathologistNotes ?? '';
  bool hasPathologistNotes() => _pathologistNotes != null;

  // "resultAttachment" field.
  String? _resultAttachment;
  String get resultAttachment => _resultAttachment ?? '';
  bool hasResultAttachment() => _resultAttachment != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _vendorName = snapshotData['vendor_name'] as String?;
    _vendorContact = snapshotData['vendor_contact'] as String?;
    _cost = snapshotData['cost'] as int?;
    _durationResults = snapshotData['duration_results'] as DateTime?;
    _scheduledDate = snapshotData['scheduled_date'] as DateTime?;
    _technologistAssigned =
        snapshotData['technologist_Assigned'] as DocumentReference?;
    _bookingRef = snapshotData['booking_ref'] as DocumentReference?;
    _sampleCollected = snapshotData['sample_collected'] as bool?;
    _resultSubmitted = snapshotData['result_submitted'] as bool?;
    _createdBy = snapshotData['created_by'] as DocumentReference?;
    _createdDate = snapshotData['created_date'] as DateTime?;
    _description = snapshotData['description'] as String?;
    _testAtHome = snapshotData['test_at_home'] as bool?;
    _category = snapshotData['category'] as String?;
    _stringListIndex = snapshotData['stringListIndex'] as int?;
    _isVerified = snapshotData['isVerified'] as bool?;
    _pathologistNotes = snapshotData['pathologistNotes'] as String?;
    _resultAttachment = snapshotData['resultAttachment'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('special_tests');

  static Stream<SpecialTestsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SpecialTestsRecord.fromSnapshot(s));

  static Future<SpecialTestsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SpecialTestsRecord.fromSnapshot(s));

  static SpecialTestsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SpecialTestsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SpecialTestsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SpecialTestsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SpecialTestsRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createSpecialTestsRecordData({
  String? name,
  String? vendorName,
  String? vendorContact,
  int? cost,
  DateTime? durationResults,
  DateTime? scheduledDate,
  DocumentReference? technologistAssigned,
  DocumentReference? bookingRef,
  bool? sampleCollected,
  bool? resultSubmitted,
  DocumentReference? createdBy,
  DateTime? createdDate,
  String? description,
  bool? testAtHome,
  String? category,
  int? stringListIndex,
  bool? isVerified,
  String? pathologistNotes,
  String? resultAttachment,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'vendor_name': vendorName,
      'vendor_contact': vendorContact,
      'cost': cost,
      'duration_results': durationResults,
      'scheduled_date': scheduledDate,
      'technologist_Assigned': technologistAssigned,
      'booking_ref': bookingRef,
      'sample_collected': sampleCollected,
      'result_submitted': resultSubmitted,
      'created_by': createdBy,
      'created_date': createdDate,
      'description': description,
      'test_at_home': testAtHome,
      'category': category,
      'stringListIndex': stringListIndex,
      'isVerified': isVerified,
      'pathologistNotes': pathologistNotes,
      'resultAttachment': resultAttachment,
    }.withoutNulls,
  );

  return firestoreData;
}
