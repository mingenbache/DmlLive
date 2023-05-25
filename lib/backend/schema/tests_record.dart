import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TestsRecord extends FirestoreRecord {
  TestsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "price" field.
  int? _price;
  int get price => _price ?? 0;
  bool hasPrice() => _price != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "home_test" field.
  bool? _homeTest;
  bool get homeTest => _homeTest ?? false;
  bool hasHomeTest() => _homeTest != null;

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

  // "is_available" field.
  bool? _isAvailable;
  bool get isAvailable => _isAvailable ?? false;
  bool hasIsAvailable() => _isAvailable != null;

  // "Keywords" field.
  List<String>? _keywords;
  List<String> get keywords => _keywords ?? const [];
  bool hasKeywords() => _keywords != null;

  // "update_date" field.
  DateTime? _updateDate;
  DateTime? get updateDate => _updateDate;
  bool hasUpdateDate() => _updateDate != null;

  // "updateRole" field.
  String? _updateRole;
  String get updateRole => _updateRole ?? '';
  bool hasUpdateRole() => _updateRole != null;

  // "varianceMale" field.
  String? _varianceMale;
  String get varianceMale => _varianceMale ?? '';
  bool hasVarianceMale() => _varianceMale != null;

  // "varianceFemale" field.
  String? _varianceFemale;
  String get varianceFemale => _varianceFemale ?? '';
  bool hasVarianceFemale() => _varianceFemale != null;

  // "varianceUnitsMale" field.
  String? _varianceUnitsMale;
  String get varianceUnitsMale => _varianceUnitsMale ?? '';
  bool hasVarianceUnitsMale() => _varianceUnitsMale != null;

  // "varianceUnitsFemale" field.
  String? _varianceUnitsFemale;
  String get varianceUnitsFemale => _varianceUnitsFemale ?? '';
  bool hasVarianceUnitsFemale() => _varianceUnitsFemale != null;

  // "equipmentInfo" field.
  String? _equipmentInfo;
  String get equipmentInfo => _equipmentInfo ?? '';
  bool hasEquipmentInfo() => _equipmentInfo != null;

  // "procedure" field.
  List<String>? _procedure;
  List<String> get procedure => _procedure ?? const [];
  bool hasProcedure() => _procedure != null;

  void _initializeFields() {
    _price = snapshotData['price'] as int?;
    _name = snapshotData['name'] as String?;
    _homeTest = snapshotData['home_test'] as bool?;
    _description = snapshotData['description'] as String?;
    _duration = castToType<double>(snapshotData['duration']);
    _durationResults = castToType<double>(snapshotData['duration_results']);
    _category = snapshotData['category'] as String?;
    _isAvailable = snapshotData['is_available'] as bool?;
    _keywords = getDataList(snapshotData['Keywords']);
    _updateDate = snapshotData['update_date'] as DateTime?;
    _updateRole = snapshotData['updateRole'] as String?;
    _varianceMale = snapshotData['varianceMale'] as String?;
    _varianceFemale = snapshotData['varianceFemale'] as String?;
    _varianceUnitsMale = snapshotData['varianceUnitsMale'] as String?;
    _varianceUnitsFemale = snapshotData['varianceUnitsFemale'] as String?;
    _equipmentInfo = snapshotData['equipmentInfo'] as String?;
    _procedure = getDataList(snapshotData['procedure']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('tests');

  static Stream<TestsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TestsRecord.fromSnapshot(s));

  static Future<TestsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TestsRecord.fromSnapshot(s));

  static TestsRecord fromSnapshot(DocumentSnapshot snapshot) => TestsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TestsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TestsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TestsRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createTestsRecordData({
  int? price,
  String? name,
  bool? homeTest,
  String? description,
  double? duration,
  double? durationResults,
  String? category,
  bool? isAvailable,
  DateTime? updateDate,
  String? updateRole,
  String? varianceMale,
  String? varianceFemale,
  String? varianceUnitsMale,
  String? varianceUnitsFemale,
  String? equipmentInfo,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'price': price,
      'name': name,
      'home_test': homeTest,
      'description': description,
      'duration': duration,
      'duration_results': durationResults,
      'category': category,
      'is_available': isAvailable,
      'update_date': updateDate,
      'updateRole': updateRole,
      'varianceMale': varianceMale,
      'varianceFemale': varianceFemale,
      'varianceUnitsMale': varianceUnitsMale,
      'varianceUnitsFemale': varianceUnitsFemale,
      'equipmentInfo': equipmentInfo,
    }.withoutNulls,
  );

  return firestoreData;
}
