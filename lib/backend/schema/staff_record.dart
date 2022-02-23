import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'staff_record.g.dart';

abstract class StaffRecord implements Built<StaffRecord, StaffRecordBuilder> {
  static Serializer<StaffRecord> get serializer => _$staffRecordSerializer;

  @nullable
  String get email;

  @nullable
  @BuiltValueField(wireName: 'first_name')
  String get firstName;

  @nullable
  @BuiltValueField(wireName: 'last_name')
  String get lastName;

  @nullable
  String get role;

  @nullable
  @BuiltValueField(wireName: 'UserRef')
  DocumentReference get userRef;

  @nullable
  DateTime get createDate;

  @nullable
  DocumentReference get createUser;

  @nullable
  @BuiltValueField(wireName: 'display_name')
  String get displayName;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(StaffRecordBuilder builder) => builder
    ..email = ''
    ..firstName = ''
    ..lastName = ''
    ..role = ''
    ..displayName = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('staff');

  static Stream<StaffRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<StaffRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  StaffRecord._();
  factory StaffRecord([void Function(StaffRecordBuilder) updates]) =
      _$StaffRecord;

  static StaffRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createStaffRecordData({
  String email,
  String firstName,
  String lastName,
  String role,
  DocumentReference userRef,
  DateTime createDate,
  DocumentReference createUser,
  String displayName,
}) =>
    serializers.toFirestore(
        StaffRecord.serializer,
        StaffRecord((s) => s
          ..email = email
          ..firstName = firstName
          ..lastName = lastName
          ..role = role
          ..userRef = userRef
          ..createDate = createDate
          ..createUser = createUser
          ..displayName = displayName));
