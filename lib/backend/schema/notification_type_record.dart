import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'notification_type_record.g.dart';

abstract class NotificationTypeRecord
    implements Built<NotificationTypeRecord, NotificationTypeRecordBuilder> {
  static Serializer<NotificationTypeRecord> get serializer =>
      _$notificationTypeRecordSerializer;

  @nullable
  String get context;

  @nullable
  @BuiltValueField(wireName: 'page_to_open')
  String get pageToOpen;

  @nullable
  String get type;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(NotificationTypeRecordBuilder builder) =>
      builder
        ..context = ''
        ..pageToOpen = ''
        ..type = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('notification_type');

  static Stream<NotificationTypeRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<NotificationTypeRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  NotificationTypeRecord._();
  factory NotificationTypeRecord(
          [void Function(NotificationTypeRecordBuilder) updates]) =
      _$NotificationTypeRecord;

  static NotificationTypeRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createNotificationTypeRecordData({
  String context,
  String pageToOpen,
  String type,
}) =>
    serializers.toFirestore(
        NotificationTypeRecord.serializer,
        NotificationTypeRecord((n) => n
          ..context = context
          ..pageToOpen = pageToOpen
          ..type = type));
