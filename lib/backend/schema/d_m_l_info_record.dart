import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DMLInfoRecord extends FirestoreRecord {
  DMLInfoRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "url" field.
  String? _url;
  String get url => _url ?? '';
  bool hasUrl() => _url != null;

  // "primaryEmail" field.
  String? _primaryEmail;
  String get primaryEmail => _primaryEmail ?? '';
  bool hasPrimaryEmail() => _primaryEmail != null;

  // "phone_numbers" field.
  List<String>? _phoneNumbers;
  List<String> get phoneNumbers => _phoneNumbers ?? const [];
  bool hasPhoneNumbers() => _phoneNumbers != null;

  // "DML_Logo" field.
  String? _dMLLogo;
  String get dMLLogo => _dMLLogo ?? '';
  bool hasDMLLogo() => _dMLLogo != null;

  // "footerReferences" field.
  List<String>? _footerReferences;
  List<String> get footerReferences => _footerReferences ?? const [];
  bool hasFooterReferences() => _footerReferences != null;

  // "location" field.
  String? _location;
  String get location => _location ?? '';
  bool hasLocation() => _location != null;

  // "isMain" field.
  bool? _isMain;
  bool get isMain => _isMain ?? false;
  bool hasIsMain() => _isMain != null;

  void _initializeFields() {
    _url = snapshotData['url'] as String?;
    _primaryEmail = snapshotData['primaryEmail'] as String?;
    _phoneNumbers = getDataList(snapshotData['phone_numbers']);
    _dMLLogo = snapshotData['DML_Logo'] as String?;
    _footerReferences = getDataList(snapshotData['footerReferences']);
    _location = snapshotData['location'] as String?;
    _isMain = snapshotData['isMain'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('DML_Info');

  static Stream<DMLInfoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DMLInfoRecord.fromSnapshot(s));

  static Future<DMLInfoRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DMLInfoRecord.fromSnapshot(s));

  static DMLInfoRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DMLInfoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DMLInfoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DMLInfoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DMLInfoRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createDMLInfoRecordData({
  String? url,
  String? primaryEmail,
  String? dMLLogo,
  String? location,
  bool? isMain,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'url': url,
      'primaryEmail': primaryEmail,
      'DML_Logo': dMLLogo,
      'location': location,
      'isMain': isMain,
    }.withoutNulls,
  );

  return firestoreData;
}
