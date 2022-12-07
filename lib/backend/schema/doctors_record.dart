import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'doctors_record.g.dart';

abstract class DoctorsRecord
    implements Built<DoctorsRecord, DoctorsRecordBuilder> {
  static Serializer<DoctorsRecord> get serializer => _$doctorsRecordSerializer;

  BuiltList<String>? get names;

  String? get address;

  String? get phonenumber;

  String? get name;

  String? get emailaddress;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(DoctorsRecordBuilder builder) => builder
    ..names = ListBuilder()
    ..address = ''
    ..phonenumber = ''
    ..name = ''
    ..emailaddress = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('doctors');

  static Stream<DoctorsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<DoctorsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  DoctorsRecord._();
  factory DoctorsRecord([void Function(DoctorsRecordBuilder) updates]) =
      _$DoctorsRecord;

  static DoctorsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createDoctorsRecordData({
  String? address,
  String? phonenumber,
  String? name,
  String? emailaddress,
}) {
  final firestoreData = serializers.toFirestore(
    DoctorsRecord.serializer,
    DoctorsRecord(
      (d) => d
        ..names = null
        ..address = address
        ..phonenumber = phonenumber
        ..name = name
        ..emailaddress = emailaddress,
    ),
  );

  return firestoreData;
}
