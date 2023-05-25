import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MachinesRecord extends FirestoreRecord {
  MachinesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "metadata" field.
  String? _metadata;
  String get metadata => _metadata ?? '';
  bool hasMetadata() => _metadata != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _metadata = snapshotData['metadata'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('machines');

  static Stream<MachinesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MachinesRecord.fromSnapshot(s));

  static Future<MachinesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MachinesRecord.fromSnapshot(s));

  static MachinesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MachinesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MachinesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MachinesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MachinesRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createMachinesRecordData({
  String? name,
  String? metadata,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'metadata': metadata,
    }.withoutNulls,
  );

  return firestoreData;
}
