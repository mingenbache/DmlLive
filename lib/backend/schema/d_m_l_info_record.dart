import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'd_m_l_info_record.g.dart';

abstract class DMLInfoRecord
    implements Built<DMLInfoRecord, DMLInfoRecordBuilder> {
  static Serializer<DMLInfoRecord> get serializer => _$dMLInfoRecordSerializer;

  @nullable
  String get url;

  @nullable
  String get primaryEmail;

  @nullable
  @BuiltValueField(wireName: 'phone_numbers')
  BuiltList<String> get phoneNumbers;

  @nullable
  @BuiltValueField(wireName: 'DML_Logo')
  String get dMLLogo;

  @nullable
  BuiltList<String> get footerReferences;

  @nullable
  String get location;

  @nullable
  bool get isMain;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(DMLInfoRecordBuilder builder) => builder
    ..url = ''
    ..primaryEmail = ''
    ..phoneNumbers = ListBuilder()
    ..dMLLogo = ''
    ..footerReferences = ListBuilder()
    ..location = ''
    ..isMain = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('DML_Info');

  static Stream<DMLInfoRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<DMLInfoRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  DMLInfoRecord._();
  factory DMLInfoRecord([void Function(DMLInfoRecordBuilder) updates]) =
      _$DMLInfoRecord;

  static DMLInfoRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createDMLInfoRecordData({
  String url,
  String primaryEmail,
  String dMLLogo,
  String location,
  bool isMain,
}) =>
    serializers.toFirestore(
        DMLInfoRecord.serializer,
        DMLInfoRecord((d) => d
          ..url = url
          ..primaryEmail = primaryEmail
          ..phoneNumbers = null
          ..dMLLogo = dMLLogo
          ..footerReferences = null
          ..location = location
          ..isMain = isMain));
