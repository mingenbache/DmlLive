import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "role" field.
  String? _role;
  String get role => _role ?? '';
  bool hasRole() => _role != null;

  // "first_name" field.
  String? _firstName;
  String get firstName => _firstName ?? '';
  bool hasFirstName() => _firstName != null;

  // "last_name" field.
  String? _lastName;
  String get lastName => _lastName ?? '';
  bool hasLastName() => _lastName != null;

  // "sex" field.
  String? _sex;
  String get sex => _sex ?? '';
  bool hasSex() => _sex != null;

  // "d_o_b" field.
  DateTime? _dOB;
  DateTime? get dOB => _dOB;
  bool hasDOB() => _dOB != null;

  // "password" field.
  String? _password;
  String get password => _password ?? '';
  bool hasPassword() => _password != null;

  // "current_booking" field.
  DocumentReference? _currentBooking;
  DocumentReference? get currentBooking => _currentBooking;
  bool hasCurrentBookingField() => _currentBooking != null;

  // "has_current_booking" field.
  bool? _hasCurrentBooking;
  bool get hasCurrentBooking => _hasCurrentBooking ?? false;
  bool hasHasCurrentBooking() => _hasCurrentBooking != null;

  // "isStaff" field.
  bool? _isStaff;
  bool get isStaff => _isStaff ?? false;
  bool hasIsStaff() => _isStaff != null;

  // "lastLogin" field.
  DateTime? _lastLogin;
  DateTime? get lastLogin => _lastLogin;
  bool hasLastLogin() => _lastLogin != null;

  // "hasInitAccount" field.
  bool? _hasInitAccount;
  bool get hasInitAccount => _hasInitAccount ?? false;
  bool hasHasInitAccount() => _hasInitAccount != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _role = snapshotData['role'] as String?;
    _firstName = snapshotData['first_name'] as String?;
    _lastName = snapshotData['last_name'] as String?;
    _sex = snapshotData['sex'] as String?;
    _dOB = snapshotData['d_o_b'] as DateTime?;
    _password = snapshotData['password'] as String?;
    _currentBooking = snapshotData['current_booking'] as DocumentReference?;
    _hasCurrentBooking = snapshotData['has_current_booking'] as bool?;
    _isStaff = snapshotData['isStaff'] as bool?;
    _lastLogin = snapshotData['lastLogin'] as DateTime?;
    _hasInitAccount = snapshotData['hasInitAccount'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? role,
  String? firstName,
  String? lastName,
  String? sex,
  DateTime? dOB,
  String? password,
  DocumentReference? currentBooking,
  bool? hasCurrentBooking,
  bool? isStaff,
  DateTime? lastLogin,
  bool? hasInitAccount,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'role': role,
      'first_name': firstName,
      'last_name': lastName,
      'sex': sex,
      'd_o_b': dOB,
      'password': password,
      'current_booking': currentBooking,
      'has_current_booking': hasCurrentBooking,
      'isStaff': isStaff,
      'lastLogin': lastLogin,
      'hasInitAccount': hasInitAccount,
    }.withoutNulls,
  );

  return firestoreData;
}
