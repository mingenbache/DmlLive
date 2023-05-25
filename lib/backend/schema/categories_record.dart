import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CategoriesRecord extends FirestoreRecord {
  CategoriesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "categories" field.
  List<String>? _categories;
  List<String> get categories => _categories ?? const [];
  bool hasCategories() => _categories != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "ispackage_Category" field.
  bool? _ispackageCategory;
  bool get ispackageCategory => _ispackageCategory ?? false;
  bool hasIspackageCategory() => _ispackageCategory != null;

  // "istest_Category" field.
  bool? _istestCategory;
  bool get istestCategory => _istestCategory ?? false;
  bool hasIstestCategory() => _istestCategory != null;

  void _initializeFields() {
    _categories = getDataList(snapshotData['categories']);
    _name = snapshotData['name'] as String?;
    _ispackageCategory = snapshotData['ispackage_Category'] as bool?;
    _istestCategory = snapshotData['istest_Category'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('categories');

  static Stream<CategoriesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CategoriesRecord.fromSnapshot(s));

  static Future<CategoriesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CategoriesRecord.fromSnapshot(s));

  static CategoriesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CategoriesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CategoriesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CategoriesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CategoriesRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createCategoriesRecordData({
  String? name,
  bool? ispackageCategory,
  bool? istestCategory,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'ispackage_Category': ispackageCategory,
      'istest_Category': istestCategory,
    }.withoutNulls,
  );

  return firestoreData;
}
