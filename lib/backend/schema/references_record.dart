import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ReferencesRecord extends FirestoreRecord {
  ReferencesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "doctors" field.
  List<DocumentReference>? _doctors;
  List<DocumentReference> get doctors => _doctors ?? const [];
  bool hasDoctors() => _doctors != null;

  void _initializeFields() {
    _doctors = getDataList(snapshotData['doctors']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('references');

  static Stream<ReferencesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ReferencesRecord.fromSnapshot(s));

  static Future<ReferencesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ReferencesRecord.fromSnapshot(s));

  static ReferencesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ReferencesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ReferencesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ReferencesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ReferencesRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createReferencesRecordData() {
  final firestoreData = mapToFirestore(
    <String, dynamic>{}.withoutNulls,
  );

  return firestoreData;
}
