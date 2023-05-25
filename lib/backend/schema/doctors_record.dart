import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DoctorsRecord extends FirestoreRecord {
  DoctorsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "names" field.
  List<String>? _names;
  List<String> get names => _names ?? const [];
  bool hasNames() => _names != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  // "phonenumber" field.
  String? _phonenumber;
  String get phonenumber => _phonenumber ?? '';
  bool hasPhonenumber() => _phonenumber != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "emailaddress" field.
  String? _emailaddress;
  String get emailaddress => _emailaddress ?? '';
  bool hasEmailaddress() => _emailaddress != null;

  void _initializeFields() {
    _names = getDataList(snapshotData['names']);
    _address = snapshotData['address'] as String?;
    _phonenumber = snapshotData['phonenumber'] as String?;
    _name = snapshotData['name'] as String?;
    _emailaddress = snapshotData['emailaddress'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('doctors');

  static Stream<DoctorsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DoctorsRecord.fromSnapshot(s));

  static Future<DoctorsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DoctorsRecord.fromSnapshot(s));

  static DoctorsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DoctorsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DoctorsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DoctorsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DoctorsRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createDoctorsRecordData({
  String? address,
  String? phonenumber,
  String? name,
  String? emailaddress,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'address': address,
      'phonenumber': phonenumber,
      'name': name,
      'emailaddress': emailaddress,
    }.withoutNulls,
  );

  return firestoreData;
}
