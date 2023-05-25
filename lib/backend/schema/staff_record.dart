import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StaffRecord extends FirestoreRecord {
  StaffRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "first_name" field.
  String? _firstName;
  String get firstName => _firstName ?? '';
  bool hasFirstName() => _firstName != null;

  // "last_name" field.
  String? _lastName;
  String get lastName => _lastName ?? '';
  bool hasLastName() => _lastName != null;

  // "role" field.
  String? _role;
  String get role => _role ?? '';
  bool hasRole() => _role != null;

  // "UserRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "createDate" field.
  DateTime? _createDate;
  DateTime? get createDate => _createDate;
  bool hasCreateDate() => _createDate != null;

  // "createUser" field.
  DocumentReference? _createUser;
  DocumentReference? get createUser => _createUser;
  bool hasCreateUser() => _createUser != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _firstName = snapshotData['first_name'] as String?;
    _lastName = snapshotData['last_name'] as String?;
    _role = snapshotData['role'] as String?;
    _userRef = snapshotData['UserRef'] as DocumentReference?;
    _createDate = snapshotData['createDate'] as DateTime?;
    _createUser = snapshotData['createUser'] as DocumentReference?;
    _displayName = snapshotData['display_name'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('staff');

  static Stream<StaffRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => StaffRecord.fromSnapshot(s));

  static Future<StaffRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => StaffRecord.fromSnapshot(s));

  static StaffRecord fromSnapshot(DocumentSnapshot snapshot) => StaffRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static StaffRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      StaffRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'StaffRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createStaffRecordData({
  String? email,
  String? firstName,
  String? lastName,
  String? role,
  DocumentReference? userRef,
  DateTime? createDate,
  DocumentReference? createUser,
  String? displayName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'first_name': firstName,
      'last_name': lastName,
      'role': role,
      'UserRef': userRef,
      'createDate': createDate,
      'createUser': createUser,
      'display_name': displayName,
    }.withoutNulls,
  );

  return firestoreData;
}
