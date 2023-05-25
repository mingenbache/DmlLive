import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NotificationTypeRecord extends FirestoreRecord {
  NotificationTypeRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "context" field.
  String? _context;
  String get context => _context ?? '';
  bool hasContext() => _context != null;

  // "page_to_open" field.
  String? _pageToOpen;
  String get pageToOpen => _pageToOpen ?? '';
  bool hasPageToOpen() => _pageToOpen != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  void _initializeFields() {
    _context = snapshotData['context'] as String?;
    _pageToOpen = snapshotData['page_to_open'] as String?;
    _type = snapshotData['type'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('notification_type');

  static Stream<NotificationTypeRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NotificationTypeRecord.fromSnapshot(s));

  static Future<NotificationTypeRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => NotificationTypeRecord.fromSnapshot(s));

  static NotificationTypeRecord fromSnapshot(DocumentSnapshot snapshot) =>
      NotificationTypeRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NotificationTypeRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NotificationTypeRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NotificationTypeRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createNotificationTypeRecordData({
  String? context,
  String? pageToOpen,
  String? type,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'context': context,
      'page_to_open': pageToOpen,
      'type': type,
    }.withoutNulls,
  );

  return firestoreData;
}
