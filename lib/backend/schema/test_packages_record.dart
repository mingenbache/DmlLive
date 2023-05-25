import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TestPackagesRecord extends FirestoreRecord {
  TestPackagesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "PackageName" field.
  String? _packageName;
  String get packageName => _packageName ?? '';
  bool hasPackageName() => _packageName != null;

  // "Price" field.
  int? _price;
  int get price => _price ?? 0;
  bool hasPrice() => _price != null;

  // "TestsIncluded" field.
  List<DocumentReference>? _testsIncluded;
  List<DocumentReference> get testsIncluded => _testsIncluded ?? const [];
  bool hasTestsIncluded() => _testsIncluded != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "duration" field.
  double? _duration;
  double get duration => _duration ?? 0.0;
  bool hasDuration() => _duration != null;

  // "duration_results" field.
  double? _durationResults;
  double get durationResults => _durationResults ?? 0.0;
  bool hasDurationResults() => _durationResults != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  // "atHome" field.
  bool? _atHome;
  bool get atHome => _atHome ?? false;
  bool hasAtHome() => _atHome != null;

  // "isAvailable" field.
  bool? _isAvailable;
  bool get isAvailable => _isAvailable ?? false;
  bool hasIsAvailable() => _isAvailable != null;

  // "create_Staff" field.
  DocumentReference? _createStaff;
  DocumentReference? get createStaff => _createStaff;
  bool hasCreateStaff() => _createStaff != null;

  // "create_date" field.
  DateTime? _createDate;
  DateTime? get createDate => _createDate;
  bool hasCreateDate() => _createDate != null;

  void _initializeFields() {
    _packageName = snapshotData['PackageName'] as String?;
    _price = snapshotData['Price'] as int?;
    _testsIncluded = getDataList(snapshotData['TestsIncluded']);
    _description = snapshotData['description'] as String?;
    _duration = castToType<double>(snapshotData['duration']);
    _durationResults = castToType<double>(snapshotData['duration_results']);
    _category = snapshotData['category'] as String?;
    _atHome = snapshotData['atHome'] as bool?;
    _isAvailable = snapshotData['isAvailable'] as bool?;
    _createStaff = snapshotData['create_Staff'] as DocumentReference?;
    _createDate = snapshotData['create_date'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('test_Packages');

  static Stream<TestPackagesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TestPackagesRecord.fromSnapshot(s));

  static Future<TestPackagesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TestPackagesRecord.fromSnapshot(s));

  static TestPackagesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TestPackagesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TestPackagesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TestPackagesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TestPackagesRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createTestPackagesRecordData({
  String? packageName,
  int? price,
  String? description,
  double? duration,
  double? durationResults,
  String? category,
  bool? atHome,
  bool? isAvailable,
  DocumentReference? createStaff,
  DateTime? createDate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'PackageName': packageName,
      'Price': price,
      'description': description,
      'duration': duration,
      'duration_results': durationResults,
      'category': category,
      'atHome': atHome,
      'isAvailable': isAvailable,
      'create_Staff': createStaff,
      'create_date': createDate,
    }.withoutNulls,
  );

  return firestoreData;
}
