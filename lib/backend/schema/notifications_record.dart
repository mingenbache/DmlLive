import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'notifications_record.g.dart';

abstract class NotificationsRecord
    implements Built<NotificationsRecord, NotificationsRecordBuilder> {
  static Serializer<NotificationsRecord> get serializer =>
      _$notificationsRecordSerializer;

  @BuiltValueField(wireName: 'user_role')
  String? get userRole;

  String? get message;

  @BuiltValueField(wireName: 'users_receiving')
  BuiltList<DocumentReference>? get usersReceiving;

  @BuiltValueField(wireName: 'created_date')
  DateTime? get createdDate;

  bool? get isSeen;

  BuiltList<DocumentReference>? get usersSeen;

  bool? get isBooking;

  bool? get isTest;

  String? get type;

  DocumentReference? get bookingRef;

  DocumentReference? get userRef;

  DocumentReference? get testedtestref;

  DocumentReference? get staffref;

  DocumentReference? get reportref;

  DocumentReference? get testref;

  DocumentReference? get testpackageref;

  DocumentReference? get actionstaffuser;

  bool? get istestedtest;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(NotificationsRecordBuilder builder) => builder
    ..userRole = ''
    ..message = ''
    ..usersReceiving = ListBuilder()
    ..isSeen = false
    ..usersSeen = ListBuilder()
    ..isBooking = false
    ..isTest = false
    ..type = ''
    ..istestedtest = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('notifications');

  static Stream<NotificationsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<NotificationsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  NotificationsRecord._();
  factory NotificationsRecord(
          [void Function(NotificationsRecordBuilder) updates]) =
      _$NotificationsRecord;

  static NotificationsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
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
  final firestoreData = serializers.toFirestore(
    NotificationsRecord.serializer,
    NotificationsRecord(
      (n) => n
        ..userRole = userRole
        ..message = message
        ..usersReceiving = null
        ..createdDate = createdDate
        ..isSeen = isSeen
        ..usersSeen = null
        ..isBooking = isBooking
        ..isTest = isTest
        ..type = type
        ..bookingRef = bookingRef
        ..userRef = userRef
        ..testedtestref = testedtestref
        ..staffref = staffref
        ..reportref = reportref
        ..testref = testref
        ..testpackageref = testpackageref
        ..actionstaffuser = actionstaffuser
        ..istestedtest = istestedtest,
    ),
  );

  return firestoreData;
}
