import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'notifications_record.g.dart';

abstract class NotificationsRecord
    implements Built<NotificationsRecord, NotificationsRecordBuilder> {
  static Serializer<NotificationsRecord> get serializer =>
      _$notificationsRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'user_role')
  String get userRole;

  @nullable
  String get message;

  @nullable
  @BuiltValueField(wireName: 'users_receiving')
  BuiltList<DocumentReference> get usersReceiving;

  @nullable
  @BuiltValueField(wireName: 'created_date')
  DateTime get createdDate;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(NotificationsRecordBuilder builder) => builder
    ..userRole = ''
    ..message = ''
    ..usersReceiving = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('notifications');

  static Stream<NotificationsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<NotificationsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  NotificationsRecord._();
  factory NotificationsRecord(
          [void Function(NotificationsRecordBuilder) updates]) =
      _$NotificationsRecord;

  static NotificationsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createNotificationsRecordData({
  String userRole,
  String message,
  DateTime createdDate,
}) =>
    serializers.toFirestore(
        NotificationsRecord.serializer,
        NotificationsRecord((n) => n
          ..userRole = userRole
          ..message = message
          ..usersReceiving = null
          ..createdDate = createdDate));
