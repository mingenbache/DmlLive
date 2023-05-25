import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NotificationsRecord extends FirestoreRecord {
  NotificationsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user_role" field.
  String? _userRole;
  String get userRole => _userRole ?? '';
  bool hasUserRole() => _userRole != null;

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  bool hasMessage() => _message != null;

  // "users_receiving" field.
  List<DocumentReference>? _usersReceiving;
  List<DocumentReference> get usersReceiving => _usersReceiving ?? const [];
  bool hasUsersReceiving() => _usersReceiving != null;

  // "created_date" field.
  DateTime? _createdDate;
  DateTime? get createdDate => _createdDate;
  bool hasCreatedDate() => _createdDate != null;

  // "isSeen" field.
  bool? _isSeen;
  bool get isSeen => _isSeen ?? false;
  bool hasIsSeen() => _isSeen != null;

  // "usersSeen" field.
  List<DocumentReference>? _usersSeen;
  List<DocumentReference> get usersSeen => _usersSeen ?? const [];
  bool hasUsersSeen() => _usersSeen != null;

  // "isBooking" field.
  bool? _isBooking;
  bool get isBooking => _isBooking ?? false;
  bool hasIsBooking() => _isBooking != null;

  // "isTest" field.
  bool? _isTest;
  bool get isTest => _isTest ?? false;
  bool hasIsTest() => _isTest != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "bookingRef" field.
  DocumentReference? _bookingRef;
  DocumentReference? get bookingRef => _bookingRef;
  bool hasBookingRef() => _bookingRef != null;

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "testedtestref" field.
  DocumentReference? _testedtestref;
  DocumentReference? get testedtestref => _testedtestref;
  bool hasTestedtestref() => _testedtestref != null;

  // "staffref" field.
  DocumentReference? _staffref;
  DocumentReference? get staffref => _staffref;
  bool hasStaffref() => _staffref != null;

  // "reportref" field.
  DocumentReference? _reportref;
  DocumentReference? get reportref => _reportref;
  bool hasReportref() => _reportref != null;

  // "testref" field.
  DocumentReference? _testref;
  DocumentReference? get testref => _testref;
  bool hasTestref() => _testref != null;

  // "testpackageref" field.
  DocumentReference? _testpackageref;
  DocumentReference? get testpackageref => _testpackageref;
  bool hasTestpackageref() => _testpackageref != null;

  // "actionstaffuser" field.
  DocumentReference? _actionstaffuser;
  DocumentReference? get actionstaffuser => _actionstaffuser;
  bool hasActionstaffuser() => _actionstaffuser != null;

  // "istestedtest" field.
  bool? _istestedtest;
  bool get istestedtest => _istestedtest ?? false;
  bool hasIstestedtest() => _istestedtest != null;

  void _initializeFields() {
    _userRole = snapshotData['user_role'] as String?;
    _message = snapshotData['message'] as String?;
    _usersReceiving = getDataList(snapshotData['users_receiving']);
    _createdDate = snapshotData['created_date'] as DateTime?;
    _isSeen = snapshotData['isSeen'] as bool?;
    _usersSeen = getDataList(snapshotData['usersSeen']);
    _isBooking = snapshotData['isBooking'] as bool?;
    _isTest = snapshotData['isTest'] as bool?;
    _type = snapshotData['type'] as String?;
    _bookingRef = snapshotData['bookingRef'] as DocumentReference?;
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _testedtestref = snapshotData['testedtestref'] as DocumentReference?;
    _staffref = snapshotData['staffref'] as DocumentReference?;
    _reportref = snapshotData['reportref'] as DocumentReference?;
    _testref = snapshotData['testref'] as DocumentReference?;
    _testpackageref = snapshotData['testpackageref'] as DocumentReference?;
    _actionstaffuser = snapshotData['actionstaffuser'] as DocumentReference?;
    _istestedtest = snapshotData['istestedtest'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('notifications');

  static Stream<NotificationsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NotificationsRecord.fromSnapshot(s));

  static Future<NotificationsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NotificationsRecord.fromSnapshot(s));

  static NotificationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      NotificationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NotificationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NotificationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NotificationsRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createNotificationsRecordData({
  String? userRole,
  String? message,
  DateTime? createdDate,
  bool? isSeen,
  bool? isBooking,
  bool? isTest,
  String? type,
  DocumentReference? bookingRef,
  DocumentReference? userRef,
  DocumentReference? testedtestref,
  DocumentReference? staffref,
  DocumentReference? reportref,
  DocumentReference? testref,
  DocumentReference? testpackageref,
  DocumentReference? actionstaffuser,
  bool? istestedtest,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user_role': userRole,
      'message': message,
      'created_date': createdDate,
      'isSeen': isSeen,
      'isBooking': isBooking,
      'isTest': isTest,
      'type': type,
      'bookingRef': bookingRef,
      'userRef': userRef,
      'testedtestref': testedtestref,
      'staffref': staffref,
      'reportref': reportref,
      'testref': testref,
      'testpackageref': testpackageref,
      'actionstaffuser': actionstaffuser,
      'istestedtest': istestedtest,
    }.withoutNulls,
  );

  return firestoreData;
}
